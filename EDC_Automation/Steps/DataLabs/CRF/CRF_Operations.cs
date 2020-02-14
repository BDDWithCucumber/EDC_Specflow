using BusinessProcesses.DataLabs.Main.CRF;
using BusinessProcesses.DataLabs.Patients;
using BusinessProcesses.DataLabs.Patients.Form;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.CRF
{
    [Binding]
    class CRF_Operations
    {
        [When(@"I click ""(.*)"" button on ""(.*)"" CRF")]
        public void WhenIClickButtonOnCRF(String buttonText, String formName)
        {
            if (!BP_CRFUtilities.SelectButtonOnCRF(formName, buttonText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select entry complete checkbox on CRF")]
        public void WhenISelectEntryCompleteCheckboxOnCRF()
        {
            if (!BP_CRFUtilities.SelectEntryCompleteChkBox())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I see top orange bar with message ""(.*)"" on CRF")]
        [Then(@"I see top orange bar with checked out message ""(.*)"" on CRF")]
        public void ThenISeeTopOrangeBarWithCheckedOutMessageOnCRF(String formCheckedoutMessage)
        {
            if (!BP_CRFUtilities.IsCheckedOutMessageDisplayed(formCheckedoutMessage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see icon ""(.*)"" against question ""(.*)""")]
        public void ThenISeeIconAgainstQuestion(String iconName, String questionPrompt)
        {
            if (!BP_CRF_IconUtilities.IsIconAvailable_FlatQuestion(questionPrompt, iconName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I dont see icon ""(.*)"" for the flat question ""(.*)"" in CRF")]
        public void ThenIDontSeeIconForTheFlatQuestionInCRF(string iconName, string questionPrompt)
        {
            if (BP_CRF_IconUtilities.IsIconAvailable_FlatQuestion(questionPrompt, iconName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I open main tab ""(.*)"" of Form")]
        [Then(@"I open main tab ""(.*)"" of Form")]
        public void ThenIOpenMainTabOfCRF(String tabName)
        {
            if (!BP_FormUtilities.OpenMainTabInForm(tabName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click icon ""(.*)"" for the flat question ""(.*)"" in CRF")]
        public void WhenIClickIconForTheFlatQuestionInCRF(string iconName, string questionPrompt)
        {
            if (!BP_CRF_IconUtilities.InvokeIcon_FaltQuestion(questionPrompt, iconName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select form ""(.*)"" in SubmitCRFsPage")]
        public void WhenISelectFormInSubmitCRFsPage(String formName)
        {
            if (!BP_SubmitCRFsUtilities.SelectForm(formName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click save button in SubmitCRFsPage")]
        public void WhenIClickSaveButtonInSubmitCRFsPage()
        {
            if (!BP_SubmitCRFsUtilities.ClickSaveButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I dont see sub tab ""(.*)"" in CRF")]
        public void ThenIDontSeeSubTabInCRF(String tabName)
        {
            bool verified = false;
            bool isTabAvailable = BP_FormUtilities.IsTabAvailable(tabName, out verified);
            if (verified && isTabAvailable)
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }

        [When(@"I expand row ""(.*)"" of table ""(.*)""")]
        public void WhenIExpandRowOfTable(int rowNumber, String tableName)
        {
            if(!BP_CRFUtilities.ExpandTableRow(tableName, rowNumber))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click ""(.*)"" icon of a question ""(.*)"" of table ""(.*)""")]
        [When(@"I click ""(.*)"" icon of a question ""(.*)"" of table ""(.*)""")]
        [Given(@"I click ""(.*)"" icon of a question ""(.*)"" of table ""(.*)""")]
        public void WhenIClickIconOfAQuestionOfTable(String iconName, String questionPrompt, String tableName)
        {
            if (!BP_CRF_IconUtilities.InvokeIcon_TableQuestion(tableName, questionPrompt, iconName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I see icon ""(.*)"" of a question ""(.*)"" of table ""(.*)""")]
        [Then(@"I see icon ""(.*)"" of a question ""(.*)"" of table ""(.*)""")]
        public void ThenISeeIconOfAQuestionOfTable(String iconName, String questionPrompt, String tableName)
        {
            if (!BP_CRF_IconUtilities.IsIconAvailable_TableQuestion(tableName, questionPrompt, iconName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I shall not see ""(.*)"" icon of a question ""(.*)"" of table ""(.*)""")]
        public void ThenIShallNotSeeIconOfAQuestionOfTable(String iconName, String questionPrompt, String tableName)
        {
            if (BP_CRF_IconUtilities.IsIconAvailable_TableQuestion(tableName, questionPrompt, iconName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [When(@"I clear question ""(.*)"" of table ""(.*)""")]
        public void WhenIClearQuestionOfTable(String questionPrompt, String tableName)
        {
            if (!BP_CRF_IconUtilities.ClearItem(tableName, questionPrompt))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I clear question ""(.*)""\.")]
        public void WhenIClearQuestion_(string questionPrompt)
        {
            if (!BP_CRF_IconUtilities.ClearItemFlatQuestion(questionPrompt))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click AddComment for question ""(.*)"" of table ""(.*)""")]
        public void WhenIClickAddCommentForQuestionOfTable(String questionPrompt, String tableName)
        {
            if (!BP_CRF_IconUtilities.InvokeAddComment(tableName, questionPrompt))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I click table row button ""(.*)"" of table ""(.*)""")]
        [When(@"I click table row button ""(.*)"" of table ""(.*)""")]
        public void WhenIClickTableRowButtonOfTable(String buttonName, String tableName)
        {
            if (!BP_CRFUtilities.ClickTableButtonForExpandedRow(tableName, buttonName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I see deleted row ""(.*)"" of table ""(.*)""")]
        public void ThenISeeDeletedRowOfTable(int rowNumber, String tableName)
        {
            if (!BP_CRFUtilities.IsTableRowDeleted(tableName, rowNumber))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see restored row ""(.*)"" of table ""(.*)""")]
        public void ThenISeeRestoredRowOfTable(int rowNumber, String tableName)
        {
            if (!BP_CRFUtilities.IsTableRowRestored(tableName, rowNumber))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I see flag ""(.*)"" icon ""(.*)"" against question ""(.*)""")]
        public void ThenISeeFlagIconAgainstQuestion(string flagType, string iconName, string QuestionPrompt)
        {
            if(!BP_CRF_IconUtilities.IsIconAvailable_FlatQuestion(QuestionPrompt, iconName, flagType))
            {
                ScenarioContext.Current["ActResult"] = "Failed";

            }
        }

        [Then(@"I see flag ""(.*)"" icon ""(.*)"" of a question ""(.*)"" of table ""(.*)""")]
        public void ThenISeeFlagIconOfAQuestionOfTable(string flagType, string iconName, string QuestionPrompt, string tableName)
        {
            if(!BP_CRF_IconUtilities.IsIconAvailable_TableQuestion(tableName,QuestionPrompt,iconName,flagType))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }

        }
        [Then(@"I should see icon Above Normal Range High indicator for question ""(.*)"" in table ""(.*)""\.")]
        public void ThenIShouldSeeIconAboveNormalRangeHighIndicatorForQuestionInTable_(string questionPrompt, string TableName)
        {
            if(!BP_CRF_IconUtilities.IconVisualIndicator(TableName, questionPrompt))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should see icon Below Normal Range Low indicator for question ""(.*)"" in table ""(.*)""\.")]
        public void ThenIShouldSeeIconBelowNormalRangeLowIndicatorForQuestionInTable_(string questionPrompt, string TableName)
        {
            if (!BP_CRF_IconUtilities.IconLowVisualIndicator(TableName, questionPrompt))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I should not see visual indicator for question ""(.*)"" in table ""(.*)""\.")]
        public void ThenIShouldNotSeeVisualIndicatorForQuestionInTable_(string questionPrompt, string TableName)
        {
            if (!BP_CRF_IconUtilities.NoVisualIndicatorIcon(TableName, questionPrompt))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I dont see table history icon for table ""(.*)""")]
        public void ThenIDontSeeTableHistoryIconForTable(string tableName)
        {
            if (DL_CRF_QuestionBase.IsTableHistoryIconAvailable(tableName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


    }
}
