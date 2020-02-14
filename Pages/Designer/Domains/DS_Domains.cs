using Common;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer
{
    public class DS_Domains
    {
        public static IControl Domains { get { return SyncUtilities.FindVisibleElement(By.Id("Domains")); } }
        public static IControl SavebuttonInAt { get { return SyncUtilities.FindVisibleElement(By.Id("saveBtnForAttributes")); } }
        public static IControl SavebuttonInLM { get { return SyncUtilities.FindVisibleElement(By.Id("saveBtnForLabElements")); } }
        public static IControl AddNewDomain
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rgCommandCell > table > tbody > tr > td > div > a"));
            }
        }
        public static IControl DomainItemsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00"));
            }
        }

        public static IControl AddNewDomainItem
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rgCommandCell > table > tbody > tr > td > div > a"));
            }
        }

        public static IControl DomainPage { get { return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_lblDomainName")); } }

        public static IControl DomainName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdDomainlist_ctl00_ctl02_ctl04_txtDomainName"));
            }
        }

        public static IControl DomainDesc
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdDomainlist_ctl00_ctl02_ctl04_txtDomainLabel"));
            }
        }

        public static IControl DomainSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdDomainlist_ctl00_ctl02_ctl04_btnSave"));
            }
        }

        public static IControl DomainsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".RadGrid.RadGrid_Designer > .rgMasterTable#ctl00_ctl00_ContentBody_ContentBody_grdDomainlist_ctl00"));
            }
        }

        public static IControl DomainItemSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl02_ctl02_btnSave"));
            }
        }
        public static IControl GenderEvent
        {
            get
            {
                 IControl c = SyncUtilities.FindVisibleElement(By.Id("Event__46"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl DomainNameInLabMP
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.XPath("//*[@id=\"-1\"]"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl GenderForm
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("Form__46"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl GenderItem
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("Item__46"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl DOB
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("Select__48"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl DOBEvent
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("Event__42"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl DOBEForm
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("Form__42"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl DOBItem
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.Id("Item__42"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl LabID
        {
            get
            {               
                IControl c = SyncUtilities.FindVisibleElement(By.XPath("//*[@id=\"LabAndCodeListGroups__2\"]"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl CRFCollectionDate
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.XPath("//*[@id=\"LabAndCodeListGroups__8\"]"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl CRFLabTestName
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.XPath("//*[@id=\"LabAndCodeListGroups__9\"]"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl CRFLabValue
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.XPath("//*[@id=\"LabAndCodeListGroups__11\"]"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }
        public static IControl CRFLabUnit
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.XPath("//*[@id=\"LabAndCodeListGroups__12\"]"));
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }

        public static IControl DomainItemSourceEditSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl05_btnSave"));
            }
        }

        public static IControl DomainItemCollDateEditSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl09_btnSave"));
            }
        }

        public static IControl DomainItemCRFLTNEditSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl11_btnSave"));
            }
        }

        public static IControl DomainItemCRFOUEditSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl13_btnSave"));
            }
        }

        public static IControl DomainItemCRFLTDditSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl29_btnSave"));
            }
        }

        //public static IControl StudyTable { get { return SyncUtilities.FindVisibleElement(By.XPath("//*[@id='ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00']/thead/tr[3]/td/div/table")); } }


        public static IControl StudyTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00 .rgEditForm > table"));
            }
        }

        public static IControl LabMappingTableSelectAllCheckbox
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#LabMappingsTable > tbody:nth-of-type(1) .ng-pristine.ng-valid"));
            }
        }

        public static IControl AttributeMappingTableSelectAllCheckbox
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#AttributeMappingsTable > tbody:nth-child(1) > tr > th:nth-child(1) > input"));

            }
        }

        public static IControl LabMappingTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#LabMappingsTable > tbody:nth-of-type(2)"));
            }
        }

        public static IControl DomainItemName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl02_ctl02_txtItemName"));
            }
        }

        public static IControl MaxLen
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl02_ctl02_txtMaxLen"));
            }
        }

        public static IControl Datatype
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl02_ctl02_ddlDataTypeList"));
            }
        }

        public static IControl ItemNameSelectionDropDown { get { return new Control(Datatype.WebElement, new SelectElement(Datatype.WebElement)); } }

        public static IControl CodeList
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl02_ctl02_ddlCodeLists"));
            }
        }

        public static IControl CodeListSelectionDropDown { get { return new Control(CodeList.WebElement, new SelectElement(CodeList.WebElement)); } }


        public static IControl GetImageControl(IControl host, string imageName)
        {
            try
            {
                System.Collections.ObjectModel.ReadOnlyCollection<IControl> cc = SyncUtilities.FindVisibleElements_Parent(host.WebElement, By.TagName("image"));
                List<IControl> imageList = SyncUtilities.FindVisibleElements_Parent(host.WebElement, By.TagName("input")).ToList<IControl>();
                if (imageName.Equals("SaveAnd"))
                {
                    foreach (IControl image in imageList)
                    {
                        bool found;
                        String imageProp = Control_PropertyUtilities.GetAttributeValue(image, "id", out found);
                        if (found)
                        {
                            if (imageProp.EndsWith("btnSaveAdd"))
                            {
                                return image;
                            }
                        }
                    }
                    return null;
                }
                else if (imageName.Equals("Save"))
                {
                    foreach (IControl image in imageList)
                    {
                        bool found;
                        String imageProp = Control_PropertyUtilities.GetAttributeValue(image, "id", out found);
                        if (found)
                        {
                            if (imageProp.EndsWith("btnSave"))
                            {
                                return image;
                            }
                        }
                    }
                    return null;
                }
                else if (imageName.Equals("Cancel"))
                {
                    foreach (IControl image in imageList)
                    {
                        bool found;
                        String imageProp = Control_PropertyUtilities.GetAttributeValue(image, "id", out found);
                        if (found)
                        {
                            if (imageProp.EndsWith("btnCancel"))
                            {
                                return image;
                            }
                        }
                    }
                    return null;
                }
            }
            catch(Exception e)
            {

            }
            return null;
        }

    }
}
