using Common;
using Common.WebTable;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.DataLabs.Data;
using Pages.DataLabs.ManageReferenceRanges;
using Pages.Designer;
using Pages.Designer.ConfirmationPopup;
using Pages.Designer.Data;
using Pages.Designer.LabMapping;
using Pages.Designer.StudyProperties;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer
{
    public class DS_BP_StudyProperties
    {
        public static bool VerifyText(String notificationMessage)
        {
            try
            {
                String Notification_Message = Control_PropertyUtilities.GetText(DS_StudyProperties.NotificationMessage);

                return notificationMessage.Equals(Notification_Message, StringComparison.InvariantCultureIgnoreCase);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        //public static bool VerifySuccessMessageOnPage(string SuccessMsgToVerify)
        //{
        //    try
        //    {                
        //          IControl MsgObj = DS_ConfirmationPopup.SuccessMessage(SuccessMsgToVerify);
        //        if (!Control_PropertyUtilities.IsControlNull(MsgObj))
        //        {
        //            string MsgText = Control_PropertyUtilities.GetText(MsgObj);
        //            return SuccessMsgToVerify.Equals(MsgText.Trim());
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
        //        return false;
        //    }
        //}

        public static bool SetStudyName(String studyName)
        {
            return Control_ActionUtilities.Textbox_SetText(DS_StudyProperties.StudyName, studyName, String.Empty);
        }

        public static bool SelectItemFromDropdown(String sponsorName)
        {
            return Control_ActionUtilities.Dropdown_SelectItem(DS_StudyProperties.SponsorName, sponsorName, "Unable to select sponsor");
        }

        public static bool ClickMenuStudyButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_StudyProperties.MainMenuStudyButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickEditButtonOnLabMappingsPage(String field)
        {
            try
            {
                if (LabMappingsPage.EditButtonForAttributeMappingField(field)!=null)
                {
                    LabMappingsPage.EditButtonForAttributeMappingField(field).WebElement.Click();
                    return true;
                }

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickEditCodelistMapping(String Field)
        {
            try
            { 
                if (LabMappingsPage.CodeListMappingButtonForField(Field) != null)
                {
                LabMappingsPage.CodeListMappingButtonForField(Field).WebElement.Click();
                    return true;
                 }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyColorOfButton()
        {
            try
            {
            
             return Control_PropertyUtilities.CompareCSSValue(LabMappingsPage.AttributeMapping_CodelistMappingCancelButton, "Color", "rgb(102, 102, 102)");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickCancelButtonOnPopup()
        {
            try
            {
                return Control_ActionUtilities.Click(LabMappingsPage.AttributeMapping_CodelistMappingCancelButton, "Unable to click cancel button");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }


        public static bool ClickDeleteButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_StudyProperties.Delete, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CheckAllProcessesCheckBox()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(DS_StudyProperties.CheckAllProcesses);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetDropdownValue(String dropdownName, String dropdownValue)
        {
            try
            {
                IControl dropdown = GetDropdown_SearchPalette(dropdownName);
                dropdown.WebElement.Click();
                //Control_ActionUtilities.Click(dropdown 'Target App drop down not clicked');
                return Control_ActionUtilities.Dropdown_SelectItem(dropdown, dropdownValue, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static IControl GetDropdown_SearchPalette(String dropdownName)
        {
            IControl c = null;
            if (dropdownName.Equals("Target App:", StringComparison.InvariantCultureIgnoreCase))
            {
                c = SyncUtilities.FindVisibleElement(By.Id("ddlTargetApp"));
            }
            if (dropdownName.Equals("Document name  selection listbox1", StringComparison.InvariantCultureIgnoreCase))
            {
                c = SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_ddlist1"));
            }
            if (!Control_PropertyUtilities.IsControlNull(c))
            {
                return new Control(c.WebElement, new OpenQA.Selenium.Support.UI.SelectElement(c.WebElement));
            }
            else if (!Control_PropertyUtilities.IsControlNull(c))
            {
                return new Control(c.WebElement, new OpenQA.Selenium.Support.UI.SelectElement(c.WebElement));
               }

            return null;
        }

        public static bool LabsDropDownStatus(String dropdownStatus)
        {
            try
            {

                if (dropdownStatus.Equals("Enabled"))
                {
                    bool status = Control_PropertyUtilities.IsEnabled(DS_StudyProperties.LabDropDown);
                    return status;
                }
                else if (dropdownStatus.Equals("Disabled"))
                {
                    bool status = Control_PropertyUtilities.IsControlDisabled(DS_StudyProperties.LabDropDown);
                    return status;
                }

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool LabsDropDownDefaultValue(String value)
        {
            try
            {

                if ((Control_ActionUtilities.Dropdown_VerifySelectedItem(DS_StudyProperties.LabDropDown, value, "DefaultvalueisnotNo")))
                {
                    return true;
                }


            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool VerifylabsDropDownValues(List<DropDownInfo> dropdownInfoList, String fieldName)
        {
            try
            {
                List<string> dropdown = new List<string>();
                foreach (DropDownInfo dropdownInfo in dropdownInfoList)
                {
                    dropdown.Add(dropdownInfo.Dropdown);
                }

                IControl dropdowncontrol = DS_StudyProperties.LabDropDown;

                Control_ActionUtilities.Click(dropdowncontrol, "Not able to click on dropdowncontrol");
                IControl selectValueInDropdown = DS_StudyProperties.LabDropDownOptions;

                string selectValue = Control_PropertyUtilities.GetText(selectValueInDropdown);
                bool found = false;
                List<String> dropdownvalues = Control_ActionUtilities.Dropdown_GetItems(dropdowncontrol, out found);
                if (found)
                {
                    bool comparison = DL_Lab_MRR_Table.AreListsEqual(dropdown, dropdownvalues);
                }
                return true;
            }             
        
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool selectValueFromDropDown(String valueToBeSelected, String dropDown)
        {
            try
            {
                IControl dropdowncontrol = DS_StudyProperties.LabDropDown;
                Control_ActionUtilities.Click(dropdowncontrol, "Not able to click on dropdowncontrol");
                IControl selectValueInDropdown = DS_StudyProperties.LabDropDownOptions;
                return Control_ActionUtilities.Dropdown_SelectItem(dropdowncontrol, valueToBeSelected, "Valuenotselected");              
                
                
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool expandSettings()
        {
            try
            {
                
                return Control_ActionUtilities.Click(DS_StudyProperties.SettingsDropdownIcon, "Not able to click on dropdowncontrol");
            
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool MessageDisplayedUponLabsDropDownSelectionToNo(String message)
        {
            try
            {

                 string displayedMessageInApp=Control_PropertyUtilities.GetText(DS_StudyProperties.LabMessageonSelectionOfNoOption);

                return (displayedMessageInApp.Equals(message));

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool VerifyLMSLink(String linkName)
        {
            try
            {
                return !Control_PropertyUtilities.IsControlVisible(DS_StudyProperties.LMSLink);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool Verifytab(String TabName)
        {
            try
            {
                return Control_PropertyUtilities.IsControlVisible(DS_StudyProperties.Tab(TabName));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifytabNotPresent(String TabName)
        {
            try
            {
                return !Control_PropertyUtilities.IsControlVisible(DS_StudyProperties.Tab(TabName));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifyDisplayLMSLink(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(linkName), "Unable to find link " + linkName + " in Designer Home Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }


        public static bool MessageNotDisplayedUponLabsDropDownSelectionToYes(String message)
        {
            try
            {

                return(!(Control_PropertyUtilities.IsControlVisible(DS_StudyProperties.LabMessageonSelectionOfNoOption)));                

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }
        
        public static bool ClickOnButtonInStudyPropertiesPage()
        {
            try
            {

                return Control_ActionUtilities.Click(DS_StudyProperties.Cancel, "NotabletoClickonCancelButton");            

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool MouseHoveronLabsQuestionMark()
        {
            try
            {

                return Control_ActionUtilities.MouseHover(DS_StudyProperties.LabsMouseHover, "Message Not Dispalyed on MouseHover");

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool MessageDisplayedOnMouseHover(string Message1, string Message2)
        {
            try
            {                
                bool found = false;
                String textFromApplication = Control_PropertyUtilities.GetAttributeValue(DS_StudyProperties.LabsMouseHover, "title", out found);
                if(found)
                {
                    string fromFeatureFile = Message1 + "\"Yes\"" + Message2;
                    return textFromApplication.Equals(fromFeatureFile);
                }
               

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool StudyPropertiesPage()
        {
            try
            {
                return ((Control_PropertyUtilities.IsControlVisible(DS_StudyProperties.StudyPropertiesPage)));


            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool SelecttheTab(IEnumerable<Tabs> tabNames)
        {
            bool tabName = false;
            try
            {
                foreach(Tabs tab  in tabNames)
                {
                    IControl tabNameFromApplication = DS_StudyProperties.Tab(tab.TabName);                    
                    tabName = Control_PropertyUtilities.IsControlVisible(tabNameFromApplication); 
                    if(tabName.Equals("false"))
                    {
                        return false;
                    }                                  
                }
                return tabName;

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }
        public static bool ClickOnTheTab(string tabName)
        {
            
            try
            {                
               return  Control_ActionUtilities.Click(DS_StudyProperties.Tab(tabName), "Not able to click on Link");                     

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }       

         public static bool UserShouldSeeThePage(string pageHeaderFromApplication)
        {
            bool found = false;
            try
            {
                IControl pageHeader = DS_StudyProperties.Page(pageHeaderFromApplication);
                string pageHeaderName = Control_PropertyUtilities.GetText(pageHeader);
                if (pageHeaderName.Contains(pageHeaderFromApplication))
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool ClickOnTheFilterButton(string pageHeaderFromApplication)
        {
            bool found = false;
            try
            {
                IControl pageHeader = DS_StudyProperties.Page(pageHeaderFromApplication);
                string pageHeaderName = Control_PropertyUtilities.GetAttributeValue(pageHeader, pageHeaderFromApplication, out found);
                if (pageHeaderName.Equals(pageHeaderFromApplication))
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }        

        public static bool EnterTheCodeLIst(String CodeList)
        {
            try
            {

                IControl CodeListName = DS_StudyProperties.CodelistNameForSearch();
                CodeListName.WebElement.SendKeys(CodeList);
                CodeListName.WebElement.SendKeys(Keys.Enter);


            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }       

        public static bool ClickOnTheFilterButtoninCodeListsPage()
        {
            try
            {

                return Control_ActionUtilities.Click(DS_StudyProperties.FilterIcon, "Unable to click link");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }     

        public static bool UserShouldSeeTheCodelist(String Codelist)
        {
            try
            {
                DS_StudyProperties.FilterIconAtPageLevel().WebElement.Click();         
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }        
         public static bool ClickOnTheCodeList(String Codelist)
        {
            try
            {
                DS_StudyProperties.FilterIconAtPageLevel().WebElement.Click();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }
        
        public static bool VerifyLabsIcon()
        {
            try
            {
                return ((Control_PropertyUtilities.IsControlVisible(DS_StudyProperties.LabsIcon)));                
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

    }
}
