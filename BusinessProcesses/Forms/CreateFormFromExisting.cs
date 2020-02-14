using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Forms
{
    public class CreateFormFromExisting
    {
        public static IControl VerifybuttonTop
        {get
            {
                return SyncUtilities.FindVisibleElement(By.Name("ctl00$ContentBody$btnVerifyTop"));
            }
            
        }

        public static IControl SavebuttonTop
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//input[@value='Save' and @name ='ctl00$ContentBody$btnContinueTop']"));
            }

        }
        public static IControl SaveButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_btnContinueBottom"));
            }

        }

        public static IControl ExpandButton
        {
            get
            {
                IControl table= SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_grdDetails_ctl00 > tbody"));
                IControl body = SyncUtilities.FindElement_Parent(table.WebElement, By.XPath("//img[contains(@id,'_imgExpand']"));
                    return body;
            }

        }

        public static IControl VerifybuttonBottom
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Name("ctl00$ContentBody$btnVerifyBottom"));
            }

        }
        public static IControl DomainArrowButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//img[@id='ctl00_ContentBody_grdDetails_ctl00_ctl17_imgCollapse']']"));
            }

        }

        public static IControl FormNameErrorMessage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//span[contains(.,'Form name must be unique')]"));
            }

        }
        public static IControl FormLabelErrorMessage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//span[contains(.,'Form label must be unique')]"));
            }

        }
        public static IControl TableErrorMessage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//span[contains(.,'Table name must be unique')]"));
            }

        }
        public static IControl AutoBuildTableErrorMessage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//span[contains(.,'Table name must be unique')]"));
            }

        }

        public static IControl SaveButtonAtTopOfPopupWindow
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnContinueTop"));
            }

        }
        public static IControl SaveButtonAtTheBottomOfThePopupWindow
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnContinueBottom"));
            }

        }

        public static IControl VerifyTextUseExiting
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//tr[2]/td[2]"));
            }

        }

        public static IControl VerifyTextExixtsinTarget
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//tr[2]/td/div/div[2]"));
            }

        }
        public static IControl VerifyTextComponents
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//tr[2]/td/div/div"));
            }

        }

        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#btnCancelTop"));
            }

        }

        public static IControl ColumnHeadingRow
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//table[@id='ctl00_ContentBody_grdDetails_ctl00']/thead/tr"));
            }

        }
        public static IControl ColumnHeadingRow1(int row)
        {
            //IControl dropdownItemsList = SyncUtilities.FindElement(By.XPath("ctl00_ContentBody_grdDetails_ctl00_ctl" + row + "_txtDetailTargetName"));
            IControl columnHeadings = SyncUtilities.FindElement(By.XPath("//table[@id='ctl00_ContentBody_grdDetails_ctl00']/thead/tr/th["+row+"]"));
            return columnHeadings;
        }
        public static IControl FormTableInCreateFormFromExisting
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_grdDetails_ctl00"));
            }

        }
        public static IControl TargetName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//*[contains(@id, 'chkIncludeTargetName')]"));
            }

        }
        //public static IControl IncludeCheckboxOfDomainItem
        //{
        //    get
        //    {
        //        return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl10_chkIncludeTargetName"));
        //    }

        //}
        public static IControl IncludeCheckboxOfDomainIteminrow(int row)
        {
            var rowString = "-1";
            IControl IncludeCheckBoxOfDoaminItem;
            if (row < 10)
            {
                rowString = row.ToString().PadLeft(2, '0');
                IncludeCheckBoxOfDoaminItem = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + rowString + "_chkIncludeTargetName"));
                return IncludeCheckBoxOfDoaminItem;
            }
            else
            {
                List<IControl> cList = new List<IControl>();                
                IncludeCheckBoxOfDoaminItem = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + row + "_chkIncludeTargetName"));
                return IncludeCheckBoxOfDoaminItem;
            }         

        }
        public static IControl ErrorMessageInRow(int row)
        {            
            IControl dropdownItemsList = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + row + "_lblTargetNameMsg"));
            return dropdownItemsList;

        }
        public static IControl PageNumber(int PageNo)
        {
            IControl dropdownItemsList = SyncUtilities.FindElement(By.XPath("//span[contains(.,"+PageNo+")]"));
            return dropdownItemsList;

        }
        public static IControl LinkInPopup(string Link)
        {
            IControl dropdownItemsList = SyncUtilities.FindElement(By.XPath("//a[contains(.,'" + Link + "')]"));
            return dropdownItemsList;

        }
        public static IControl IncludeCheckboxOfCodeList
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl10_chkIncludeDetailTargetName"));
            }

        }
        public static IControl IncludeCheckboxOfCodelistInRow(int row)
        {            
            IControl dropdownItemsList = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + row + "_chkIncludeDetailTargetName"));
            return dropdownItemsList;
        }
        public static IControl ExpandDomain(int row)
        {
            IControl ExpandIcon = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + row + "_imgCollapse"));
            return ExpandIcon;
        }
        public static IControl DomainItem
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Name("ctl00$ContentBody$grdDetails$ctl00$ctl10$txtTargetName"));
            }

        }
        public static IControl DomainIteminrow(int row)
        {
            var rowString = "-1";
            IControl doaminItem;
            if (row < 10)
            {
                rowString = row.ToString().PadLeft(2, '0');
                //List<IControl> cList = new List<IControl>();
                 doaminItem = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + rowString + "_txtTargetName"));
                return doaminItem;
            } 
            else
            {
                doaminItem = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + row + "_txtTargetName"));
                return doaminItem;
            }

        }
        public static IControl Labelinrow(int row)
        {
            var rowString = "-1";
            IControl doaminItem;
            if (row < 10)
            {
                rowString = row.ToString().PadLeft(2, '0');
                //List<IControl> cList = new List<IControl>();
                doaminItem = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + rowString + "_txtTargetName"));
                return doaminItem;
            }
            else
            {
                doaminItem = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + row + "_lblRowDetailCodeListLabel"));
                return doaminItem;
            }

        }

        public static IControl Codelist
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Name("ctl00$ContentBody$grdDetails$ctl00$ctl10$txtDetailTargetName"));
            }

        }
        public static IControl FormLink(string LinkName)
        {
           
                return SyncUtilities.FindVisibleElement(By.XPath("//a[contains(.,'"+ LinkName +"')]"));          

        }
        public static IControl CodelistInRow(int row)
        {
            var rowString = "-1";
            IControl Codelist;
            if (row < 10)
            {
                rowString = row.ToString().PadLeft(2, '0');
                Codelist = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + rowString + "_txtDetailTargetName"));
                return Codelist;
            }
            else
            {
                Codelist = SyncUtilities.FindElement(By.Id("ctl00_ContentBody_grdDetails_ctl00_ctl" + row + "_txtDetailTargetName"));
                return Codelist;

            }
        }
        public static ReadOnlyCollection<IControl> GetDomainIncudeCheckboxes()
        {
            List<IControl> cList = new List<IControl>();
            ReadOnlyCollection<IControl> dropdownItemsList = SyncUtilities.FindElements(By.XPath("//*[contains(@id, 'chkIncludeTargetName')]"));
            foreach (IControl c in dropdownItemsList)
            {
                cList.Add(c);
            }
            return new ReadOnlyCollection<IControl>(cList);
        }
        public static ReadOnlyCollection<IControl> GetCodelistIncudeCheckboxes()
        {
            List<IControl> cList = new List<IControl>();
            ReadOnlyCollection<IControl> dropdownItemsList = SyncUtilities.FindElements(By.XPath("//*[contains(@id, 'chkIncludeDetailTargetName')]"));
            foreach (IControl c in dropdownItemsList)
            {
                cList.Add(c);
            }
            return new ReadOnlyCollection<IControl>(cList);
        }

        public static ReadOnlyCollection<IControl> GetDomainBackGroundColor()
        {
            List<IControl> cList = new List<IControl>();
            ReadOnlyCollection<IControl> dropdownItemsList = SyncUtilities.FindElements(By.XPath("//*[contains(@id, 'txtTargetName')]"));
            foreach (IControl c in dropdownItemsList)
            {
                cList.Add(c);
            }
            return new ReadOnlyCollection<IControl>(cList);
        }
        public static ReadOnlyCollection<IControl> GetCodelistBackGroundColor()
        {
            List<IControl> cList = new List<IControl>();
            ReadOnlyCollection<IControl> dropdownItemsList = SyncUtilities.FindElements(By.XPath("//*[contains(@id, 'txtDetailTargetName')]"));
            foreach (IControl c in dropdownItemsList)
            {
                cList.Add(c);
            }
            return new ReadOnlyCollection<IControl>(cList);
        }

        public static bool ExpandAllchevrons()
        {
            try
            {
                ReadOnlyCollection<IControl> ChevronList = SyncUtilities.FindElements(By.XPath("//*[contains(@src,'expand')]"));
                foreach (IControl c in ChevronList)
                {
                    c.WebElement.Click();
                }
                return true;
            }
            catch(Exception e)
            {
                return false;

            }
        }
    }
}
