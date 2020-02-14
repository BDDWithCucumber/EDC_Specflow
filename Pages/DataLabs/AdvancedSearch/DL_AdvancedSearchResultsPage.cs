using Interfaces;
using OpenQA.Selenium;
using System.Collections.ObjectModel;
using Utilities;
using System;
using Framework;
using Common.WebTable;
using Framework.Actions;

namespace Pages.DataLabs.AdvancedSearch
{
    public class DL_AdvancedSearchResultsPage
    {
        public static IControl PatientsTable { get { return GetPatientsTable(); } }

        public static IControl CancelSearchButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector("input[type='button'][value='Cancel Search']")); } }

        static IControl GetPatientsTable()
        {
            IControl mainContent = SyncUtilities.FindVisibleElement(By.Id("tblMainContent"));
            IControl patientTableHost = SyncUtilities.FindVisibleElement_Parent(mainContent.WebElement, By.Id("bodyCol"));
            ReadOnlyCollection<IControl> tableList = SyncUtilities.FindVisibleElements_Parent(patientTableHost.WebElement, By.TagName("table"));
            foreach (IControl table in tableList)
            {
                if (IsPatiensTable(table))
                {
                    return table;
                }
            }
            return null;
        }

        static bool IsPatiensTable(IControl table)
        {
            WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, "Site", TableColumnContentType.Text));
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, "Patient ID", TableColumnContentType.Text));
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(2, "Status", TableColumnContentType.Text));
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(3, "Last Event", TableColumnContentType.Text));
            IControl row = WebTableUtilities.Table_FindRow(table, searchList);
            return !Control_PropertyUtilities.IsControlNull(row);
        }
    }
}
