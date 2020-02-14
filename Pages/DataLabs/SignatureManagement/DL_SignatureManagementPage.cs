using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.SignatureManagement
{
    public class DL_SignatureManagementPage
    {
        public static IControl PISignatureLink
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("SignatureMgmtList_lnkTitle"));
            }
        }
    }
}
