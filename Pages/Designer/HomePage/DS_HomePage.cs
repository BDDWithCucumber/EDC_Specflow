using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer
{
    public class DS_HomePage
    {
        public static IControl DSHomePage { get {return SyncUtilities.FindElement(By.Id("Home")); } }
        public static IControl CodelistsPage { get { return SyncUtilities.FindElement(By.XPath("//h1[contains(., 'Codelists')]")); } }
        public static IControl ImportStudy { get { return SyncUtilities.FindElement(By.Id("ctl00_ContentLeft_actions1_ActionsRepeater_ctl04_divLink")); } }
        public static IControl ManageLabs { get { return SyncUtilities.FindElement(By.Id("ctl00_ContentLeft_actions1_ActionsRepeater_ctl10_divLink")); } }
        public static IControl ManageLabsMessage { get { return SyncUtilities.FindElement(By.Id(".rgNoRecords > td")); } }        
        public static IControl CheckBox { get { return SyncUtilities.FindVisibleElement(By.XPath("//input[@id='ctl00_ContentBody_grdManageLabs_ctl00_ctl02_ctl02_colSelectSelectCheckBox']")); } }
        public static IControl StudyName { get { return SyncUtilities.FindVisibleElement(By.LinkText("Questions")); } }

        public static IControl Forms { get { return SyncUtilities.FindVisibleElement(By.Id("Forms")); } }

        public static IControl GetLink(String linkName)
        {
            return SyncUtilities.FindVisibleElement(By.LinkText(linkName));
        }
        public static IControl StudyManagementProcessLink(String linkName)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//a[contains(.,'Study Publish (Study1: V4)')]"));
        }

        public static IControl StudiesTable
        {
            get
            {
                //IControl HomePanel = SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ctl00_grdHomePanel"));
                //IControl HomeContentBody = SyncUtilities.FindElement_Parent(HomePanel.WebElement, By.Id("ctl00_ContentBody_ctl00_grdHome"));
                //IControl ContentBody = SyncUtilities.FindVisibleElement_Parent(HomeContentBody.WebElement, By.Id("ctl00_ContentBody_ctl00_grdHome_ctl00"));
                //return SyncUtilities.FindVisibleElement_Parent(ContentBody.WebElement, By.TagName("table"));

                IControl HomePanel = SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ctl00_grdHomePanel"));
                IControl HomeContentBody = SyncUtilities.FindElement_Parent(HomePanel.WebElement, By.Id("ctl00_ContentBody_ctl00_grdHome"));
                return SyncUtilities.FindVisibleElement_Parent(HomeContentBody.WebElement, By.Id("ctl00_ContentBody_ctl00_grdHome_ctl00"));
               
            }
        }

        public static IControl StudiesTableInCreateStudyFromExistingStudyWindow
        {
            get
            {               

               // IControl Table = SyncUtilities.FindElement(By.ClassName("RadGrid RadGrid_Designer"));
                IControl TableContent = SyncUtilities.FindVisibleElement(By.ClassName("rgMasterTable"));
                return SyncUtilities.FindVisibleElement_Parent(TableContent.WebElement, By.CssSelector("#ctl00_ContentBody_grdStudy_ctl00 > tbody"));

            }
        }

        public static IControl ErrorManageLabs
        {
            get { return SyncUtilities.FindElement(By.XPath("//*[@id='ctl00_ContentBody_LabDictionaryMessage']")); }
        }

        public static IControl ErrorTableinManageLabs
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[@id='tblErrorCount']"));
            }
        }
        public static IControl GroupCodelistCheckbox
        {
            get
            {

                
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_GroupsControl_grdCodelistGroup_ctl00_ctl04_colSelectSelectCheckBox"));
                

            }
        }

    }
}
