using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.QueryManagement;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.QueryManagement
{
    public class BP_QueryRunWizardUtilities
    {
        public static bool ClickRunAllButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_QueryRunWizardPage.RunAllButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickFinishButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_QueryRunWizardPage.FinishButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool EnterValueInSearchField(string FieldName, string SearchText)
        {
            bool status = false;
            try
            {
                IControl SearchFld = DL_QueryRunWizardPage.GetSearchField(FieldName);
                status = Control_ActionUtilities.Textbox_SetText(SearchFld, SearchText, "Unable to enter search criteria '" + SearchText + "' in the '" + FieldName + "' field.");
                if(status == true)
                {
                    status = Control_ActionUtilities.Click_PerssEnterKey(SearchFld, string.Empty);
                    Thread.Sleep(10000);
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                //return false;
            }
            return status;
        }

        public static bool SelectQueryOnRunWizardPage(string QueryName, string Version)
        {
            bool isQuerySelected = false;
            try
            {
                IControl QueryRow = GetQueryRowFromQueryRunQizard(QueryName, Version);
                if (!Control_PropertyUtilities.IsControlNull(QueryRow))
                {
                    IControl ChkBox = WebTableUtilities.GetElement(QueryRow, string.Empty, 1, TableColumnContentType.Checkbox);
                    if (!Control_PropertyUtilities.IsControlNull(ChkBox))
                    {
                        isQuerySelected = Control_ActionUtilities.Click(ChkBox, "Unable to select query " + QueryName + " as the checkbox is not found.");
                    }
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return isQuerySelected;
        }

        public static IControl GetQueryRowFromQueryRunQizard(string QueryName, string Version)
        {
            WebTable_SearchCriteriaItem Item = new WebTable_SearchCriteriaItem(3, QueryName, TableColumnContentType.Text);
            WebTable_SearchCriteriaItem Item2 = new WebTable_SearchCriteriaItem(6, Version, TableColumnContentType.Text);
            WebTable_SearchCriteriaItemList SearchList = new WebTable_SearchCriteriaItemList();
            SearchList.AddSearchItem(Item);
            SearchList.AddSearchItem(Item2);
            return WebTableUtilities.Table_FindRow(DL_QueryRunWizardPage.QueriesTblOnRunWizard, SearchList);
        }

        public static bool ClickNextButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_QueryRunWizardPage.NextButtonTop, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

    }
}
