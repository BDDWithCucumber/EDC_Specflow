using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients.Form;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients.Form
{
    public class BP_EditDCFPageUtilities
    {
        public static bool VerifyEditDCFPageHeaderDetails(EditDCFPageHeaderData data)
        {
            bool retVal = true;
            try
            {
                if (!String.IsNullOrEmpty(data.Patient))
                {
                    retVal = data.Patient.Equals(Control_PropertyUtilities.GetText(DL_EditDCFPage.PatientNameLabel), StringComparison.InvariantCultureIgnoreCase);
                }
                if (retVal && !String.IsNullOrEmpty(data.PrimaryInvestigator))
                {
                    retVal = data.PrimaryInvestigator.Equals(Control_PropertyUtilities.GetText(DL_EditDCFPage.PrimaryInvestigatorLabel), StringComparison.InvariantCultureIgnoreCase);
                }
                if (retVal && !String.IsNullOrEmpty(data.CreatedBy))
                {
                    retVal = data.CreatedBy.Equals(Control_PropertyUtilities.GetText(DL_EditDCFPage.CreatedByUserNameLabel), StringComparison.InvariantCultureIgnoreCase);
                }
                if (retVal && !String.IsNullOrEmpty(data.DCFID))
                {
                    retVal = data.DCFID.Equals(Control_PropertyUtilities.GetText(DL_EditDCFPage.DCFIDLabel), StringComparison.InvariantCultureIgnoreCase);
                }
                if (retVal && !String.IsNullOrEmpty(data.DCFStatus))
                {
                    retVal = data.DCFStatus.Equals(Control_PropertyUtilities.GetText(DL_EditDCFPage.DCFStatusLabel), StringComparison.InvariantCultureIgnoreCase);
                }
                if (retVal && !String.IsNullOrEmpty(data.QueryReference))
                {
                    retVal = data.QueryReference.Equals(Control_PropertyUtilities.GetText(DL_EditDCFPage.QueryReferenceLabel), StringComparison.InvariantCultureIgnoreCase);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                retVal = false;
            }
            return retVal;
        }

        public static bool ExpandFlagsPalette()
        {
            try
            {
                IControl expandCollapseIcon = DL_EditDCFPage.DCF_FlagsPaletteCollaseExpandIcon;
                bool found = false;
                String src = Control_PropertyUtilities.GetAttributeValue(expandCollapseIcon, "src", out found);
                if (found)
                {
                    if (src.Contains("menuDown"))
                    {
                        return Control_ActionUtilities.Click(expandCollapseIcon, String.Empty);
                    }
                    else
                    {
                        return true;
                    }
                }
                else
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickReadyToPrintLink()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_EditDCFPage.ReadyToPrintLink_FlagsPalette, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickReadyToPrintOn()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_EditDCFPage.ReadyToPrintOn_FlagsPalette, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyReadyToPrintStatus(String status)
        {
            try
            {
                IControl image = DL_EditDCFPage.ReadyToPrintFlagStatusIcon;
                bool found = false;
                String src = Control_PropertyUtilities.GetAttributeValue(image, "src", out found);

                if (found && status.Equals("On", StringComparison.InvariantCultureIgnoreCase))
                {
                    return src.Contains("yes");
                }
                else if (found && status.Equals("Off", StringComparison.InvariantCultureIgnoreCase))
                {
                    return src.Contains("no");
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetValueForCustomFieldDropdown1(String value)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DL_EditDCFPage.CustomFieldDropdown1, value, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyCustomFieldDropdownValue1(String value)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_VerifySelectedItem(DL_EditDCFPage.CustomFieldDropdown1, value, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SetValueForCustomFieldDropdown2(String value)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DL_EditDCFPage.CustomFieldDropdown2, value, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyCustomFieldDropdownValue2(String value)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_VerifySelectedItem(DL_EditDCFPage.CustomFieldDropdown2, value, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_EditDCFPage.SaveButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}