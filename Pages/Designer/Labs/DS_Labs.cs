using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer
{
    public class DS_Labs
    {
        public static IControl AttributeMappingTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("AttributeMappingsTable"));
            }
        }

        public static IControl LabMappingTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("LabMappingsTable"));
            }
        }
        public static IControl LabMappingConfigureFileNameListbox1
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_ddlist1"));
            }
        }

        public static IControl LabsAttribute
        {
            get { return SyncUtilities.FindVisibleElement(By.XPath("//*[contains(@id,\"Study_ST\")]/thead/th[22]")); }
        }

    }
    }
