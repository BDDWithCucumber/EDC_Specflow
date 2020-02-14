using BusinessProcesses.WebFocus.Helpers;
using Framework.Actions;
using Pages.DataLabs.Data;
using Pages.WebFocus;
using Pages.WebFocus.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.WebFocus
{
    [Binding]
    public class wf_steps_Frames
    {
        [Then(@"I see the Main panel Titled ""(.*)""")]
        public void ThenISeeAWindowDisplayedWithHeader(string text)
        {
            if (!BP_wf_FrameHelper.ValidateFrameHeaderText(text))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        //This method verifies any link name inside a panel subtitle

        [Then(@"I see the ""(.*)"" subtitle has the link ""(.*)"" flushed right")]
        public void ThenISeeTheSubtitleHasTheLinkFlushedRight(string PanelTitle, string LinkName)
        {
            if (!BP_wf_FrameHelper.ValidateSectionItemLink(PanelTitle, LinkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see all menu filters default selected as ""(.*)""")]
        public void ThenISeeAllMenuFiltersDefaulSelectedAs(string item)
        {
            if (!BP_wf_FrameHelper.ValidateDefaultSelectedItemInDropDownMenu(item))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Country menu displayed below items")]
        public void ThenISeeCountryMenuDisplayedBelowItems(Table table)
        {
            StringBuilder CountryList = new StringBuilder();
            IEnumerable<FiltersList> Data = table.CreateSet<FiltersList>();
            List<FiltersList> IList = (List<FiltersList>)Data;
            foreach (FiltersList Pat in IList)
            {
                if (!BP_wf_FrameHelper.VerifyItemsInMultiseleableList("Country",Pat.Country))
                {
                    CountryList.Append(Pat.Country + ",");
                }
            }
            if (CountryList.Equals(string.Empty))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Country List: " + CountryList + " is/are not displayed in table. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Site menu displayed below items")]
        public void ThenISeeSiteMenuDisplayedBelowItems(Table table)
        {
            StringBuilder SiteList = new StringBuilder();
            IEnumerable<FiltersList> Data = table.CreateSet<FiltersList>();
            List<FiltersList> IList = (List<FiltersList>)Data;
            foreach (FiltersList Pat in IList)
            {
                if (!BP_wf_FrameHelper.VerifyItemsInMultiseleableList("Site", Pat.Site))
                {
                    SiteList.Append(Pat.Site + ",");
                }
            }
            if (SiteList.Equals(string.Empty))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Site List: " + SiteList + " is/are not displayed in table. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Minutes per CRF: label displayed ""(.*)""")]
        public void ThenISeeMinutesPerCRFLabelDisplayed(int value)
        {
            if (!BP_wf_FrameHelper.VerifyMinutesPerCRFFieldValue(value))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see Include Investigator Radio button selected Yes")]
        public void ThenISeeIncludeInvestigatorRadioButtonSelectedYes()
        {
            if (!BP_wf_FrameHelper.CheckCheckBoxSeletedOrNot(wf_Page_Frame.radio_Yes, true))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see the Select Format sub-title with the below options")]
        public void ThenISeeTheSelectFormatSub_TitleWithTheBelowOptions(Table table2)
        {
            StringBuilder FormatList = new StringBuilder();
            IEnumerable<FiltersList> Data = table2.CreateSet<FiltersList>();
            List<FiltersList> IList = (List<FiltersList>)Data;
            foreach (FiltersList FM in IList)
            {
                if (!BP_wf_FrameHelper.VerifyFormatAvailability(FM.SelectaFormat))
                {
                    FormatList.Append(FM.SelectaFormat + ",");
                }
            }
            if (FormatList.Equals(string.Empty))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Formt List: " + FormatList + " is/are not displayed in table. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see View button flushed right")]
        public void ThenISeeViewButtonFlushedLeft()
        {
            if (!BP_wf_FrameHelper.VerifyButtonOnForms("View"))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I enter Minuter per CRF as ""(.*)""")]
        public void WhenIEnterMinuterPerCRFAs(int value)
        {
            if(!Control_ActionUtilities.Textbox_SetText(wf_Page_Frame.mintuesPerCRF, value.ToString(), "Unable to set Text"))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select format as ""(.*)""")]
        public void WhenISelectFormatAs(string radioText)
        {
            if (!BP_wf_FrameHelper.ClickRadioButton(radioText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select the View button")]
        public void WhenISelectTheViewButton()
        {
            if(!Control_ActionUtilities.ClickModalButton (wf_Page_Frame.view_button))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see HTML report is produced with title ""(.*)""")]
        public void ThenISeeHTMLReportIsProducedWithTitle(string text)
        {
            if (!BP_wf_FrameHelper.ValidateTableTitle(text))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see the grid with rows of data in the columns named below")]
        public void ThenISeeTheGridWithRowsOfDataInTheColumnsNamedBelow(Table table3)
        {
            StringBuilder FormatList = new StringBuilder();
            IEnumerable<FiltersList> Data = table3.CreateSet<FiltersList>();
            List<FiltersList> IList = (List<FiltersList>)Data;
            foreach (FiltersList FM in IList)
            {
                if (!BP_wf_FrameHelper.VerifyColumnText(FM.SelectaFormat))
                {
                    FormatList.Append(FM.SelectaFormat + ",");
                }
            }
            if (FormatList.Equals(string.Empty))
            {
                ScenarioContext.Current["Comments"] = ScenarioContext.Current["Comments"] + "Formt List: " + FormatList + " is/are not displayed in table. \n";
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }



    }
}
