using BusinessProcesses.Designer;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.Designer;
using Pages.Designer.Data;
using Pages.Designer.Domains;
using Pages.Designer.Study_Management_Jobs;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace BusinessProcesses.Forms
{
    public class FormQuestionsUtilities
    {
        public static bool VerifyFormName(String formName)
        {
            try
            {
                String FormHeader = Control_PropertyUtilities.GetText(DS_Forms.FormQuestionsHeader);
                FormHeader.Equals(formName, StringComparison.InvariantCultureIgnoreCase);
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool ClickFormParentQuestionsLink(String process)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(11, process, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(DS_Forms.FormQuestionsTable, list);
                IControl proecssCell = WebTableUtilities.GetCell(processRow, 11);
                IControl processLink = StudyManagemantJobsPage.GetProcessLink(proecssCell, process);
                return Control_ActionUtilities.Click(processLink, "Unable to click process link " + process);
            }
            catch (Exception e)
            {

            }
            return false;
        }

        //public static bool SetQuestionsData(IEnumerable<FormQuestionsData> questionsdata, string questionLink)
        //{
        //    foreach (FormQuestionsData data in questionsdata)
        //    {
        //        if ((FormQuestionsUtilities.EnterStudyData(data, questionLink)))
        //        {
        //            Control_ActionUtilities.Click(DS_Forms.Save, String.Empty);

        //        }
        //    }
        //    return true;
        //}

        //public static bool EnterStudyData(FormQuestionsData study, string questionLink)
        //{
        //    BP_DS_HomePageUtilities.ClickLinkInDesignerHomePage(questionLink);
        //    //FormQuestionsUtilities.SetStudyData(DS_StudyProperties.StudyTable, study);
        //    return true;
        //}

        //public static void SetStudyData(IControl studyTable, FormQuestionsData study)
        //{

        //    //SetStudyFieldData_Dropdown(studyTable, "Therapeutic Area:", study.TherapeuticArea);
        //    //SetStudyFieldData_Dropdown(studyTable, "Therapeutic Area:", study.TherapeuticArea);
        //}

        //static bool SetStudyFieldData_Dropdown(IControl StudyTable, String searchText, String valueToSet)
        //{
        //    if (valueToSet != null)
        //    {
        //        IControl row = WebTableUtilities.Table_FindRow(StudyTable, GetSearchItemList(searchText));
        //        IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Dropdown);
        //        return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
        //    }
        //    return false;
        //}

        public static bool ClickFormChildQuestionsLink(String childQuestion)
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(DS_Forms.GetChildQuestionLink(childQuestion), "Unable to find link " + childQuestion + " in Designer Home Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool ClickFormAutoBuildChildQuestionsLink(String autoBuildChildQuestion)
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(DS_Forms.GetAutoBuildChildQuestionLink(autoBuildChildQuestion), "Unable to find link " + autoBuildChildQuestion + " in Designer Home Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }


        public static bool ClickDomainsItemsEditLink(String process)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, process, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(DS_Forms.DomainItemsListTable, list);
                IControl proecssCell = WebTableUtilities.GetCell(processRow, 14);
                IControl cellImage = WebTableUtilities.GetInputControl(proecssCell);
                Control_ActionUtilities.Click(cellImage, "Unable to click Image" + process);
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool SelectKeySequenceItem(string keySequenceItem)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.KeySequenceSelectionDropDown, keySequenceItem, "Unable to select " + keySequenceItem);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectPortalDropdownKeySequenceItem(int keySequenceItem)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.KeySequenceSelectionDropDown, keySequenceItem.ToString(), "Unable to select " + keySequenceItem);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectPortalDropdownCheckboxItem(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.CheckBoxSelectionDropDown, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectPortalDropdownConditionalItem(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.SelectionFormQuestionItemName, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectSourceItem(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.SourceSelectionDropDown, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectDatatypeItem(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.DatatypeSelectionDropDown, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectCodelistItem(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.CodeListSelectionDropDown, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectAutobuildFormDomain(String itemName)
        {
            //Thread.Sleep(3000);
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.SelectionFormQuestionDomainName, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectAutobuildtableDomainname(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.SelectionFormQuestionDomainName, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectAutobuildtableDomainName(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.SelectionAutoBuildTableDomainName, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectAutobuildFormItemName(String itemName)
        {
            //Thread.Sleep(3000);
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.SelectionFormQuestionItemName, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectPortalDropdownComparatorItem(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.ComparatorSelectionDropDown, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool KeySequenceItems(String headerName, int p0)
        {
            try
            {
                string str = Convert.ToString(p0);
                Control_ActionUtilities.Textbox_SetText(DS_Forms.HeaderName, headerName, String.Empty);
                Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.KeySequence, str, "Unable to select sponsor");
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool Conditionalitems(String itemName, String Comparator, String value)
        {
            try
            {
                Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.ItemName, itemName, "Unable to select sponsor");

                Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.Comparator, Comparator, "Unable to select sponsor");

                Control_ActionUtilities.Textbox_SetText(DS_Forms.Values, value, String.Empty);
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool SelectDataGroupItem(String sponsorName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.DataGroupSelectionDropDown, sponsorName, "Unable to select " + sponsorName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetValue(String value)
        {
            return Control_ActionUtilities.Textbox_SetText(DS_Forms.Values, value, String.Empty);
        }

        public static bool SetHeaderName(String headerName)
        {
            return Control_ActionUtilities.Textbox_SetText(DS_Forms.HeaderName, headerName, String.Empty);
        }

        public static bool SelectGroupLinkageItem(String codeListGroup, String codeListLinkage)
        {
            try
            {
                Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.CodeListGroup, codeListGroup, "Unable to select sponsor");
                Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.CodeListLinkage, codeListLinkage, "Unable to select sponsor");
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool QuestionHiddenRadioButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.QuestionHidden, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool QuestionNoneRadioButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.QuestionNone, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickSaveButtonOnQuestionTab()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.Save, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickSaveAndNextButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.SaveNext, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickSaveAndNextButtonInTable()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.SaveNextInTable, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool AutoBuildClickSaveAndNextButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.AutoBuildSaveNext, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectCodelistGroup(String groupName)
        {
            try
            {
                if (Control_ActionUtilities.Click(DS_QuestionPage.CodelistGroupDropdownInvokerButton, "Unable to click the link"))
                {
                    return Control_ActionUtilities.Click(DS_QuestionPage.GetCodelistGroupItem(groupName), "Unable to click the link");
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool SelectCodelistLinkage(String linkageName)
        {
            try
            {
                if (Control_ActionUtilities.Click(DS_QuestionPage.CodelistLinkageDropdownInvokerButton, "Unable to click the link"))
                {
                    return Control_ActionUtilities.Click(DS_QuestionPage.GetCodelistLinkageItem(linkageName), "Unable to click the link");
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }


        public static bool FormQuestionSaveNext()
        {
            //Thread.Sleep(3000);
            try
            {
                return Control_ActionUtilities.Click(DS_QuestionPage.QuestionSaveAndNext, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool FormQuestionSave()
        {

            try
            {
                return Control_ActionUtilities.Click(DS_QuestionPage.QuestionSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectCodelistLinkageItem(String linkageItemName)
        {
            try
            {
                if (Control_ActionUtilities.Click(DS_QuestionPage.CodelistLinkage_ItemNameDropdownInvokerButton, "Unable to click the link"))
                {
                    return Control_ActionUtilities.Click(DS_QuestionPage.GetCodelistLinkageItem_Item(linkageItemName), "Unable to click the link");
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool UnCheckStructueFixedcheckbox()
        {
            try
            {
                return Control_ActionUtilities.UncheckCheckbox(DS_Forms.StructureFixedCheckBox);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CheckStructueFixedcheckbox()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(DS_Forms.StructureFixedCheckBox);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool AuotBuildSaveAndCloseButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.AutoBuildSaveAndCloseButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool FormQuestion(IEnumerable<FormQuestion> Questions)
        {
            try
            {
                IControl QuestionsTable = DS_Forms.QuestionsTable;
                foreach (FormQuestion question in Questions)
                {
                    WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                    searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, question.Question, TableColumnContentType.Link));
                    IControl row = WebTableUtilities.Table_FindRow(QuestionsTable, searchList, 2);
                    if (!Control_PropertyUtilities.IsControlNull(row))
                    {
                        Control_ActionUtilities.Click(row, "Question not visible");
                        string domainItem = Control_PropertyUtilities.GetText(DS_Forms.LabMappingFormItemName);
                        if (!domainItem.Equals(question.DomainItem))
                        {
                            return false;
                        }

                    }
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectDomainInQuestion(String DomainName)
        {
            try
            {
                Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.SelectionFormQuestionDomainName, DomainName, "Unable to select domain");

                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool SelectDomainInTableName(String DomainName)
        {
            try
            {
                Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.SelectionDomainInTableName, DomainName, "Unable to select domain");

                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool EnterTableName(String TableName)
        {
            try
            {

                IControl ElementTableName = DS_Forms.TableNameToBeEntered();
                ElementTableName.WebElement.SendKeys(TableName);
                //ElementTableName.WebElement.SendKeys(Keys.Enter);

                return true;

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool SelectKeySequenceInQuestion(String KeySequence)
        {
            try
            {
                Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.KeySequenceInQuestion, KeySequence, "Unable to select Key sequence");

                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static String GetDomainDataInQuestion()
        {
            try
            {
                return Control_ActionUtilities.GetTextOfAnObject(DS_Forms.DomainNameInQuestionPage, null, "Question page in form", "Unable to get text");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }

        }

        public static String GetDomainDataInTable()
        {
            try
            {
                return Control_ActionUtilities.GetTextOfAnObject(DS_Forms.DomainNameInTablePage, null, "Question page in form", "Unable to get text");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }

        }

        public static String GetDomainItemDataInQuestion()
        {
            try
            {
                return Control_ActionUtilities.GetTextOfAnObject(DS_Forms.DomainItemInQuestionPage, null, "Question page in form", "Unable to get text");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }

        }

        public static String GetKeySequenceInQuestion()
        {
            try
            {
                return Control_ActionUtilities.GetTextOfAnObject(DS_Forms.KeySequenceInQuestionPage, null, "Question page in form", "Unable to get text");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }

        }

        public static String GetCodelistDataInQuestion()
        {
            try
            {

                return Control_PropertyUtilities.GetAttributeValue(DS_Forms.CodelistInQuestion, "Value", out bool found);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }

        }

        public static String GetTableNameInTable()
        {
            try
            {

                return Control_PropertyUtilities.GetAttributeValue(DS_Forms.TableNameInTable, "value", out bool found);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }

        }

        public static String GetTablePromptInTable()
        {
            try
            {

                return Control_ActionUtilities.GetTextOfAnObject(DS_Forms.TablePromptInTable, null, "Properties Page", "Unable to get text");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }

        }

        public static String GetHeaderDataInQuestion()
        {
            try
            {

                return Control_PropertyUtilities.GetAttributeValue(DS_Forms.HeaderInQuestion, "Value", out bool found);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }

        }

        public static bool VerifyAutoBuildCheckBox(String CheckStatus)
        {
            try
            {
                if (CheckStatus.Equals("checked"))
                {
                    if (Control_ActionUtilities.VerifyObjectExistOnPage(DS_Forms.AutoBuildCheckBoxVerification(), "AutoBuildCheckBox", "TablePropertiesPage", "Unable to see the element"))
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else if (CheckStatus.Equals("unchecked"))
                {
                    if (!(Control_ActionUtilities.VerifyObjectExistOnPage(DS_Forms.AutoBuildCheckBoxVerification(), "AutoBuildCheckBox", "TablePropertiesPage", "Unable to see the element")))
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }

            }
            catch
            {
                return false;
            }
        }

        public static bool VerifyLinkAvailable(String Link)
        {

            if (Control_ActionUtilities.VerifyObjectExistOnPage(DS_Forms.IsLinkExists(Link), "AutoBuildCheckBox", "TablePropertiesPage", "Unable to see the element"))
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public static bool VerifyItemAvailableInDomain(String ItemName)
        {

            if (Control_ActionUtilities.VerifyObjectExistOnPage(DS_Forms.IsItemExists(ItemName), "AutoBuildCheckBox", "TablePropertiesPage", "Unable to see the element"))
            {
                return true;
            }
            else
            {
                return false;
            }

        }
    }    
}

