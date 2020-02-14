using Common;
using Common.Enums;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Pages.DataLabs.Data;
using System;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs
{
    public class DL_PatientsPage
    {
        public static IControl StatusBar
        {
            get
            {
                IControl hostTable = SyncUtilities.FindVisibleElement(By.Id("CRF_tblStatusBar"));
                return SyncUtilities.FindVisibleElement_Parent(hostTable.WebElement, By.ClassName("orange"));
            }
        }

        public static IControl SignedByBar
        {
            get
            {
                IControl hostTable = SyncUtilities.FindVisibleElement(By.Id("CRF_tblSignStatus"));
                return SyncUtilities.FindVisibleElement_Parent(hostTable.WebElement, By.ClassName("orange"));
            }
        }
        public static string GetFlatQuestionAnswerCellXpath(string QuestionPrompt)
        {
            //string xpath = "//*[contains(text(), '" + QuestionPrompt + "')]/following-sibling::td";
            //string xpath = "//*[contains(text(), '" + QuestionPrompt + "')]/parent::tr";
            string xpath = "//*[text()='" + QuestionPrompt + "']/parent::tr";
            return xpath;
        }
        public static IControl GetTextBoxOfFlatQuestion(string QuestionPrompt)
        {
            string AnswerCellPath = GetFlatQuestionAnswerCellXpath(QuestionPrompt);
            //return SyncUtilities.FindElement(By.XPath(AnswerCellPath + "[2]//input"));
            return SyncUtilities.FindElement(By.XPath(AnswerCellPath + "/descendant::input"));
            /*IReadOnlyCollection<IControl> Cells = SyncUtilities.FindElements(By.XPath("//*[contains(text(), '" + QuestionPrompt + "')]/following-sibling::td"));
            string AnswerCellPath = GetFlatQuestionAnswerCellXpath(QuestionPrompt);
            IReadOnlyCollection<IControl> Cells = SyncUtilities.FindElements(By.XPath(AnswerCellPath));
            foreach (IControl Cell in Cells)
            {
                IWebElement InputBox = Cell.WebElement.FindElement(By.XPath("//input"));
                if (InputBox != null)
                {
                    //return new Control(InputBox);
                }
            }
            return null;*/
        }
        public static IControl GetRadioButtonOfFlatQuestion(string QuestionPrompt, string RadioOption)
        {
            string AnswerCellPath = GetFlatQuestionAnswerCellXpath(QuestionPrompt);
            return SyncUtilities.FindElement(By.XPath(AnswerCellPath + "[2]//label[contains(text(), '" + RadioOption + "')]/preceding-sibling::input"));
            /* IReadOnlyCollection<IControl> Cells = SyncUtilities.FindElements(By.XPath(AnswerCellPath));
             foreach (IControl Cell in Cells)
             {
                 IWebElement RadioButton = Cell.WebElement.FindElement(By.XPath("//label[contains(text(), '" + RadioOption + "')]/preceding-sibling::input"));
                 if (RadioButton != null)
                 {
                     return new Control(RadioButton);
                 }
             }
             return null;*/
        }
        public static IControl GetListBoxOfFlatQuestion(string QuestionPrompt)
        {
            string AnswerCellPath = GetFlatQuestionAnswerCellXpath(QuestionPrompt);
            return SyncUtilities.FindElement(By.XPath(AnswerCellPath + "[2]//select"));
            /*IReadOnlyCollection<IControl> Cells = SyncUtilities.FindElements(By.XPath(AnswerCellPath));
            foreach (IControl Cell in Cells)
            {
                IWebElement ListBox = Cell.WebElement.FindElement(By.XPath("//select"));
                if(ListBox != null)
                {
                    return new Control(ListBox);
                }
            }
            return null;*/
        }
        public static IControl AddPatientLabel { get { return SyncUtilities.FindElement(By.Id("PatientAdd_lblPatient")); } }
        public static IControl SaveNCloseBtn_AddPatient { get { return SyncUtilities.FindElement(By.Id("btnSave")); } }
        public static IControl SaveNAddAnotherBtn_AddPatient { get { return SyncUtilities.FindElement(By.Id("btnSaveAddAnother")); } }
        public static IControl SaveNEnterBtn_AddPatient { get { return SyncUtilities.FindElement(By.Id("btnSaveEnterData")); } }
        public static IControl CancelBtn_AddPatient { get { return SyncUtilities.FindElement(By.Id("PatientAdd$btnCancel")); } }
        public static IControl PatientsTable { get { return SyncUtilities.FindElement(By.XPath("//td[@id='bodyCol']//b[contains(text(), 'Patient ID')]/ancestor::tbody[1]")); } }
        public static IControl SelectedPatient { get { return SyncUtilities.FindVisibleElement(By.XPath("//td[contains(text(), 'Patient:')]/span")); } }
        public static IControl SelectedPatientStatus { get { return SyncUtilities.FindVisibleElement(By.XPath("//td[contains(text(), 'Status:')]/b")); } }
        public static IControl SelectedPatientProtocol { get { return SyncUtilities.FindVisibleElement(By.XPath("//td[contains(text(), 'Protocol:')]/b")); } }
        public static IControl SelectedPatientPrimaryInvest { get { return SyncUtilities.FindVisibleElement(By.XPath("//td[contains(text(), 'Primary Investigator:')]/b")); } }
        public static string GetPatientActionPaletteID(string ActionPaletteName)
        {
            string ID = string.Empty;
            switch (ActionPaletteName)
            {
                case "Site Patient Actions":
                    ID = "PatientSiteActions";
                    break;
                case "Patient Actions":
                    ID = "PatientPortalActions";
                    break;
            }
            return ID;
        }      
    }
}