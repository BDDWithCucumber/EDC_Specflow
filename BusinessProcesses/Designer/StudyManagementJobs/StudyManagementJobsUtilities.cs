using BusinessProcesses.DataLabs.Common;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium.Support.UI;
using Pages.DataLabs.Common;
using Pages.Designer;
using Pages.Designer.Data;
using Pages.Designer.ManageLabs;
using Pages.Designer.MapLabDictionary;
using Pages.Designer.Study_Management_Jobs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.StudyManagementJobs
{
    public class StudyManagementJobsUtilities
    {
        public static bool ClickBreadCrumbItem(String breadCrumbItemText)
        {
            IControl breadCrumbContainer = DL_CommonObjects.DS_BreadCrumbContainer;
            IControl breadCrumbItem = BP_BreadCrumbUtilities.GetClickableBreadCrumbItem(breadCrumbContainer, breadCrumbItemText);
            if (!Control_PropertyUtilities.IsControlNull(breadCrumbItem))
            {
                return Control_ActionUtilities.Click(breadCrumbItem, "Unable to click breadCrumbItem " + breadCrumbItemText);
            }
            return false;
        }

        public static bool VerifyJobStatus(String process, String expectedStatus)
        {
            int i = 0;
            bool found = false;
            try
            {
                while (i < 60 && !found)
                {

                    BrowserUtilities.RefreshPage();
                    IControl cell = GetStatusCell(process, expectedStatus);

                    if (!Control_PropertyUtilities.IsControlNull(cell))
                    {
                        String actualText = Control_PropertyUtilities.GetText(cell);
                        found = actualText.Equals(expectedStatus, StringComparison.InvariantCultureIgnoreCase);
                    }
                    Thread.Sleep(5000);
                    ++i;
                }

            }
            catch (Exception e)
            {

            }
            return found;
        }

        public static bool ClickJobStatus(String process, String statusText)
        {
            try
            {
                IControl cell = GetStatusCell(process, statusText);
                if (!Control_PropertyUtilities.IsControlNull(cell))
                {
                    IControl statusLink = StudyManagemantJobsPage.GetStatusLink(cell, statusText);
                    if (!Control_PropertyUtilities.IsControlNull(statusLink))
                    {
                        return Control_ActionUtilities.Click(statusLink, "Unable to click study management job " + statusText + " for proecss " + process);
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }       

        public static bool ClickProcessLink(String process)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, process, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(DS_Forms.FormsTable, list);
                IControl proecssCell = WebTableUtilities.GetCell(processRow, 1);
                IControl processLink = StudyManagemantJobsPage.GetProcessLink(proecssCell,process);
                return Control_ActionUtilities.Click(processLink, "Unable to click process link " + process);
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static IControl GetStatusCell(String process, String statusText)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, process, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(StudyManagemantJobsPage.StudyJobsTable, list);
                return WebTableUtilities.GetCell(processRow, 3);
                
            }
            catch(Exception e)
            {

            }
            return null;
        }
       
    }
}
