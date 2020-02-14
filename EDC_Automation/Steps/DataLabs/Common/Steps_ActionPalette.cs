using BusinessProcesses.DataLabs.Common;
using System;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Common
{
    [Binding]
    public class Steps_ActionPalette
    {
        [When(@"I click ActionPalette Item ""(.*)"" in ""(.*)"" ActionPalette")]
        [Given(@"I click ActionPalette Item ""(.*)"" in ""(.*)"" ActionPalette")]
        public void WhenIClickActionPaletteItemInActionPalette(string actionPalette_LinkName, string actionPalette)
        {
            if (!BP_ActionPaletteUtilities.InvokeActionPaletteLink(actionPalette_LinkName, actionPalette))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click link ""(.*)"" for the flag type ""(.*)"" in FlagPalette of CRF")]
        public void WhenIClickLinkForTheFlagTypeInActionPaletteOfCRF(String linkName, String flagType)
        {
            if (!BP_ActionPaletteUtilities.ClickLinkUnderFlagsPalette(flagType, linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
