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

namespace Pages.DataLabs.IntegrationManagement
{
    public class DL_DefinePatientIdentifiers
    {
        public static IControl EventDropdown { get { return SyncUtilities.FindElement(By.Id("IntegrationCriteria_ProtocolTabs_ProtocolTab1_ucIntegrationCriteriaMgmtConfig1_ddlEvents")); } }
        public static IControl EventSelectionDropdown { get { return new Control(EventDropdown.WebElement, new SelectElement(EventDropdown.WebElement)); } }
        public static IControl CRFExpandCollapseIcon(string CRFName)
        {
            try
            {
                return SyncUtilities.FindElement(By.XPath("//strong[contains(text()='" + CRFName + "')]/parent::span/preceding-sibling::img"));
            }
            catch(Exception e)
            {
                return null;
            }
        }
        public static IControl DefaultDropdownForQuestionInCRF(string QuestionPrompt)
        {
            try
            {
                IControl Dropdown = SyncUtilities.FindElement(By.XPath("//td[contains(text(), '" + QuestionPrompt + "')]/following-sibling::td/select"));
                return new Control(Dropdown.WebElement, new SelectElement(Dropdown.WebElement));
            }
            catch(Exception e)
            {
                return null;
            }
        }
        public static IControl SaveButton { get { return SyncUtilities.FindElement(By.Id("IntegrationCriteria_ProtocolTabs_ProtocolTab1_ucIntegrationCriteriaMgmtConfig1_btnSave")); } }
        public static IControl SaveAndNextButton { get { return SyncUtilities.FindElement(By.Id("IntegrationCriteria_ProtocolTabs_ProtocolTab1_ucIntegrationCriteriaMgmtConfig1_btnSaveAndNext")); } }
        public static IControl CancelButton { get { return SyncUtilities.FindElement(By.Id("IntegrationCriteria_ProtocolTabs_ProtocolTab1_ucIntegrationCriteriaMgmtConfig1_btnCancel")); } }
        public static IControl FormsLoaded { get { return SyncUtilities.FindVisibleElement(By.XPath("//tr[contains(@id, 'IntegrationCriteria_ProtocolTabs_ProtocolTab1_ucIntegrationCriteriaMgmtConfig1_rptForms')]")); } }
    }
}
