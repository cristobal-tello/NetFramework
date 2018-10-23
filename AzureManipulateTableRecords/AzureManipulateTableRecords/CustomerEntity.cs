using Microsoft.WindowsAzure.Storage.Table;

namespace _01AzureManipulateTableRecords
{
    internal class CustomerEntity : TableEntity
    {
        string phoneNumber;
        public CustomerEntity()
        { }

        public CustomerEntity(string surname, string name, string phoneNumber)
        {
            this.PartitionKey = surname;
            this.RowKey = name;
            
            this.phoneNumber = phoneNumber;
        }

        public string Phone
        {
            get
            {
                return this.phoneNumber;
            }
            set
            {
                this.phoneNumber = value;
            }
        }
    }
}