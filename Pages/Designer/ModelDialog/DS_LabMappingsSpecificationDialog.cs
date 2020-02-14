using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.ModelDialog
{
    public class DS_LabMappingsSpecificationDialog
    {
        public static IControl Title
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#aspnetForm > .rwTransparentWindow > .rwTable .rwTitleRow"));
            }
        }

        public static IControl Message
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_tblLMSText"));
            }
        }

        public static IControl ContinueButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnContinue"));
            }
        }

        public static IControl StudyPublishContinue
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnContinue"));
            }
        }
    }
}
