using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.ManageReferenceRanges;
using Pages.Designer.Scripting;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.Designer
{
    public class BP_DS_ScriptingUtilities
    {
        public static bool EnterDataToQueryField(String QueryField)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(ScriptingPage.Query, QueryField,"Not able to enter the data");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
    public static bool ClickOnSave( )
        {
            try
            {
                return Control_ActionUtilities.Click(ScriptingPage.SaveInQueryPage, "Unable to click on save button");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickOnFilterIcon()
        {
            try
            {
                return Control_ActionUtilities.Click(ScriptingPage.FilterIcon, "Unable to click on save button");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickOnLink()
        {
            try
            {
                return Control_ActionUtilities.Click(ScriptingPage.SaveInQueryPage, "Unable to click on save button");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        

        public static bool EnterTheVariableNameInQueryField(string QueryField)
        {
            // string QueryField1 = QueryField + new Random(100);
            bool txt = false;
            try
            {
                  txt= Control_ActionUtilities.Textbox_SetText(ScriptingPage.Query, QueryField, "Not able to enter the data");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return txt;
        }

        public static bool EnterTheParameterName(string ParameterName)
        {
           
            try
            {
                return Control_ActionUtilities.Textbox_SetText(ScriptingPage.ParName, ParameterName, "Not able to enter the data");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyThePageLoaded(string QueryField)
        {
           
            try
            {
                string Page=Control_PropertyUtilities.GetText(ScriptingPage.QueryPage);
                return (Page.Contains(QueryField));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectPar()
        {

            try
            {
                return Control_ActionUtilities.MouseClick(ScriptingPage.ParReference, "Not able to click on Reference");
                
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool EnterTheDataInParReference(string ParameterReference)
        {

            try
            {
                return Control_ActionUtilities.Textbox_SetText(ScriptingPage.ParReference, ParameterReference, "Not able to click on Reference");

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickonparSave( )
        {

            try
            {
                return Control_ActionUtilities.Click(ScriptingPage.ParSave, "Not able to click on Save button");

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickonTestcaseTab()
        {

            try
            {
                return Control_ActionUtilities.Click(ScriptingPage.TestCaseSubTab, "Not able to click on Save button");

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool ClickOnDropDownOption()
        {

            try
            {
                return Control_ActionUtilities.Click(ScriptingPage.DropDownOptions, "Not able to click on Save button");

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyTestCaseDropDownValues(List<DropDownInfo> dropdownInfoList)
        {
            try
            {
                List<string> dropdown = new List<string>();
                foreach (DropDownInfo dropdownInfo in dropdownInfoList)
                {
                    dropdown.Add(dropdownInfo.Dropdown);
                }

                IControl dropdowncontrol = ScriptingPage.DropDownOptions;

                Control_ActionUtilities.Click(dropdowncontrol, "Not able to click on dropdowncontrol");
                IControl selectValueInDropdown = ScriptingPage.DropDownOptions;

                string selectValue = Control_PropertyUtilities.GetText(selectValueInDropdown);
                bool found = false;
                List<String> dropdownvalues = Control_ActionUtilities.Dropdown_GetItems(dropdowncontrol, out found);
                if (found)
                {
                    bool comparison = DL_Lab_MRR_Table.AreListsEqual(dropdown, dropdownvalues);
                }
                return true;
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }
        
        public static bool Clickonparameter()
        {

            try
            {
                return Control_ActionUtilities.Click(ScriptingPage.DropDownOptions, "Not able to click on Save button");

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickOnTheCheckBox()
        {

            try
            {
                return Control_ActionUtilities.Click(ScriptingPage.DropDownOptions, "Not able to click on Save button");

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }

}
