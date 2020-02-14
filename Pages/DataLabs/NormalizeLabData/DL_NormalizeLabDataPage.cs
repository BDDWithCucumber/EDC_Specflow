using Common;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading;
using Utilities;

namespace Pages.DataLabs.NormalizeLabData
{
   public class DL_NormalizeLabDataPage
    {
        public static IControl RunButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("RunNorm_btnRunNormalization"));
            }
        }
    }
}
