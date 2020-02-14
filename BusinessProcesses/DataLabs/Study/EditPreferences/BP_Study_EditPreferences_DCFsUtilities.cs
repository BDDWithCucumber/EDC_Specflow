using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Study.EditPreferences;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Study.EditPreferences
{
    public class BP_Study_EditPreferences_DCFsUtilities
    {
        public static bool CheckCheckbox(String checkboxName)
        {
            try
            {
                if (checkboxName.Contains("Auto-close Resolved DCFs"))
                {
                    return CheckCheckbox(DL_Study_EditPreferences_DCFsPage.AutoCloseResolvedDCFsCheckbox);
                }
                else if (checkboxName.Contains("Turn On DCF Barcode"))
                {
                    return CheckCheckbox(DL_Study_EditPreferences_DCFsPage.TurnOnDCFBarcodeCheckbox);
                }
                else if (checkboxName.Contains("Restrict DCF Access for Restricted Data"))
                {
                    return CheckCheckbox(DL_Study_EditPreferences_DCFsPage.RestrictDCFAccessForRestrictedDataCheckbox);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool UncheckCheckbox(String checkboxName)
        {
            try
            {
                if (checkboxName.Contains("Auto-close Resolved DCFs"))
                {
                    return UncheckCheckbox(DL_Study_EditPreferences_DCFsPage.AutoCloseResolvedDCFsCheckbox);
                }
                else if (checkboxName.Contains("Turn On DCF Barcode"))
                {
                    return UncheckCheckbox(DL_Study_EditPreferences_DCFsPage.TurnOnDCFBarcodeCheckbox);
                }
                else if (checkboxName.Contains("Restrict DCF Access for Restricted Data"))
                {
                    return UncheckCheckbox(DL_Study_EditPreferences_DCFsPage.RestrictDCFAccessForRestrictedDataCheckbox);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickActiveRadioButton1()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_DCFsPage.ActiveRadioButton1, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickActiveRadioButton2()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_DCFsPage.ActiveRadioButton2, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickInactiveRadioButton1()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_DCFsPage.InactiveRadioButton1, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickInactiveRadioButton2()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_DCFsPage.InactiveRadioButton2, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool EnterTextInAddNewItem1Textbox(String text)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Study_EditPreferences_DCFsPage.AddNewItemTextbox1, text, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool EnterTextInAddNewItem2Textbox(String text)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Study_EditPreferences_DCFsPage.AddNewItemTextbox2, text, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool UncheckCheckbox(IControl checkbox)
        {
            try
            {
                bool found = false;
                String propValue = Control_PropertyUtilities.GetAttributeValue(checkbox, "checked", out found);
                if (!found)
                {
                    return true;
                }
                return Control_ActionUtilities.Click(checkbox, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickAddButton1()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_DCFsPage.AddButton1, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickAddButton2()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_DCFsPage.AddButton2, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        static bool CheckCheckbox(IControl checkbox)
        {
            try
            {
                bool found = false;
                String propValue = Control_PropertyUtilities.GetAttributeValue(checkbox, "checked", out found);
                if (!found)
                {
                    found = Control_ActionUtilities.Click(checkbox, String.Empty);
                }
                return found;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetDCFDescriptionReplacementText(String dcfDescriptionReplacementText)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Study_EditPreferences_DCFsPage.DCFDescriptionReplacementTextbox, dcfDescriptionReplacementText, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickRemove1Button()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_DCFsPage.RemoveButton1, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickRemove2Button()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_DCFsPage.RemoveButton2, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectItemInItemList1(String item)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DL_Study_EditPreferences_DCFsPage.ItemListbox1, item, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_DCFsPage.SaveButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool RemoveItemFromList1(string itemName)
        {
            try
            {
                List<String> itemList = new List<String>();
                itemList.Add(itemName);
                if (Control_ActionUtilities.Dropdown_VerifyItems(DL_Study_EditPreferences_DCFsPage.ItemListbox1, itemList, String.Empty))
                {
                    if (Control_ActionUtilities.Dropdown_SelectItem(DL_Study_EditPreferences_DCFsPage.ItemListbox1, itemName, String.Empty))
                    {
                        return ClickRemove1Button();
                    }
                }
                else
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

        public static bool CancelButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_DCFsPage.CancelButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool EnterTextInFieldLabel1(String text)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Study_EditPreferences_DCFsPage.FieldLable1, text, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool EnterTextInFieldLabel2(String text)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Study_EditPreferences_DCFsPage.FieldLable2, text, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
