using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;

namespace Pages.DataLabs.Study.EditPreferences
{
    public class DL_Study_EditPreferences_DCFsPage
    {
        public static IControl AutoCloseResolvedDCFsCheckbox { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_chkAutoCloseDCFs")); } }

        public static IControl TurnOnDCFBarcodeCheckbox { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_chkDCFBarCode")); } }

        public static IControl RestrictDCFAccessForRestrictedDataCheckbox { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_chkDCFRestrict")); } }

        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnSave")); } }

        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_btnCancel")); } }

        public static IControl FieldLable1 { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_txtType")); } }

        public static IControl FieldLable2 { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_txtSubStatus")); } }

        public static IControl ActiveRadioButton1 { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_rdoTypeActive")); } }
        public static IControl ActiveRadioButton2 { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_rdoSubStatusActive")); } }

        public static IControl InactiveRadioButton1 { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_rdoTypeInactive")); } }
        public static IControl InactiveRadioButton2 { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_rdoSubStatusInactive")); } }


        public static IControl AddNewItemTextbox1 { get { return SyncUtilities.FindVisibleElement(By.Id("txtAddType")); } }
        public static IControl AddNewItemTextbox2 { get { return SyncUtilities.FindVisibleElement(By.Id("txtAddSubStatus")); } }

        public static IControl AddButton1 { get { return SyncUtilities.FindVisibleElement(By.Name("btnTypeAdd")); } }
        public static IControl AddButton2 { get { return SyncUtilities.FindVisibleElement(By.Name("btnSubStatusAdd")); } }

        public static IControl DCFDescriptionReplacementTextbox { get { return SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_txtDCFRestrictDesc")); } }

        public static IControl ItemListbox1
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("StudyEditPref_lstType"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        
        
        public static IControl RemoveButton1 { get { return SyncUtilities.FindVisibleElement(By.XPath("//input[@id='StudyEditPref_txtType']/following-sibling::table//input[@name='btnSubStatusRemove']")); } }

        public static IControl RemoveButton2 { get { return SyncUtilities.FindVisibleElement(By.XPath("//input[@id='StudyEditPref_txtSubStatus']/following-sibling::table//input[@name='btnSubStatusRemove']")); } }
    }
}