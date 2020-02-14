using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.WebServices.Data
{
    public class WebServiceRequestData
    {
        public static string GetServiceURI(string RequestName)
        {
            switch(RequestName.ToUpper())
            {
                case "ADDNEWPATIENT":
                    return @"http://{ENDPOINT}_InterChgWS/SiteService.asmx?";
                case "CONSUMEODM1_STRTRANSACTIONAL":
                case "CONSUMEODM1_2STR_ADDNEWPATIENTS":
                    return @"http://{ENDPOINT}_InterChgWS/CDISCService.asmx?";
                case "GETSTUDYMETADATAODM132":
                    return @"http://{ENDPOINT}_InterChgWS/PatientAndOperationalDataEventing.asmx?";
                case "SETEVENTDATE":
                    return @"http://{ENDPOINT}_InterChgWS/PatientEventService.asmx?";
                case "CREATEFORMLEVELDCF":
                    return @"http://{ENDPOINT}_InterChgWS/DCFService.asmx?";
                case "CREATEITEMLEVELDCF":
                    return @"http://{ENDPOINT}_InterChgWS/DCFService.asmx?";

            }
            return "null";
        }

        public static string GetSOAPAction(string RequestName)
        {
            switch (RequestName.ToUpper())
            {
                case "ADDNEWPATIENT":
                    return @"SOAPAction: http://tempuri.org/DataLabsXC.InterchangeService/SiteService/AddNewPatient";
                case "CONSUMEODM1_2STR_ADDNEWPATIENTS":
                    return @"SOAPAction: http://tempuri.org/DataLabsXC.InterchangeService/CDISCService/ConsumeODM1_2Str_AddNewPatients";
                case "GETSTUDYMETADATAODM132":
                    return @"SOAPAction: http://tempuri.org/DataLabsXC.InterchangeService/PatientAndOperationalDataEventing/GetStudyMetaDataODM132";
                case "CONSUMEODM1_STRTRANSACTIONAL":
                    return @"SOAPAction: http://tempuri.org/DataLabsXC.InterchangeService/CDISCService/ConsumeODM1_StrTransactional";
                case "SETEVENTDATE":
                    return @"SOAPAction: http://tempuri.org/DataLabsXC.InterchangeService/PatientEventService/SetEventDate";
                case "CREATEFORMLEVELDCF":
                    return @"SOAPAction: http://tempuri.org/DataLabsXC.InterchangeService/DCFService/CreateFormLevelDCF";
                case "CREATEITEMLEVELDCF":
                    return @"SOAPAction: http://tempuri.org/DataLabsXC.InterchangeService/DCFService/CreateItemLevelDCF";
            }
            return "null";
        }
        public static string GetRESTServiceURI(string requestName, string endPoint)
        {
                switch (requestName.ToUpper())
                {
                    case "TOKEN":
                        return String.Format("{0}" + "_RestAPI/token", endPoint);
                    case "GETLABS":
                        return String.Format("{0}" + "_RestAPI/api/Lab/GetLabs", endPoint);

                }
            return "null";
        }
    }
}
