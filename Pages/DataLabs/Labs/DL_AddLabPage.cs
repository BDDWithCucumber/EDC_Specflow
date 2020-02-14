using Common;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading;
using Utilities;

namespace Pages.DataLabs.Labs
{
    public class DL_AddLabPage
    {
        public static IControl SaveAndAddAnotherButton
        {
            get
            {
              return  SyncUtilities.FindElement(By.Id("labSaveAddAnother"));
            }
        }
        public static IControl SaveButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("input[type=button][value=Save]"));
            }
        }

        public static IControl SaveAndAssociateSiteButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("labSaveAndManageSites"));
            }
        }
        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("input[type=button][value=Cancel]"));
            }
        }    
        public static IControl AddLabTable
        {
            get
            {
                IControl mainTable = SyncUtilities.FindVisibleElement(By.CssSelector("div[ng-controller=labController]"));
                ReadOnlyCollection<IControl> tableList = SyncUtilities.FindElements_Parent(mainTable.WebElement, By.TagName("table"));
                return new Control(tableList[0].WebElement);
            }
        }
        public static IControl SitesTable
        {
            get
            {
                IControl sitesDisplayDiv = SyncUtilities.FindVisibleElement(By.CssSelector("div[ng-show='sitesDisplay']"));
                IControl gridSitesDiv = SyncUtilities.FindVisibleElement_Parent(sitesDisplayDiv.WebElement, By.Id("gridSites"));
                IControl tableHostDiv = SyncUtilities.FindVisibleElement_Parent(gridSitesDiv.WebElement, By.CssSelector("div.k-grid-content.k-auto-scrollable"));
                return SyncUtilities.FindVisibleElement_Parent(tableHostDiv.WebElement, By.TagName("table"));
            }
        }
        public static IControl NoRecordsToDisplayDiv
        {
            get
            {
                IControl sitesDisplayDiv = SyncUtilities.FindVisibleElement(By.CssSelector("div[ng-show='sitesDisplay']"));
                IControl gridSitesDiv = SyncUtilities.FindVisibleElement_Parent(sitesDisplayDiv.WebElement, By.Id("gridSites"));
                IControl tableHostDiv = SyncUtilities.FindVisibleElement_Parent(gridSitesDiv.WebElement, By.CssSelector(".k-grid-content.k-auto-scrollable"));
                return SyncUtilities.FindVisibleElement_Parent(tableHostDiv.WebElement, By.ClassName("k-grid-norecords"));
            }
        }

        public static IControl LabAssSuccessMsg
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//td[@id = 'tdConfirmMsg']/b[contains(text(), 'Lab(s) associated successfully')]"));
            }
        }

        public static List<IControl> FieldsOnLabPage
        {
            get
            {
                List<IControl> Fields = new List<IControl> { };
               Fields.AddRange(SyncUtilities.FindElements(By.ClassName("ng-pristine ng-valid")));
                return Fields;
            }
        }

    }
}