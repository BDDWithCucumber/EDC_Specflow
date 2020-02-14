using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.ManageReferenceRanges;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.DataLabs.ManageReferenceRanges
{
    public class BP_Mrr_EditUtilities
    {
        public static bool GetFirstRowFromTableAndClickOnAction(string action)
        {
            try
            {
                if (DL_Lab_MRR_Table.IsInReferenceRangePage())
                {
                    IControl actionsCell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 13);
                    IControl icon = DL_Lab_MRR_Table.GetActionIcon(actionsCell, action);
                    return Control_ActionUtilities.Click(icon, String.Empty);
                }                    
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }       

        public static bool VerifyValuesInDropdown(List<DropDownInfo> dropdownInfoList, String fieldName)
        {
            try
            {
                List<string> dropdown = new List<string>();
                foreach (DropDownInfo dropdownInfo in dropdownInfoList)
                {
                    dropdown.Add(dropdownInfo.Dropdown);
                }          
                
                IControl dropdowncontrol = DL_Lab_MRR_Table.GetDropdownInvoker(fieldName);
                Control_ActionUtilities.Click(dropdowncontrol, "Not able to click on dropdowncontrol");
                IControl selectValueInDropdown = DL_Lab_MRR_Table.GetSelectValueFromDropdown;
                string selectValue = Control_PropertyUtilities.GetText(selectValueInDropdown);
                ReadOnlyCollection<IControl> dropdowncontrollist = DL_Lab_MRR_Table.GetDropdownItems();
                List<string> dropdownvalues = new List<string>();
               // dropdownvalues.Add(selectValue);
                foreach (IControl control in dropdowncontrollist)
                {
                    string dropdownvalue = Control_PropertyUtilities.GetText(control);
                    dropdownvalues.Add(dropdownvalue);
                }
                bool comparison = DL_Lab_MRR_Table.AreListsEqual(dropdown, dropdownvalues);
                return comparison;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyTheDefaultValueInInputField(string value, String fieldName)
        {
            try
            {               

                IControl dropdowncontrol = DL_Lab_MRR_Table.GetDropdownInvoker(fieldName);
                string dropdownvalue = Control_PropertyUtilities.GetText(dropdowncontrol);
                if(value.Equals(dropdownvalue))
                {
                    return true;
                }                
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickOnAddButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Lab_MRR_Table.AddNewRecord, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
         public static bool clickOnFirstRecord(string labID)
        {
            try
            {

            }
            catch(Exception e)
            {

            }
            return false;
        }
        public static bool clickOnFirstRecordofLabTestName(string labTestID)
        {
            try
            {

            }
            catch (Exception e)
            {

            }
            return false;
        }

    }
 }
