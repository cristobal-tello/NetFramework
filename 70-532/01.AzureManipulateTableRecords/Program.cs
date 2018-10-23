using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;

namespace _01.AzureManipulateTableRecords
{
    class Program
    {
        static void Main(string[] args)
        {
            // Dont forget to download Azure Storage Explorer
            // https://azure.microsoft.com/es-es/features/storage-explorer/

            CreateTable();

            AddEntity();

            GetPartition();

            Console.WriteLine("Press to finish...");

            Console.ReadLine();
        }

        private static void GetPartition()
        {
            var storageAccountName = "stoacuweb";

            var storageAccountConnectionString = CloudConfigurationManager.GetSetting(storageAccountName + "_AzureStorageConnectionString");
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(storageAccountConnectionString);

            var tableClient = storageAccount.CreateCloudTableClient();
            var table = tableClient.GetTableReference("DemoTable");

            TableQuery<CustomerEntity> query = new TableQuery<CustomerEntity>().Where(TableQuery.GenerateFilterCondition("PartitionKey", QueryComparisons.Equal, "Tello"));


            TableContinuationToken token = null;
            do
            {
                TableQuerySegment<CustomerEntity> resultSegment = table.ExecuteQuerySegmented(query, token);
                foreach (CustomerEntity customer in resultSegment.Results)
                {
                    Console.WriteLine(customer.PartitionKey + ", " + customer.RowKey + ", " + customer.Phone);
                }
            }
            while (token != null);

            Console.WriteLine("GetPartition done...");
        }

        private static void AddEntity()
        {
            var storageAccountName = "stoacuweb";

            var storageAccountConnectionString = CloudConfigurationManager.GetSetting(storageAccountName + "_AzureStorageConnectionString");
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(storageAccountConnectionString);

            var tableClient = storageAccount.CreateCloudTableClient();
            var table = tableClient.GetTableReference("DemoTable");

            // Partition key always needs be the same
            CustomerEntity customer1 = new CustomerEntity("Tello", "Cristóbal", "977221133");
            CustomerEntity customer2 = new CustomerEntity("Tello", "Eric", "12345678");

            var batchOperation = new TableBatchOperation();

            batchOperation.Insert(customer1);
            batchOperation.Insert(customer2);

            IList<TableResult> results = table.ExecuteBatch(batchOperation);

            foreach (var result in results)
            {
                Console.WriteLine(result.ToString());
            }

            Console.WriteLine("AddEntity done...");
        }

        private static void CreateTable()
        {
            var storageAccountName = "stoacuweb";

            var storageAccountConnectionString = CloudConfigurationManager.GetSetting(storageAccountName + "_AzureStorageConnectionString");
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(storageAccountConnectionString);

            var tableClient = storageAccount.CreateCloudTableClient();
            var table = tableClient.GetTableReference("DemoTable");

            if (table.CreateIfNotExists())
            {
                Console.WriteLine("Table created sucessfully");
            }

            Console.WriteLine("CreateTable done...");
        }
    }
}