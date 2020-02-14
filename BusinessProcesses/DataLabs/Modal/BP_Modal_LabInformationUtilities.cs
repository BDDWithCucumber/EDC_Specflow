using Framework.Actions;
using Pages.DataLabs.Data;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_Modal_LabInformationUtilities
    {
        public static bool VerifyLabInfo(LabData data)
        {
            BrowserUtilities.SwitchToFrame();
            bool retVal = false;
            try
            {
                retVal = !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Lab ID: " + data.LabId)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Laboratory Name: " + data.LaboratoryName)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Company: " + data.Company)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Department: " + data.Department)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Address 1: " + data.Address1)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Address 2: " + data.Address2)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Address 3: " + data.Address3)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("City/Town: " + data.City)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("State/Province: " + data.State)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Zip/Postal Code: " + data.Zip)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("ISO Country: " + data.ISOCountry)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Country: " + data.Country)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Phone: " + data.Phone)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Fax: " + data.Fax)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Lab Status: " + data.LaboratoryStatus)) &&
                    !Control_PropertyUtilities.IsControlNull(DL_ModalWindow_LabInformation.GetDataCell("Contact Person: " + data.ContactPerson));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }

        public static bool ClickCloseButton()
        {
            bool retVal = false;
            BrowserUtilities.SwitchToFrame();
            try
            {
                retVal = Control_ActionUtilities.ClickModalButton(DL_ModalWindow_LabInformation.CloseButton);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }
    }
}