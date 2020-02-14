using BusinessProcesses.DataLabs.SignatureManagement;
using TechTalk.SpecFlow;

namespace EDC_Automation.Steps.DataLabs.Main
{
    [Binding]
    public class Steps_SignatureManagement
    {
        [When(@"I click PISignature in SignatureManagementPage")]
        public void WhenIClickPISignatureInSignatureManagementPage()
        {
            if (!BP_SignatureManagementUtilities.ClickPISignatureLink())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see editable attestatin text in PISignaturePage")]
        public void ThenISeeEditableAttestatinTextInPISignaturePage()
        {
            if (!BP_PISignatureUtilities.IsAttestationEditable())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
