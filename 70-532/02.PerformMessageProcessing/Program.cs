using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Queue;
using System;

namespace _02.PerformMessageProcessing
{
    class Program
    {
        // In this example, we don't use Connect Service
        // Instead we use nuGet. We add: WindowsAzure.Storage, Microsoft.WindowsAzure.ConfigurationManager
        static void Main(string[] args)
        {
            var storageAccountConnectionString = CloudConfigurationManager.GetSetting("StorageConnectionString");
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(storageAccountConnectionString);

            CloudQueueClient queueClient = storageAccount.CreateCloudQueueClient();

            CloudQueue queue = queueClient.GetQueueReference("myqueue");

            queue.CreateIfNotExists();

            CloudQueueMessage message = new CloudQueueMessage("Add to queue 9!!");
            queue.AddMessage(message);

            CloudQueueMessage peekMessage = queue.PeekMessage();

            Console.WriteLine(peekMessage.AsString);

            Console.WriteLine("Looping");
            foreach (CloudQueueMessage msg in queue.GetMessages(5, TimeSpan.FromMinutes(5)))
            {
                Console.WriteLine(msg.AsString);
            }

            Console.WriteLine("Finish");
            Console.ReadLine();
        }
    }
}
