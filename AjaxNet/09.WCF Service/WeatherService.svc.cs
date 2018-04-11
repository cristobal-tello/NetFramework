﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

// Ajax WCF Service
namespace WebAppVS12
{
    [ServiceContract(Namespace = "http://www.cristobaltello.es/ws")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class WeatherService
    {
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract]
        public string GetForecast(string zipCode)
        {
            var random = new Random();
            
            string foreCast="";
            
            switch(random.Next(3))
            {
                case 0:
                    foreCast="Sunny and warm";
                    break;
                case 1:
                    foreCast="Cloudy and cold";
                    break;
                case 2:
                    foreCast="Very hot and humid";
                    break;
            }

            return foreCast;
        }
    }
}
