using BusinessProcesses.WebFocus.Common;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.WebFocus;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.WebFocus.Helpers
{
   public class BP_wf_FrameHelper
    {
        public static String ReadFrameHeaderText(IControl headerControl)
        {
            String text = "";
            try
            {
                text = headerControl.WebElement.Text;
                return text;
            }
            catch (Exception e)
            {

                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return text;
        }
        public static bool ValidateFrameHeaderText(String ExpectedText)
        {
            BrowserUtilities.SwitchToWebFocusFrame();
            String actualText = ReadFrameHeaderText(wf_Page_Frame.frameHeader);
            if (!actualText.ToUpper().Equals(ExpectedText.ToUpper()))
            {
                return false;
            }
            BrowserUtilities.SwitchToWindow();
            return true;            
        }

        public static IControl GetSectionHeaderByText(String SectionText)
        {
            IControl ctrl = null;
            BrowserUtilities.SwitchToWebFocusFrame();
            ReadOnlyCollection<IControl> section = SyncUtilities.FindElements(By.ClassName("sectionHeader"));
            foreach (IControl c in section)
            {
                if (c.WebElement.Text.ToUpper().Contains(SectionText.ToUpper()))
                {
                    ctrl = c;
                    return ctrl;
                }
            }
            return ctrl;
        }

        public static bool ValidateSectionHeaderTitle(String SectionText)
        {
            IControl control = GetSectionHeaderByText(SectionText); 
              if (control.WebElement.Text.ToUpper().Contains(SectionText.ToUpper()))
                {
                    return true;
                }
                return false;
        }

        public static bool ValidateSectionItemLink(String SectionText, String LinkText)
        {
            bool textFound = false;
            if(!ValidateSectionHeaderTitle(SectionText))
            {
                return false;
            }
            List<String> LinkNames = GetLinksTextInSectionHeader(SectionText);
            for (int i = 0; i < LinkNames.Count(); i++)
            {
                if (LinkNames[i].Equals(LinkText))
                {
                    textFound = true;
                    return textFound;
                }
            }
            return textFound;
        }

        public static List<String> GetLinksTextInSectionHeader(String SectionText)
        {
            List<String> allLinks = new List<String>();
            if (ValidateSectionHeaderTitle(SectionText))
            {
                IControl control = GetSectionHeaderByText(SectionText);
                ReadOnlyCollection<IWebElement> actualLinks = control.WebElement.FindElements(By.TagName("a"));
                if (actualLinks!=null)
                {
                    foreach (IWebElement item in actualLinks)
                    {
                        allLinks.Add(item.Text.Trim());
                    }
                }
            }
            return allLinks;
            
        }

        public static bool ValidateDefaultSelectedItemInDropDownMenu(String item)
        {
            //BrowserUtilities.SwitchToWebFocusFrame();
            if (!Control_ActionUtilities.Dropdown_VerifySelectedItem(wf_Page_Frame.CountrySelect_dropdown, item, "Item not found as default item"))
            {
                return false;
            }
            return true;
        }

        static List<String> GetSelectFormatRadioTexts()
        {
            List<String> allTexts = new List<String>();

            ReadOnlyCollection<IControl> actualText = SyncUtilities.FindElements(By.XPath("//input[@name='outputFmt']"));
                if (actualText != null)
                {
                    foreach (IControl item in actualText)
                    {
                        allTexts.Add(BP_wf_ActionUtil.GetPropertyOfAnObject(item,"displaytext"));
                    }
                }
            return allTexts;
        }
        
            

        public static bool VerifyItemsInMultiseleableList(String listName, List<String> itemToVerify)
        {
            try
            {
                switch (listName.ToUpper().ToString())
                {
                    case "COUNTRY":
                        if (!Control_ActionUtilities.Dropdown_VerifyItems(wf_Page_Frame.CountrySelect_dropdown, itemToVerify, true, "Item not available"))
                            return false;
                        return true;
                    case "SITE":
                        if (!Control_ActionUtilities.Dropdown_VerifyItems(wf_Page_Frame.SiteSelect_dropdown, itemToVerify, true, "Item not available"))
                            return false;
                        return true;
                    case "PATIENT":
                        if (!Control_ActionUtilities.Dropdown_VerifyItems(wf_Page_Frame.CountrySelect_dropdown, itemToVerify, true, "Item not available"))
                            return false;
                        return true;


                    case "Default":
                        return false;
                }
            }
            catch (Exception e)
            {

                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
           
            return true;
            
        }

        public static bool VerifyMinutesPerCRFFieldValue(int valueTOChek)
        {
            String actValue = BP_wf_ActionUtil.GetPropertyOfAnObject(wf_Page_Frame.mintuesPerCRF, "value");
            if (!float.Parse(actValue).Equals(valueTOChek))
            {
                return false;
            }

            return true;
        }

        public static bool CheckCheckBoxSeletedOrNot(IControl control, bool checkedorNot)
        {
            if(control!=null && control.WebElement != null)
            {
                bool selection = control.WebElement.Selected;
                if (checkedorNot.Equals(selection))
                {
                    return true;
                }
            }
            return false;
        }

        public static bool VerifyFormatAvailability(List<String> itemsToVerify)
        {
            bool isVerifySuccessful = false;
            int AvailableCnt = 0;
            int UnavailableCnt = 0;
            List<String> ItemList = GetSelectFormatRadioTexts();
            foreach (string Item in itemsToVerify)
            {
                if (ItemList.Contains(Item))
                {
                    AvailableCnt = AvailableCnt + 1;
                }
                else
                {
                    UnavailableCnt = UnavailableCnt + 1;
                }
                if ((AvailableCnt == itemsToVerify.Count) || (UnavailableCnt == itemsToVerify.Count))
                {
                    isVerifySuccessful = true;
                }
            }
            return isVerifySuccessful;
            }


        public static bool VerifyButtonOnForms(string ButtonName)
        {
            bool ControlNotExist = true;
            string Button = ButtonName.ToUpper();
            switch (Button)
            {
                case "VIEW":
                    ControlNotExist = Control_PropertyUtilities.IsControlNull(wf_Page_Frame.view_button);
                    break;
                
                default:
                    Control_ActionUtilities.LogException("Verify button on CRF.", "Inavalid button name '" + ButtonName + "' is passed to be clicked on CRF.", string.Empty);
                    return false;
            }
            return !ControlNotExist;
        }

        public static bool ClickRadioButton(String radioName)
        {
            try
            {
                switch (radioName.ToUpper().ToString())
                {
                    case "YES":
                        Control_ActionUtilities.ClickModalButton(wf_Page_Frame.radio_Yes);
                        break;
                    case "NO":
                        Control_ActionUtilities.ClickModalButton(wf_Page_Frame.radio_No);
                        break;
                    case "HTML":
                        Control_ActionUtilities.ClickModalButton(wf_Page_Frame.radio_HTML);
                        break;
                    case "EXCEL":
                        Control_ActionUtilities.ClickModalButton(wf_Page_Frame.radio_Excel);
                        break;
                    //need to add few more radio controls based on forms

                    case "Default":
                        return false;
                }
            }
            catch (Exception e)
            {

                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
           
            return true;
        }

        public static bool ValidateTableTitle(String HeaderText)
        {
            IControl control = GetTableHeaderByText(HeaderText);
            if (control.WebElement.Text.ToUpper().Contains(HeaderText.ToUpper()))
            {
                return true;
            }
            return false;
        }

        private static IControl GetTableHeaderByText(string headerText)
        {
            IControl ctrl = null;
            //BrowserUtilities.SwitchToWebFocusFrame();
            BP_wf_VerificationHelpers.WaitAndFindVisibleElement(By.XPath("//table['id=headerTbl']/td[class='launchPageTitleClass']"));
            ReadOnlyCollection<IControl> section = SyncUtilities.FindElements(By.XPath("//table['id=headerTbl']/td[class='launchPageTitleClass']"));
            foreach (IControl c in section)
            {
                if (c.WebElement.Text.ToUpper().Contains(headerText.ToUpper()))
                {
                    ctrl = c;
                    return ctrl;
                }
            }
            return ctrl;
        }

        public static List<string> GetColumnHeaderTextFromResultTable(By control)
        {
            List<String> allTexts = new List<String>();

            ReadOnlyCollection<IControl> tableRw = SyncUtilities.FindElements(control);
            int iCount = tableRw.Count;
            
            if (iCount != 0)
            {
                foreach (IControl item in tableRw)
                {
                    allTexts.Add(BP_wf_ActionUtil.GetPropertyOfAnObject(item, "title"));
                }
            }
            return allTexts;
        }
        public static bool VerifyColumnText(List<String> itemsToVerify)
        {
            bool isVerifySuccessful = false;
            int AvailableCnt = 0;
            int UnavailableCnt = 0;
            List<String> ItemList = GetColumnHeaderTextFromResultTable(By.XPath("//tr[2]/td/table/tbody/tr[1]/td"));
            foreach (string Item in itemsToVerify)
            {
                if (ItemList.Contains(Item))
                {
                    AvailableCnt = AvailableCnt + 1;
                }
                else
                {
                    UnavailableCnt = UnavailableCnt + 1;
                }
                if ((AvailableCnt == itemsToVerify.Count) || (UnavailableCnt == itemsToVerify.Count))
                {
                    isVerifySuccessful = true;
                }
            }
            return isVerifySuccessful;
        }


    }
}
