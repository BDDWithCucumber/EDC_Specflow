using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.LabMapping
{
    public class LabMappingsPage
    {
        public static IControl LabMappingLink
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("div[ng-app=LabModule] > div >ul > li:nth-of-type(2) > a"));
            }
        }

        public static IControl LabMappingSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("span[ng-hide=ViewOnly] >.btnPrimary"));
            }
        }

        public static IControl LabMappingDomain
        {
            get
            {
                WebDriverWait wait = new WebDriverWait(BrowserUtilities.WebDriver, TimeSpan.FromSeconds(10));

                wait.Until(ExpectedConditions.VisibilityOfAllElementsLocatedBy(By.XPath("//*[@id='-1']")));

                return SyncUtilities.FindElement(By.XPath("//*[@id='-1']"));
            }
        }
        public static IControl SelectionLabMappingDomainDropDown { get {return new Control(LabMappingDomain.WebElement, new SelectElement(LabMappingDomain.WebElement)); } }

        public static IControl AddNewDomain
        {
            get
            {
              
                return SyncUtilities.FindVisibleElement(By.CssSelector(".tab-pane.ng-scope.active .nav-tabs > li:nth-of-type(4) > a"));
            }
        }

        public static IControl LabId
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("NewDomain__2"));
               
            }
        }


        public static IControl SelectLabID { get { return new Control(LabId.WebElement, new SelectElement(LabId.WebElement)); } }

        public static IControl SelectLabIdForDomain (String Domain)
        {
            String id = Domain + "__2";
                       
              return new Control(DomainLabId(id).WebElement, new SelectElement(DomainLabId(id).WebElement));
            
           
        }

        public static IControl DomainLabId (String id)
        {
            
                return SyncUtilities.FindVisibleElement(By.Id(id));  
        }

        public static IControl CRFCollectionDate
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("NewDomain__8"));
            }
        }

        public static IControl LabMappingTable { get { return SyncUtilities.FindVisibleElement(By.XPath("//*[@id='aspnetForm']/table//tbody/tr/td[2]/div[2]//div[1]/div//div[2]/table/tbody[2]")); } }


        public static IControl AttributeMappingTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#AttributeMappingsTable tbody:nth-of-type(2)"));
            }
        }

        public static IReadOnlyCollection<IWebElement> AttributeMappingTableRows
        {
            get
            {
                return AttributeMappingTable.WebElement.FindElements(By.TagName("tr"));
            }
        }

        public static IControl EditButtonForAttributeMappingField(String field)
        {
            IControl EditButton = null;
                          
                foreach (IWebElement row in AttributeMappingTableRows)
                {
                    if (row.Text.Contains(field))
                    {
                        ReadOnlyCollection<IControl> cells = SyncUtilities.FindElements_Parent(row, By.TagName("td"));
                        EditButton = cells[3];
                    }
                }
            
                return EditButton;
             
        }

        public static IControl CodeListMappingButtonForField(String field)
        {
            IControl EditButton = null;

            foreach (IWebElement row in AttributeMappingTableRows)
            {
                if (row.Text.Contains(field))
                {
                    ReadOnlyCollection<IControl> cells = SyncUtilities.FindElements_Parent(row, By.TagName("td"));
                    EditButton = cells[2];
                }
            }
            return GetCodelistMappingButton(EditButton);
        }

        public static IControl AttributeMapping_CodelistMappingTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("table > tbody > tr:nth-of-type(4) .tblStd"));
            }
        }

        public static IControl AttributeMapping_CodelistMappingTableOkButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("table > tbody > tr:nth-of-type(4) .tblStd tfoot input"));
            }
        }

        public static IControl AttributeMapping_CodelistMappingCancelButton
        {
            get
            {
                Thread.Sleep(1000);
                return SyncUtilities.FindElement(By.Name("Cancelbutton"));
            }
        }

        public static IControl ExpandCollapseAllButton
        {
            get
            {
                List<IControl> expandAll = new List<IControl> { };
                expandAll.AddRange(SyncUtilities.FindElements(By.XPath("//*[@ng-click='overallexpandcollpase($event)']")));
                return expandAll[3];
            }
        }


        public static List<IControl> ExpandCollapseButtonForAllSections()
        {
            List<IControl> expandSection = new List<IControl> { };
                expandSection.AddRange(SyncUtilities.FindElements(By.Id("collapseExpand")));
                return expandSection;
           
        }

        public static IControl SelectCRFCollectionDate { get { return new Control(CRFCollectionDate.WebElement, new SelectElement(CRFCollectionDate.WebElement)); } }

        public static IControl EditSelectedLink
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".tab-pane.ng-scope.active div > div > div > div > div > input"));
            }
        }        

        public static IControl LabTestName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("NewDomain__9"));
            }
        }

        public static IControl SelectlabTestName { get { return new Control(LabTestName.WebElement, new SelectElement(LabTestName.WebElement)); } }

        public static IControl LabTestValue
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("NewDomain__11"));
            }
        }

        public static IControl SelectLabTestValue { get { return new Control(LabTestValue.WebElement, new SelectElement(LabTestValue.WebElement)); } }

        public static IControl LabUnit
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("NewDomain__12"));
            }
        }

        

        public static IControl SelectLabUnit { get { return new Control(LabUnit.WebElement, new SelectElement(LabUnit.WebElement)); } }

        public static IControl GetDOBAgeDropdown(IControl containerCell)
        {
            try
            {
                IControl dropdown = SyncUtilities.FindVisibleElement_Parent(containerCell.WebElement, By.CssSelector("select"));
                SelectElement select = new SelectElement(dropdown.WebElement);
                return new Control(dropdown.WebElement, select);
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static IControl GetEventDropdown(IControl containerCell)
        {
            try
            {
                IControl dropdown = SyncUtilities.FindVisibleElement_Parent(containerCell.WebElement, By.CssSelector("select:nth-of-type(1)"));
                SelectElement select = new SelectElement(dropdown.WebElement);
                return new Control(dropdown.WebElement, select);
            }
            catch(Exception e)
            {

            }
            return null;
        }

        public static IControl GetCodelistMappingButton(IControl containerCell)
        {
            try
            {
                return SyncUtilities.FindVisibleElement_Parent(containerCell.WebElement, By.CssSelector("input"));
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static IControl GetFormDropdown(IControl containerCell)
        {
            try
            {
                IControl dropdown = SyncUtilities.FindVisibleElement_Parent(containerCell.WebElement, By.CssSelector("select:nth-of-type(2)"));
                SelectElement select = new SelectElement(dropdown.WebElement);
                return new Control(dropdown.WebElement, select);
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static IControl GetItemDropdown(IControl containerCell)
        {
            try
            {
                IControl dropdown = SyncUtilities.FindVisibleElement_Parent(containerCell.WebElement, By.CssSelector("select:nth-of-type(3)"));
                SelectElement select = new SelectElement(dropdown.WebElement);
                return new Control(dropdown.WebElement, select);
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static List<IControl> AllDropdowns
        {
            get
            {
                List<IControl> dropdowns = new List<IControl> { };
                dropdowns.AddRange(SyncUtilities.FindElements(By.TagName("Select")));

                return dropdowns;

            }
        }
        

        public static IControl ExpandCollapseForSection(String SectionName)
        {

            return SyncUtilities.FindElement(By.XPath("(//*[contains(text(),'"+SectionName+"')])[2]/preceding-sibling::*"));
             
        }
    }
}
