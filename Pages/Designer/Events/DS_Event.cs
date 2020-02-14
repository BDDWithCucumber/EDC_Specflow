using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.Events
{
    public class DS_Event
    {
        public static IControl EventName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_ucEventViewPage_grdEvents_ctl00_ctl02_ctl02_txtEventName"));
            }
        }

        public static IControl EventLabel
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_ucEventViewPage_grdEvents_ctl00_ctl02_ctl02_txtEventLabel"));
            }
        }

        public static IControl EventSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_ucEventViewPage_grdEvents_ctl00_ctl02_ctl02_btnSave"));
            }
        }

        public static IControl EventPublishOn
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_ucEventViewPage_grdEvents_ctl00_ctl02_ctl02_ddlPublishEventOnStatus_Input"));
            }
        }
    }
}
