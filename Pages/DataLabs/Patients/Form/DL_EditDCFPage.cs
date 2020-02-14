using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using Utilities;

namespace Pages.DataLabs.Patients.Form
{
    public class DL_EditDCFPage
    {
        public static IControl PatientNameLabel { get { return SyncUtilities.FindVisibleElement(By.Id("DCFEdit_lblPatientID")); } }

        public static IControl PrimaryInvestigatorLabel { get { return SyncUtilities.FindVisibleElement(By.Id("DCFEdit_lblInvestigator")); } }

        public static IControl CreatedByUserNameLabel { get { return SyncUtilities.FindVisibleElement(By.Id("DCFEdit_lblCreatedBy")); } }

        public static IControl DCFIDLabel { get { return SyncUtilities.FindVisibleElement(By.Id("DCFEdit_lblDCFID")); } }

        public static IControl DCFStatusLabel { get { return SyncUtilities.FindVisibleElement(By.Id("DCFEdit_lblDCFStatus")); } }

        public static IControl QueryReferenceLabel { get { return SyncUtilities.FindVisibleElement(By.Id("DCFEdit_lblReference")); } }

        public static IControl DCF_FlagsPaletteCollaseExpandIcon { get { return SyncUtilities.FindVisibleElement(By.Id("DCF_Flags_imgToggle")); } }

        public static IControl ReadyToPrintLink_FlagsPalette { get { return SyncUtilities.FindVisibleElement(By.ClassName("DCFShowFlagStates")); } }

        public static IControl ReadyToPrintOn_FlagsPalette { get { return SyncUtilities.FindVisibleElement(By.ClassName("menuPopRowLast")); } }

        public static IControl ReadyToPrintOff_FlagsPalette { get { return SyncUtilities.FindVisibleElement(By.ClassName("menuPopRow")); } }

        public static IControl ReadyToPrintFlagStatusIcon
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.ClassName("DCFShowFlagStates"));
                return SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.TagName("img"));
            }
        }

        public static IControl CustomFieldDropdown1
        {
            get
            {
                try
                {
                    IControl c = SyncUtilities.FindVisibleElement(By.Id("DCFEdit_ddlType"));
                    return new Control(c.WebElement, new SelectElement(c.WebElement));
                }
                catch(Exception e)
                {

                }
                return null;
            }
        }
        public static IControl CustomFieldDropdown2
        {
            get
            {
                try
                {
                    IControl c = SyncUtilities.FindVisibleElement(By.Id("DCFEdit_ddlSubStatus"));
                    return new Control(c.WebElement, new SelectElement(c.WebElement));
                }
                catch (Exception e)
                {

                }
                return null;
            }
        }

        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("DCFEdit_btnSave")); } }
    }
}