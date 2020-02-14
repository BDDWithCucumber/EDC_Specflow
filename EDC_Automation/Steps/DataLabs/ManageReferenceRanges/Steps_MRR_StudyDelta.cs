using BusinessProcesses.DataLabs.ManageReferenceRanges;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.ManageReferenceRanges
{
    [Binding]
    public class Steps_MRR_StudyDelta
    {
        [When(@"I Wait until the study publish is complete for ""(.*)"" Study")]
        public void WhenIWaitUntilTheStudyPublishIsCompleteForStudy(string studyLabel)
        {
            if (!BP_Mrr_StudyDeltaChanges.PublishStudy(studyLabel))
            {

                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }


        [Then(@"I should see the below mentioned Lab Tests in Mrr page that are marked as yes for Reference Range in the study file")]
        public void ThenIShouldSeeTheBelowMentionedLabTestsInMrrPageThatAreMarkedAsYesForReferenceRangeInTheStudyFile(Table table)
        {
            List<Mrr_LabTests> labNameList = table.CreateSet<Mrr_LabTests>().ToList();
            foreach(Mrr_LabTests labName in labNameList)
            {
                if (!BP_Mrr_StudyDeltaChanges.FindLabTest(labName.LabTestName))
                {

                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }            
        }

        [Then(@"I should see the unit value as ""(.*)"" for the existing records in the MRR table of MRR page")]
        public void ThenIShouldSeeTheUnitValueAsForTheExistingRecords(string empty)
        {
            if (!BP_Mrr_StudyDeltaChanges.FindValueInUnit(empty))
            {

                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I should not see the below mentioned Lab Tests in Mrr page that are marked as No for Reference Range in the study file")]
        [Then(@"I should not see the below mentioned Lab Tests in Mrr page which are not present in the input study file")]
        public void ThenIShouldNotSeeTheBelowMentionedLabTestsInMrrPageThatAreMarkedAsNoForReferenceRangeInTheStudyFile(Table table)
        {
            List<Mrr_LabTests> labNameList = table.CreateSet<Mrr_LabTests>().ToList();
            foreach (Mrr_LabTests labName in labNameList)
            {
                if (BP_Mrr_StudyDeltaChanges.FindLabTest(labName.LabTestName))
                {

                    ScenarioContext.Current["ActResult"] = "Failed";
                }
            }
        }

        [Then(@"I should see the below records in the ManageReferenceRanges page")]
        public void ThenIShouldSeeTheBelowRecordsInTheManageReferenceRangesPage(Table mrrRecords)
        {
            IEnumerable<ReferenceRangesData> records = mrrRecords.CreateSet<ReferenceRangesData>();
            List<ReferenceRangesData> mismatchedRecords = null;
            if (!BP_Mrr_StudyDeltaChanges.AreMRRRecordsAvailableWithDetails(records, out mismatchedRecords))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

    }
}
