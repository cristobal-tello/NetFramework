using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _04.ManageBlobs
{
    class Program
    {
        static void Main(string[] args)
        {
            
            // From nuGet, we add: WindowsAzure.Storage, Microsoft.WindowsAzure.ConfigurationManager
            var storageAccountConnectionString = CloudConfigurationManager.GetSetting("StorageConnectionString");
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(storageAccountConnectionString);

            CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();
            CloudBlobContainer container = blobClient.GetContainerReference("images");

            var blobs = new List<BlobImage>();

            foreach (var blob in container.ListBlobs())
            {
                if (blob.GetType() == typeof(CloudBlockBlob))
                {
                    var sasToken = GetSASToken(storageAccount);
                    // You can use AccessPolicy instead Token and usse next code:
                    // var sasByPolicyIdentifier = container.GetSharedAccessSignature(null, "<TYPE HERE THE IDENTIFIER OF YOUR POLICIY");

                    blobs.Add(new BlobImage { BlobUri = blob.Uri.ToString() });
                    Console.WriteLine("Azure url: {0}", blob.Uri.ToString());
                    Console.WriteLine("Azure url+token: {0}{1}", blob.Uri.ToString(), sasToken);
                }
            }

            Console.WriteLine("Finish...");
            Console.ReadLine();
        }

        static string GetSASToken(CloudStorageAccount storageAccount)
        {
            SharedAccessAccountPolicy policy = new SharedAccessAccountPolicy
            {
                Permissions = SharedAccessAccountPermissions.Read,
                Services = SharedAccessAccountServices.Blob,
                ResourceTypes = SharedAccessAccountResourceTypes.Object,
                SharedAccessExpiryTime = DateTime.Now.AddMinutes(30),
                Protocols = SharedAccessProtocol.HttpsOrHttp
            };

            return storageAccount.GetSharedAccessSignature(policy);

        }
    }

}
