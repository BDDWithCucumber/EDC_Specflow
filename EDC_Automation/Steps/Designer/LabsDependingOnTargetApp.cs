using BusinessProcesses.Designer;
using BusinessProcesses.Designer.Common;
using NUnit.Framework;
using Pages.DataLabs.Data;
using Pages.Designer.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.Designer
{
    [Binding]
    public sealed class LabsDependingOnTargetApp : TechTalk.SpecFlow.Steps
    {
        [When(@"I select value ""(.*)"" from the ""(.*)"" drop down of Study page")]
        public void WhenISelectValueFromTheDropDownOfStudyPage(string dropdownValue, string dropdownName)
        {
            if (!DS_BP_StudyProperties.SetDropdownValue(dropdownName, dropdownValue))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter study details")]
        public void WhenIEnterSitesDetailsAndSave(Table studyList)
        {
            List<String> failSiteList = new List<String>();
            if (!BP_DS_StudyCreationUtilities.AddStudy(studyList.CreateSet<StudyData>(), out failSiteList))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I should see the Local Labs drop down state as ""(.*)"" in Other section")]
        [Then(@"I should see the Labs drop down state as ""(.*)"" in Other section")]
        public void ThenIShouldSeeTheLabsDropDownStateAsInOtherSection(string status)
        {
            if (!DS_BP_StudyProperties.LabsDropDownStatus(status))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the selected Local Labs value as ""(.*)"" in the drop down of Other section")]
        [Then(@"I should see the selected Labs value as ""(.*)"" in the drop down of Other section")]
        public void ThenIShouldSeeTheSelectedLabsValueAsInTheDropDownOfOtherSection(string Value)
        {
            if (!DS_BP_StudyProperties.LabsDropDownDefaultValue(Value))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the below drop down options once I click on ""(.*)"" drop down")]
        public void ThenIShouldSeeTheBelowDropDownOptionsOnceOnClickOnDropDown(String fieldName, Table table)
        {
            IEnumerable<DropDownInfo> dropdown = table.CreateSet<DropDownInfo>();            
            if (!DS_BP_StudyProperties.VerifylabsDropDownValues((List<DropDownInfo>)dropdown, fieldName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //[When(@"I Select ""(.*)"" from the Labs drop down")]
        //public void WhenISelectFromTheLabsDropDown(string valueToBeSelectedFromDropDown)
        //{
        //    if (!DS_BP_StudyProperties.selectValueFromDropDown((valueToBeSelectedFromDropDown))
        //    {
        //        ScenarioContext.Current["ActResult"] = "Failed";
        //    }
        //}

        [When(@"I Select ""(.*)"" from the ""(.*)"" drop down")]
        public void WhenISelectFromTheDropDown(string valueToBeSelectedFromDropDown, string labsDropDown)
        {
            if (!DS_BP_StudyProperties.selectValueFromDropDown(valueToBeSelectedFromDropDown, labsDropDown))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click on the Settings drop Icon")]
        public void WhenIClickOnTheSettingsDropIcon()
        {            
            if (!DS_BP_StudyProperties.expandSettings())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see the message ""(.*)"" below the Local Labs drop down")]
        [Then(@"I should see the message ""(.*)"" below the Labs drop down")]
        [When(@"I should see the message ""(.*)"" below the Labs drop down")]
        public void ThenIShouldSeeTheMessageBelowTheLabsDropdown(string message)
        {
            if (!DS_BP_StudyProperties.MessageDisplayedUponLabsDropDownSelectionToNo(message))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should not see the message ""(.*)"" below the Labs drop down")]
        public void ThenIShouldNotSeeTheMessageBelowTheLabsDropDown(string message)
        {
            if (!DS_BP_StudyProperties.MessageNotDisplayedUponLabsDropDownSelectionToYes(message))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click on the Cancel button in Study Properties page")]
        [When(@"I click on the Cancel button in Study Properties page")]
        public void ThenIClickOnTheCancelButtonInStudyPropertiesPage()
        {
            if (!DS_BP_StudyProperties.ClickOnButtonInStudyPropertiesPage())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I should see the Dict notification ""(.*)""")]
        [Then(@"I should see the Dict notification ""(.*)""")]
        public void WhenIShouldSeeTheDictNotification(string notificationMessage)
        {           
                if (!DS_BP_NotificationUtilities.VerifyNotificationForDict(notificationMessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see the Lab test ""(.*)"" in table of lab Dictionary page")]
        public void ThenISeeTheLabTestInTableOfLabDictionaryPage(int columnno)
        {
            if (!DS_BP_StudyProperties.ClickOnButtonInStudyPropertiesPage())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I Mouse hover on Labs Question")]
        public void WhenIMouseHoverOnLabsQuestion()
        {
            if (!DS_BP_StudyProperties.MouseHoveronLabsQuestionMark())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should see the message ""(.*)""Yes""(.*)""")]
        public void ThenIShouldSeeTheMessageonMouseover(string p0, string p1)
        {
            if (!DS_BP_StudyProperties.MessageDisplayedOnMouseHover(p0,p1))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        public void ThenIShouldSeeTheMessageYes(string p0, string p1)
        {
            if (!DS_BP_StudyProperties.ClickOnButtonInStudyPropertiesPage())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


    }
}
