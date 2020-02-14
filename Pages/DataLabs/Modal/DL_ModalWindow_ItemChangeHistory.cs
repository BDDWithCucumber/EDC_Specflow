using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_ItemChangeHistory
    {
        public static IControl PatientId_Span { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_patientHeader_lblPatientID")); } }

        public static IControl EventName_Span { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_patientHeader_lblEvent")); } }

        public static IControl FormName_Span { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_patientHeader_lblCRF")); } }

        public static IControl QuestionName_TD { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_tdQuetionText")); } }

        public static IControl HistoryFilterDropdown { get { return new Control(FilterDropdown.WebElement, new SelectElement(FilterDropdown.WebElement)); } }

        public static IControl FilterDropdown { get { return SyncUtilities.FindVisibleElement(By.Id("ddlItemHistory")); } }

        public static IControl HistoryTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_CPH_body_ContentBody_tdChangeHistory > #divSubTabs > #ucSubTabs"));
                //IControl host = SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_tdChangeHistory"));
                //return SyncUtilities.FindVisibleElement_Parent(host.WebElement, By.Id("ucSubTabs"));
            }
        }

        public static IControl PrintButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnPrint")); } }

        public static IControl CloseButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnClose")); } }
    }
}