using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;
using System.Collections.ObjectModel;
using Framework;
using Framework.Actions;
using Interfaces;
using Common;

namespace Pages.DataLabs.FlagManagement
{
    public class DL_FlagManagementPage
    {
        //public static IControl SDVerifyLink { get { return SyncUtilities.FindVisibleElement(By.LinkText("SD-Verify")); } }

        public static IControl GetFlagTypeLink(string FlagTypeName)
        {
            return SyncUtilities.FindVisibleElement(By.LinkText(FlagTypeName));
        }
        public static IControl FlagActionOnManage(string ActionName)
        {
            return SyncUtilities.FindVisibleElement(By.LinkText(ActionName));
        }
        
        public static IControl MultiSelectDropdownFlagAssign(string DropdownName)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//p[@class='CaptionCont SlectBox']/span[text() = 'Select Site(s)']"));
        }
        public static IControl SelectSitesDropdown { get { return SyncUtilities.FindVisibleElement(By.XPath("//select[@id = 'ddlSites']/following-sibling::p")); } }
        public static IControl SelectPlansDropdown { get { return SyncUtilities.FindVisibleElement(By.XPath("//select[@id = 'ddlPlans']/following-sibling::p")); } }
        public static IControl GetSelectAllSitesinDropdown { get { return SyncUtilities.FindVisibleElement(By.XPath("//select[@id = 'ddlSites']/following-sibling::div/p[@class = 'select-all']")); } }
        public static IControl GetPatientsButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnPatients")); } }
        public static IControl ExportButton { get { return SyncUtilities.FindVisibleElement(By.Id("lnkExport")); } }
        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnCancel3")); } }

        public static IControl SelectAllPatientsSitesCheckbox { get { return SyncUtilities.FindVisibleElement(By.XPath("//div[@class = 'ngHeaderContainer']//input[@type = 'checkbox']")); } }
        
        public static IControl RowCheckBoxAssignGrid (string PatientSiteID)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//span[text() = '" + PatientSiteID + "']/ancestor::div[@ng-repeat='col in renderedColumns']/preceding-sibling::div//input"));
        }
        public static IControl SelectNewPlan { get { return SyncUtilities.FindVisibleElement(By.Id("ddlSetPlans")); } }
        public static IControl SelectNewPlanDropDown { get { return new Control(SelectNewPlan.WebElement, new SelectElement(SelectNewPlan.WebElement)); } }
        public static IControl ReasonForChange { get { return SyncUtilities.FindVisibleElement(By.Id("ddlReasonCodes")); } }
        public static IControl ReasonForChangeDropDown { get { return new Control(ReasonForChange.WebElement, new SelectElement(ReasonForChange.WebElement)); } }
        public static IControl AdditionalTextNotes { get { return SyncUtilities.FindVisibleElement(By.Id("txtAdditionalNotes")); } }
        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnSave")); } }
        public static IControl SelectAllSitesCheckbox { get { return SyncUtilities.FindVisibleElement(By.XPath("//div[@class = 'ngHeaderContainer']//input[@type = 'checkbox']")); } }
    }

}
