using Microsoft.Azure.Documents;
using Microsoft.Azure.Documents.Client;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace ManageAzureCosmosDB
{
    class Program
    {
        static void Main(string[] args)
        {
            // Don't forget to check firewall rules to enable access to CosmosDB

            string EndPointUrl = "https://cosmosdbtoful.documents.azure.com:443/";
            string PrimaryKey = "mzlaDdLjnbcvLcrtr05YY9GvgCfdQtXljylQfjcmOS93o5MRcHpqEg4oBl9z7OmEAAcjB1VCzxtFHq5XOqqEEw==";
            // Database db;
            //DocumentCollection dc;

            using (var client = new DocumentClient(new Uri(EndPointUrl), PrimaryKey))
            {
                var selectedDbName = "db1";

                //dc = client.CreateDocumentCollectionQuery(db.CollectionsLink, "").AsEnumerable().First();

                ListDB(client);

                // Create db in cosmosDB
                //Console.WriteLine("Pre CreatedDB...");
                //Task t = CreateDB(client, selectedDb);      // Create db,if exist in debug mode check outptput window
                //Console.WriteLine("Post CreatedDB...");

                // List collection of selected db
                ListCol(client, selectedDbName);

                // Create a collection in selected db
                var collectionName = string.Format("Collection-{0}", DateTime.Now.ToLongTimeString());
                Task createColTask = CreateCol(client, selectedDbName, collectionName);
                createColTask.Wait();

                Task createDocumentTask = CreateDocument(client, selectedDbName, collectionName);

                Console.WriteLine("Finish");
                Console.ReadLine();
            }
        }

        async static Task CreateDB(DocumentClient client, String newDbName)
        {
            Console.WriteLine("CreatedDB start");
            var newDb = new Database
            {
                Id = newDbName
            };

            var result = await client.CreateDatabaseAsync(newDb);
            var dbCreated = result.Resource;
            Console.WriteLine("CreatedDB finish...:" + dbCreated.Id + " - " + dbCreated.ResourceId);

        }

        static void ListDB(DocumentClient client)
        {
            Console.WriteLine("ListDB start");

            var dbs = client.CreateDatabaseQuery().ToList();
            foreach (var db in dbs)
            {
                Console.WriteLine("Db Id: {0}, Db ReS Id: {1}", db.Id, db.ResourceId);
            }

            Console.WriteLine("ListDB end");
        }

        static void ListCol(DocumentClient client, string dbName)
        {
            Console.WriteLine("ListCol start");

            var sql = string.Format("SELECT * FROM c WHERE c.id = '{0}'", dbName);
            Database selectedDb = client.CreateDatabaseQuery(sql).AsEnumerable().First();
            var dbs = client.CreateDocumentCollectionQuery(selectedDb.CollectionsLink);
            foreach (var db in dbs)
            {
                Console.WriteLine("Db Id: {0}, Db ReS Id: {1}", db.Id, db.ResourceId);
            }

            Console.WriteLine("ListCol end");
        }

        async static Task CreateCol(DocumentClient client, string dbName, string newCol)
        {
            Console.WriteLine("CreateCol start");

            var sql = string.Format("SELECT * FROM c WHERE c.id = '{0}'", dbName);
            Database selectedDb = client.CreateDatabaseQuery(sql).AsEnumerable().First();

            var newCollection = new DocumentCollection
            {
                Id = newCol
            };

            var options = new RequestOptions
            {
                OfferThroughput = 400
            };

            var result = await client.CreateDocumentCollectionAsync(selectedDb.CollectionsLink, newCollection, options);
            var collection = result.Resource;

            Console.WriteLine("CreateCol end");

        }

        async static Task CreateDocument(DocumentClient client, string dbName, string collectionName)
        {
            Console.WriteLine("CreateDocument start");

            dynamic newDocument = new
            {
                id = "c01",
                contact = new
                {
                    first = "Ricky",
                    last = "Martin",
                    email = "rmartin@bla.com"
                },
                phone = "555-555-32332"
            };

            var sql = string.Format("SELECT * FROM c WHERE c.id = '{0}'", dbName);
            Database selectedDb = client.CreateDatabaseQuery(sql).AsEnumerable().First();

            sql = string.Format("SELECT * FROM c WHERE c.id = '{0}'", collectionName);
            DocumentCollection selectedCol = client.CreateDocumentCollectionQuery(selectedDb.CollectionsLink, sql).AsEnumerable().First();

            var result = await client.CreateDocumentAsync(selectedCol.SelfLink, newDocument);
            var doc = result.Resource;

            Console.WriteLine("CreateDocument end");
        }
    }
}
