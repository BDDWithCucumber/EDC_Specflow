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

namespace Pages.Designer
{
    public class DS_Forms
    {
        public static IControl FormsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ctl00_ctl00_ContentBody_ContentBody_grdFormsPanel > .RadGrid.RadGrid_Designer > .rgMasterTable#ctl00_ctl00_ContentBody_ContentBody_grdForms_ctl00"));
            }
        }
        public static IControl QuestionsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdFormDetails_ctl00"));
            }
        }

        public static IControl DomainItemsListTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".RadGrid.RadGrid_Designer > .rgMasterTable#ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00"));
            }
        }

        public static IControl DomainNameInQuestionPage
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[@name='ctl00$ctl00$ContentBody$ContentBody$questionTab$ddlDomainNames']//option[@selected='selected']"));
            }
        }

        public static IControl DomainNameInTablePage
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[@name='ctl00$ctl00$ContentBody$ContentBody$ddlDomainNames']//option[@selected='selected']"));
            }
        }

        public static IControl DomainItemInQuestionPage
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[@name='ctl00$ctl00$ContentBody$ContentBody$questionTab$ddlDomainItems']//option[@selected='selected']"));
            }
        }

        public static IControl KeySequenceInQuestionPage
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[@name='ctl00$ctl00$ContentBody$ContentBody$questionTab$ddlKeySequence']//option[@selected='selected']"));
            }
        }

        public static IControl CodelistInQuestion
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//input[@id='ctl00_ctl00_ContentBody_ContentBody_questionTab_questionData_txtCodelistName']"));
            }
        }

        public static IControl TableNameInTable
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//input[@name='ctl00$ctl00$ContentBody$ContentBody$txtTableName']"));
            }
        }

        public static IControl TablePromptInTable
        {
            get
            {
                return SyncUtilities.FindElement(By.Name("ctl00$ctl00$ContentBody$ContentBody$txtTablePrompt"));
            }
        }

        public static IControl HeaderInQuestion
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//input[@id='ctl00_ctl00_ContentBody_ContentBody_questionTab_txtHeaderName']"));
            }
        }
        public static IControl Delete
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_lblFormName"));
            }
        }

        public static IControl FormQuestionsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ctl00_ctl00_ContentBody_ContentBody_grdFormDetailsPanel > .RadGrid.RadGrid_Designer > .rgMasterTable#ctl00_ctl00_ContentBody_ContentBody_grdFormDetails_ctl00"));
            }
        }

        public static IControl FormQuestionsHeader
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_lblFormName"));
            }
        }

        public static IControl TableName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_txtTableName"));
            }
        }

        public static IControl CodeList
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl05_ddlCodeLists"));
            }
        }
        public static IControl CodeListSelectionDropDown { get { return new Control(CodeList.WebElement, new SelectElement(CodeList.WebElement)); } }

        public static IControl Datatype
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl05_ddlDataTypeList"));
            }
        }
        public static IControl DatatypeSelectionDropDown { get { return new Control(Datatype.WebElement, new SelectElement(Datatype.WebElement)); } }

        public static IControl Source
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_Item_grdDomainitems_ctl00_ctl09_ddlSourceList"));
            }
        }
        public static IControl SourceSelectionDropDown { get { return new Control(Source.WebElement, new SelectElement(Source.WebElement)); } }

        public static IControl DisplayOptions
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_ddlDisplayOptions"));
            }
        }

        public static IControl ItemName
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_ddlConditionalItems"));
            }
        }
        public static IControl ItemNameSelectionDropDown { get { return new Control(ItemName.WebElement, new SelectElement(ItemName.WebElement)); } }

        public static IControl Comparator
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_ddlComparators"));
            }
        }
        public static IControl ComparatorSelectionDropDown { get { return new Control(Comparator.WebElement, new SelectElement(Comparator.WebElement)); } }

        public static IControl Values
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_txtConditionalValues"));
            }
        }

        public static IControl Save
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_Save2"));
            }
        }

        public static IControl SaveNext
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_SaveNext2"));
            }
        }

        public static IControl SaveNextInTable
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[@value='Save & Next']"));
            }
        }

        public static IControl AutoBuildSaveNext
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_btnSaveNext"));
            }
        }

        public static IControl DataGroup
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_ddlDataGroups"));
            }
        }
        public static IControl DataGroupSelectionDropDown { get { return new Control(DataGroup.WebElement, new SelectElement(DataGroup.WebElement)); } }

        public static IControl CheckBox
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_ddlDisplayOptions"));
            }
        }
        public static IControl CheckBoxSelectionDropDown { get { return new Control(CheckBox.WebElement, new SelectElement(CheckBox.WebElement)); } }


        public static IControl CodeListGroup
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_questionData_rcbGroups_Input"));
            }
        }

        public static IControl CodeListLinkage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_questionData_rcbLinkages_Input"));
            }
        }

        public static IControl HeaderName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_txtHeaderName"));
            }
        }

        public static IControl TableNameInQuestion
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_txtTableName"));

            }
        }

        public static IControl KeySequence
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_ddlKeySequence"));
            }
        }
        public static IControl KeySequenceSelectionDropDown { get { return new Control(KeySequence.WebElement, new SelectElement(KeySequence.WebElement)); } }

        public static IControl GetChildQuestionLink(String linkName)
        {
            return SyncUtilities.FindVisibleElement(By.LinkText(linkName));
        }

        public static IControl GetAutoBuildChildQuestionLink(String linkName)
        {
            return SyncUtilities.FindVisibleElement(By.LinkText(linkName));
        }

        public static IControl ChildQuestion
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentLeft_ContentLeft_questionNav_NavRepeater_ctl03_lnkDetails"));
            }
        }

        public static IControl AutoBuildChildQuestion
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentLeft_ContentLeft_questionNav_NavRepeater_ctl06_lnkDetails"));
            }
        }

        public static IControl QuestionHidden
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_rdoHidden"));
            }
        }

        public static IControl QuestionNone
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_rdoNone"));
            }
        }

        public static IControl LabMappingFormDomainName
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_ddlDomainNames"));
            }
        }

        public static IControl LabMappingFormDomainNameInTable
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_ddlDomainNames"));
            }
        }
        public static IControl SelectionFormQuestionDomainName { get { return new Control(LabMappingFormDomainName.WebElement, new SelectElement(LabMappingFormDomainName.WebElement)); } }

        public static IControl SelectionDomainInTableName { get { return new Control(LabMappingFormDomainNameInTable.WebElement, new SelectElement(LabMappingFormDomainNameInTable.WebElement)); } }
        public static IControl LabMappingFormItemName
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_ddlDomainItems"));
            }
        }
        public static IControl SelectionFormQuestionItemName { get { return new Control(LabMappingFormItemName.WebElement, new SelectElement(LabMappingFormItemName.WebElement)); } }

        public static IControl AutoBuildTableDomainName
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_ddlDomainNames"));
            }
        }
        public static IControl SelectionAutoBuildTableDomainName { get { return new Control(AutoBuildTableDomainName.WebElement, new SelectElement(AutoBuildTableDomainName.WebElement)); } }

        public static IControl FormName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdForms_ctl00_ctl02_ctl04_txtFName"));
            }
        }

        public static IControl Formlabel
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdForms_ctl00_ctl02_ctl04_txtFormLabel"));
            }
        }

        public static IControl FormSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_grdForms_ctl00_ctl02_ctl04_btnSave"));
            }
        }

        public static IControl StructureFixedCheckBox
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_chkStructFixed"));
            }
        }

        public static IControl AutoBuildSaveAndCloseButton
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_btnSaveClose"));
            }
        }

        public static IControl pageHeader
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//h1"));
            }

        }

        public static IControl Question
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_grdFormDetails_ctl00_ctl02_ctl02_txtQPromptLabel"));
            }

        }

        public static IControl QuestionSaveButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_grdFormDetails_ctl00_ctl02_ctl02_btnSave"));
            }

        }

        public static IControl QuestionSaveButtonInTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//*[@title='Save']"));
            }

        }
        public static IControl QuestionDomainItem
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_ddlDomainItems"));
            }

        }

        public static IControl AddQuestionButtonInTable(String TableName)
        {
            
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//*[text()='"+TableName+"']//../../../../following-sibling::*[1]//a[contains(@id,'lnkAddQuestionTable')]"));
            }

        }

        public static IControl AddQuestionTextBoxInTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//*[contains(@id,'ctl00_ctl00_ContentBody_ContentBody_grdFormDetails') and contains(@id,'txtTableQPromptLabel')]"));
            }
        }

        public static IControl TableNameToBeEntered()
        {
            return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_txtTableName"));
        }

        public static IControl AddHeaderInQuestion()
        {
           return SyncUtilities.FindVisibleElement(By.XPath("//input[@id='ctl00_ctl00_ContentBody_ContentBody_questionTab_txtHeaderName']"));
        }

        public static IControl AutoBuildCheckBox()
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//input[@id='ctl00_ctl00_ContentBody_ContentBody_chkAutoBuild']"));
        }
        public static IControl AutoBuildCheckBoxVerification()
        {
            return SyncUtilities.FindElement(By.XPath("//input[@id='ctl00_ctl00_ContentBody_ContentBody_chkAutoBuild' and @checked='checked']"));
        }

        public static IControl IsLinkExists(String Link)
        {
            return SyncUtilities.FindElement(By.XPath("//a[text()='"+Link+"']"));
        }

        public static IControl IsItemExists(String ItemName)
        {
            return SyncUtilities.FindElement(By.XPath("//*[contains(@id,'ItemName') and text()='" + ItemName + "']"));
        }

        public static IControl KeySequenceElement
        {
            get
            {
                return SyncUtilities.FindElement(By.Name("ctl00$ctl00$ContentBody$ContentBody$questionTab$ddlKeySequence"));
            }
        }
        public static IControl KeySequenceInQuestion { get { return new Control(KeySequenceElement.WebElement, new SelectElement(KeySequenceElement.WebElement)); } }
    }
}
