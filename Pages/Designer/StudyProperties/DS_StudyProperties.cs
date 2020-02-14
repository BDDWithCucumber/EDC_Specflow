using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.StudyProperties
{
    public class DS_StudyProperties
    {
        public static IControl Save { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_SaveBtn")); } }

        public static IControl Cancel { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_CancelBtn")); } }

        public static IControl CheckAllProcesses { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdJobs_ctl00_ctl02_ctl01_colSelectSelectCheckBox")); } }

        public static IControl Delete { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_btnDelete")); } }

        public static IControl ViewStudyJobs { get { return SyncUtilities.FindVisibleElement(By.LinkText("View Study Jobs")); } }
        public static IControl StudyName { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_txtStudyName")); } }
        public static IControl SponsorName
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("ddlClient"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }

        public static IControl MainMenuStudyButton { get { return SyncUtilities.FindVisibleElement(By.Id("Study")); } }

        public static IControl NotificationMessage1 { get { return SyncUtilities.FindVisibleElement(By.XPath("//*[@id='ctl00_ctl00_ContentMainMenu_MainMenu1_tdNotification']/span")); } }

        public static IControl NotificationMessage { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentMainMenu_MainMenu1_tdNotification")); } }

        public static IControl TargetApp { get { return SyncUtilities.FindVisibleElement(By.Id("ddlTargetApp")); } }

        public static IControl SponsorErrorMessage { get { return SyncUtilities.FindElement(By.Id("lblClientError")); } }

        public static IControl StudyTable { get { return SyncUtilities.FindVisibleElement(By.XPath("//table/tbody/tr/td[2]/table[2]")); } }

        public static IControl SettingsDropdownclass { get { return SyncUtilities.FindElement_Parent(StudyTable.WebElement, By.ClassName("header")); } }

        public static IControl SettingsDropdownIcon { get { return SyncUtilities.FindElement_Parent(SettingsDropdownclass.WebElement, By.TagName("a")); } }
        public static IControl LabMessageonSelectionOfNoOption { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Label2")); } }
        public static IControl LabDropDown
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_ddlLabs"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
                //return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_ddlLabs"));
            }
        }
        public static IControl LabDropDownOptions { get { return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_ddlLabs")); } }

        public static IControl LMSLink
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentLeft_ContentLeft_Actions2_DocumentLinksRepeater_ctl06_divDocLink"));
            }
        }
        public static IControl labdictionaryItemtext
        {
            get
            {
                return SyncUtilities.FindElement((By.XPath("//*[text()='Associated lab dictionary has been modified.']")));
                //return SyncUtilities.FindElement(By.XPath("//*[@id='ctl00_ctl00_ContentBody_ContentBody_btnViewLabDict']"));

            }
        }
        public static IControl labdictionaryItemlink
        {
            get
            {
                // return SyncUtilities.FindElement((By.Id("//*[text()='Associated lab dictionary has been modified.']")));
                return SyncUtilities.FindElement(By.XPath("//*[@id='ctl00_ctl00_ContentBody_ContentBody_btnViewLabDict']"));

            }
        }

        public static IControl Tab(string tab)
        {

            return SyncUtilities.FindVisibleElement(By.XPath("//a[contains(text(),'" + tab + "')]"));

        }

        public static IControl LabsMouseHover
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//span[contains(@title, 'Study has the Labs feature enabled for defining Attribute, Lab and Lab dictionary mappings.')]"));
            }
        }

        public static IControl StudyPropertiesPage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//h1[contains(.,'Study')]"));
            }
        }
        public static IControl Page(string page)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//h1[contains(.,'" + page + "')]"));
        }
        public static IControl FilterIcon
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//a[contains(text(),'Show/Hide Filter')]"));
            }
            
        }
        public static IControl CodelistName(string page)
        {
            return SyncUtilities.FindVisibleElement(By.CssSelector("# ctl00_ctl00_ContentBody_ContentBody_CodeListsControl_grdCodelist_ctl00_ctl02_ctl03_FilterTextBox_colName"));
        }

        public static IControl CodelistNameForSearch()
        {
            return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_CodeListsControl_grdCodelist_ctl00_ctl02_ctl03_FilterTextBox_colName"));
        }
        public static IControl CodeListSearchOutput()
        {
            return SyncUtilities.FindVisibleElement(By.CssSelector("# ctl00_ctl00_ContentBody_ContentBody_CodeListsControl_grdCodelist_ctl00_ctl04_lnkDetails"));
        }
        public static IControl FilterIconAtPageLevel()
        {
            return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_CodeListsControl_grdCodelist_ctl00_ctl02_ctl03_Filter_colName"));
        }
        public static IControl StudyNameChange()
        {
            return SyncUtilities.FindVisibleElement(By.Name("ctl00$ctl00$ContentBody$ContentBody$txtStudyName"));
        }
        public static IControl LabsIcon
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//h1[contains(.,'Study')]"));
            }
        }

    }

}
