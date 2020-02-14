using BusinessProcesses.WebFocus.Common;
using BusinessProcesses.WebFocus.Helpers;
using Framework.Actions;
using Pages.WebFocus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.WebFocus
{
    [Binding]
    public sealed class wf_steps_Main
    {
        [Then(@"I see WebFocus HomePage")]
        public void ThenISeeWebFocusHomePage()
        {
           if (!BP_wf_VerificationHelpers.IsElementVisibleOnPage(wf_Page_Main.HomePageLogo))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }            

        }

        [When(@"I select ""(.*)"" item from main menu")]
        public void WhenIExpandPlusIconFromMainMenu(string item)
        {
            if (!BP_wf_ActionUtil.SelectModalItemsInMainPage(item))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the Study ""(.*)"" from Domains main page")]
        public void WhenISelectTheStudyFromDomainsMainPage(string StudyName)
        {
            if (!BP_wf_ActionUtil.SelectFolderInDomainsMainPage(StudyName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
            
        }

        [When(@"I select ""(.*)"" from Study Page")]
        public void WhenISelectFromFolderMenu(string folderToSelectInsideStudyPage)
        {
            if (!BP_wf_ActionUtil.SelectFolderInDomainsMainPage(folderToSelectInsideStudyPage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select ""(.*)"" from Standard Report Page")]
        public void WhenISelectFromStandardReportPage(string folderToSelectInsideStandardReportPage)
        {
            if (!BP_wf_ActionUtil.SelectFolderInDomainsMainPage(folderToSelectInsideStandardReportPage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select ""(.*)"" from DataLabs Standard Reports page")]
        public void WhenISelectFromDataLabsStandardReportsPage(string folderToSelectInsideDLStandardReportPage)
        {
            if (!BP_wf_ActionUtil.SelectFolderInDomainsMainPage(folderToSelectInsideDLStandardReportPage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select ""(.*)"" from CRFs Page")]
        public void WhenISelectFromCRFsPage(string ItemToSelectInsideCRFPage)
        {
            if (!BP_wf_ActionUtil.SelectFormInCRFPage(ItemToSelectInsideCRFPage))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }




    }
}
