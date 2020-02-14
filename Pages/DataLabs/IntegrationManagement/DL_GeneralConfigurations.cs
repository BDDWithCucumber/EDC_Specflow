using Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;
using OpenQA.Selenium;

namespace Pages.DataLabs.IntegrationManagement
{
    public class DL_GeneralConfigurations
    {
        public static IControl SourceSystemRadio(string RadioOption)
        {
            try
            {
                IControl option = SyncUtilities.FindElement(By.XPath("//input[contains(@id, 'IntegrationAdminMgmt_rblAddPatientSource') and @value='" + RadioOption + "']"));
                return option;
            }
            catch (Exception e)
            {
                return null;
            }
        }
        public static IControl WebServiceURL { get { return  SyncUtilities.FindElement(By.Id("IntegrationAdminMgmt_txtWebServiceURL"));  } }
        public static IControl SaveButton { get { return SyncUtilities.FindElement(By.Id("IntegrationAdminMgmt_btnSave")); } }
        public static IControl CancelButton { get { return SyncUtilities.FindElement(By.Id("IntegrationAdminMgmt_btnCancel")); } }
    }
}
