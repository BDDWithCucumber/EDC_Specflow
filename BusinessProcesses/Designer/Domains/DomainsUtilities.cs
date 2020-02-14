using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.Designer.Common;
using BusinessProcesses.Designer.MapLabDict;
using BusinessProcesses.Forms;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.DataLabs.Common;
using Pages.Designer;
using Pages.Designer.CodeLists;
using Pages.Designer.Data;
using Pages.Designer.Domains;
using Pages.Designer.LabMapping;
using Pages.Designer.MapLabDictionary;
using Pages.Designer.ModelDialog;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.Domains
{
    public class DomainsUtilities
    {

        public static bool ClickDoaminsButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.Domains, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.SavebuttonInAt, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool SaveButtonInLabMapiings()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.SavebuttonInLM, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool AddNewDomain(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.AddNewDomain, "Unable to click " + linkName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }        
        
        public static bool SetAttributeMappingData(String valueToSet, String attribute)
        {
            bool a = false;
            try
            {
                if(attribute == "GenderEvent")
                {
                    a = Control_ActionUtilities.Dropdown_SelectItem(DS_Domains.GenderEvent, valueToSet, String.Empty);
                }
                else if(attribute == "GenderForm")
                {
                    a = Control_ActionUtilities.Dropdown_SelectItem(DS_Domains.GenderForm, valueToSet, String.Empty);
                }
                else if (attribute == "GenderItem")
                {
                    a = Control_ActionUtilities.Dropdown_SelectItem(DS_Domains.GenderItem, valueToSet, String.Empty);
                }
                else if (attribute == "DOB")
                {
                    a = Control_ActionUtilities.Dropdown_SelectItem(DS_Domains.DOB, valueToSet, String.Empty);
                }
                else if (attribute == "DOBForm")
                {
                    a = Control_ActionUtilities.Dropdown_SelectItem(DS_Domains.DOBEForm, valueToSet, String.Empty);
                }
                else if (attribute == "DOBEvent")
                {
                    a = Control_ActionUtilities.Dropdown_SelectItem(DS_Domains.DOBEvent, valueToSet, String.Empty);
                }
                else if (attribute == "DOBItem")
                {
                    a = Control_ActionUtilities.Dropdown_SelectItem(DS_Domains.DOBItem, valueToSet, String.Empty);
                }
                else if(attribute == "Lab Id")
                {
                    IControl dropdowncontrol = DS_Domains.LabID;
                    Control_ActionUtilities.Click(dropdowncontrol, "Not able to click on dropdowncontrol");
                    a = Control_ActionUtilities.Dropdown_SelectItem(dropdowncontrol, valueToSet, String.Empty);
                }
                else if (attribute == "CRF Collection Date")
                {
                    IControl dropdowncontrol = DS_Domains.CRFCollectionDate;
                    Control_ActionUtilities.Click(dropdowncontrol, "Not able to click on dropdowncontrol");
                    a = Control_ActionUtilities.Dropdown_SelectItem(dropdowncontrol, valueToSet, String.Empty);
                }
                else if (attribute == "CRF Lab Test Name")
                {
                    a = Control_ActionUtilities.Dropdown_SelectItem(DS_Domains.CRFLabTestName, valueToSet, String.Empty);
                }
                else if (attribute == "CRF Lab Value *")
                {
                    a = Control_ActionUtilities.Dropdown_SelectItem(DS_Domains.CRFLabValue, valueToSet, String.Empty);
                }
                else if (attribute == "CRF Lab (Original) Unit *")
                {
                    a = Control_ActionUtilities.Dropdown_SelectItem(DS_Domains.CRFLabUnit, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return a;
        }
        
         public static bool SetDomainNameInLabMap(String domainName)
        {
            bool a = false;
            try
            {
                IControl dropdowncontrol = DS_Domains.DomainNameInLabMP;
                Control_ActionUtilities.Click(dropdowncontrol, "Not able to click on dropdowncontrol");
                a = Control_ActionUtilities.Dropdown_SelectItem(dropdowncontrol, domainName, String.Empty);                              

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return a;
        }

        public static bool AddNewDomainItem(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.AddNewDomainItem, "Unable to click " + linkName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool SetDomainName(String domainName)
        {
            return Control_ActionUtilities.Textbox_SetText(DS_Domains.DomainName, domainName, String.Empty);
        }

        public static bool SetDomainDesc(String domainDesc)
        {
            return Control_ActionUtilities.Textbox_SetText(DS_Domains.DomainDesc, domainDesc, String.Empty);
        }

        public static bool DomainSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.DomainSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickDomainList(String process)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, process, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(DS_Domains.DomainsTable, list);
                IControl proecssCell = WebTableUtilities.GetCell(processRow, 1);
                IControl processLink = DomainsUtilities.GetProcessLink(proecssCell, process);
                return Control_ActionUtilities.Click(processLink, "Unable to click process link " + process);
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static IControl GetProcessLink(IControl proecssCell, string processText)
        {
            try
            {
                return SyncUtilities.FindVisibleElement_Parent(proecssCell.WebElement, By.LinkText(processText));
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static bool DomainPage()
        {
            try
            {
                return Control_PropertyUtilities.IsControlVisible(DS_Domains.DomainPage);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DomainItemSourceEditSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.DomainItemSourceEditSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DomainItemCollDateEditSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.DomainItemCollDateEditSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DomainItemCRFLTNEditSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.DomainItemCRFLTNEditSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DomainItemCRFOUEditSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.DomainItemCRFOUEditSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DomainItemCRFLTDditSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Domains.DomainItemCRFLTDditSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetFormQuestionLabMappingData(List<FormQuestionsData> formquestionsdata, out List<String> formquestiondataList)
        {
            formquestiondataList = new List<String>();
            foreach (FormQuestionsData formquestionitem in formquestionsdata)
            {
                Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(formquestionitem.Qestionname), "Unable to find link " + formquestionitem.Qestionname + " in Designer Home Page");
                if ((formquestionitem.Qestionname).Equals("AutoBuildTable"))
                {
                    if(!DomainsUtilities.SetLabMappingDataForAutoTable(formquestionitem))
                    {
                        return false;
                    }  
                }
                else
                {
                    if (!DomainsUtilities.SetLabMappingData(formquestionitem))
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        public static bool SetLabMappingDataForAutoTable(FormQuestionsData formquestionitem)
        {
            try
            {
                FormQuestionsUtilities.SelectAutobuildtableDomainname(formquestionitem.Domain);
                //DomainsUtilities.SelectQuestionItemName(formquestionitem.Domain);
                Control_ActionUtilities.Textbox_SetText(DS_Forms.TableName, "AutoBuildTable", String.Empty);
                Control_ActionUtilities.Click(DS_QuestionPage.AutoBuildQuestionSave, String.Empty);
                IControl breadCrumbContainer = DL_CommonObjects.DS_BreadCrumbContainer;
                IControl breadCrumbItem = BP_BreadCrumbUtilities.GetClickableBreadCrumbItem(breadCrumbContainer, formquestionitem.FormName);
                if (!Control_PropertyUtilities.IsControlNull(breadCrumbItem))
                {
                    return Control_ActionUtilities.Click(breadCrumbItem, "Unable to click breadCrumbItem " + formquestionitem.FormName);
                }
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool SetLabMappingData(FormQuestionsData formquestionitem)
        {
            try
            {
                FormQuestionsUtilities.SelectAutobuildFormDomain(formquestionitem.Domain);
                FormQuestionsUtilities.SelectAutobuildFormItemName(formquestionitem.QuestionItemName);
                //DomainsUtilities.SelectQuestionItemName(formquestionitem.Domain);
                //DomainsUtilities.SelectQuestionItemName(formquestionitem.QuestionItemName);
                Control_ActionUtilities.Click(DS_QuestionPage.QuestionSave, String.Empty);
                IControl breadCrumbContainer = DL_CommonObjects.DS_BreadCrumbContainer;
                IControl breadCrumbItem = BP_BreadCrumbUtilities.GetClickableBreadCrumbItem(breadCrumbContainer, formquestionitem.FormName);
                if (!Control_PropertyUtilities.IsControlNull(breadCrumbItem))
                {
                    return Control_ActionUtilities.Click(breadCrumbItem, "Unable to click breadCrumbItem " + formquestionitem.FormName);
                }
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool SetFormQuestionData(List<FormQuestionsData> formquestionsdata, out List<String> formquestiondataList)
        {
            formquestiondataList = new List<String>();
            foreach (FormQuestionsData formquestionitem in formquestionsdata)
            {
                Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(formquestionitem.Qestionname), "Unable to find link " + formquestionitem.Qestionname + " in Designer Home Page");
                if (!DomainsUtilities.SetQuestionData(formquestionitem))
                {
                    return false;
                }
            }
            return true;
        }

        public static bool SetQuestionData(FormQuestionsData formquestionitem)
        {
            FormQuestionsUtilities.SelectAutobuildtableDomainname(formquestionitem.Domain);
            FormQuestionsUtilities.SelectAutobuildFormItemName(formquestionitem.QuestionItemName);
            SelectQuestionDisplayOption(formquestionitem.QuestionDisplayOption);
            SelectQuestionItemName(formquestionitem.QuestionItemName);
            SelectConditionalItemName(formquestionitem.ConditionalItemName);
            SelectConditionalComparator(formquestionitem.ConditionalComparator);
            Control_ActionUtilities.Textbox_SetText(CodeListsPage.ConditionalValue, formquestionitem.ConditionalValue, String.Empty);
            SelectDataGroup(formquestionitem.DataGroup);
            SelectCodelistGroup(formquestionitem.CodelistGroup);
            SelectCodelistLinkage(formquestionitem.CodelistLiknage);
            SelectCodelistLinkageItem(formquestionitem.LinkageItem);
            Control_ActionUtilities.Textbox_SetText(DS_Forms.HeaderName, formquestionitem.HeaderName, String.Empty);
            SelectKeySequence(formquestionitem.Keysequence);
            Control_ActionUtilities.Click(DS_QuestionPage.QuestionSave, String.Empty);
            IControl breadCrumbContainer = DL_CommonObjects.DS_BreadCrumbContainer;
            IControl breadCrumbItem = BP_BreadCrumbUtilities.GetClickableBreadCrumbItem(breadCrumbContainer, formquestionitem.FormName);
            if (!Control_PropertyUtilities.IsControlNull(breadCrumbItem))
            {
                return Control_ActionUtilities.Click(breadCrumbItem, "Unable to click breadCrumbItem " + formquestionitem.FormName);
            }
            return true;
        }

       public static bool SelectQuestionDisplayOption(String itemName)
        {
            try
            {
                if (!String.IsNullOrEmpty(itemName))
                {
                    return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.CheckBoxSelectionDropDown, itemName, "Unable to select " + itemName);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return false;
        }

        public static bool SelectQuestionItemName(String itemName)
        {
            try
            {
                if (!String.IsNullOrEmpty(itemName))
                {
                    return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.ItemNameSelectionDropDown, itemName, "Unable to select " + itemName);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return false;
        }

        public static bool SelectConditionalItemName(String itemName)
        {
            try
            {
                if (!String.IsNullOrEmpty(itemName))
                {
                    return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.ItemNameSelectionDropDown, itemName, "Unable to select " + itemName);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return false;
        }

        public static bool SelectConditionalComparator(String itemName)
        {
            try
            {
                if (!String.IsNullOrEmpty(itemName))
                {
                    return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.ComparatorSelectionDropDown, itemName, "Unable to select " + itemName);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return false;
        }

        public static bool SelectDataGroup(String itemName)
        {
            try
            {
                if (!String.IsNullOrEmpty(itemName))
                {
                    return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.DataGroupSelectionDropDown, itemName, "Unable to select " + itemName);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return false;
        }

        public static bool SelectCodelistGroup(String itemName)
        {
            try
            {
                if (!String.IsNullOrEmpty(itemName))
                {
                    if (Control_ActionUtilities.Click(DS_QuestionPage.CodelistGroupDropdownInvokerButton, "Unable to click the link"))
                    {
                        return Control_ActionUtilities.Click(DS_QuestionPage.GetCodelistGroupItem(itemName), "Unable to click the link");
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return false;
        }

        public static bool SelectCodelistLinkage(String itemName)
        {
            try
            {
                if (!String.IsNullOrEmpty(itemName))
                {
                    if (Control_ActionUtilities.Click(DS_QuestionPage.CodelistLinkageDropdownInvokerButton, "Unable to click the link"))
                    {
                        return Control_ActionUtilities.Click(DS_QuestionPage.GetCodelistLinkageItem(itemName), "Unable to click the link");
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return false;
        }

        public static bool SelectCodelistLinkageItem(String itemName)
        {
            try
            {
                if (!String.IsNullOrEmpty(itemName))
                {
                    if (Control_ActionUtilities.Click(DS_QuestionPage.CodelistLinkage_ItemNameDropdownInvokerButton, "Unable to click the link"))
                    {
                        return Control_ActionUtilities.Click(DS_QuestionPage.GetCodelistLinkageItem_Item(itemName), "Unable to click the link");
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return false;
        }

        public static bool SelectKeySequence(String itemName)
        {
            try
            {
                if (!String.IsNullOrEmpty(itemName))
                {
                    return Control_ActionUtilities.Dropdown_SelectItem(DS_Forms.KeySequenceSelectionDropDown, itemName, "Unable to select " + itemName);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return false;
        }

        public static bool SelectCodeListsItemsToDelete(List<CodelistItemsData> codelists, out List<String> codelistsItemDetailsList)
        {
            codelistsItemDetailsList = new List<String>();
            foreach (CodelistItemsData codelistsitems in codelists)
            {
                Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(codelistsitems.CodelistName), "Unable to find link " + codelistsitems.CodelistName + " in Designer Home Page");
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(2, codelistsitems.CodeItemDesc, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(CodeListsPage.CodeListItemsTable, list);
                IControl proecssCell = WebTableUtilities.GetCell(processRow, 0);
                Control_ActionUtilities.Click(proecssCell, "Unable to click find" + codelistsitems.CodelistName);
                Control_ActionUtilities.Click(CodeListsPage.ClickDeleteItems, "Unable to click delete items link");
                Control_ActionUtilities.Click(DS_Labs_StudySaveConfirmationDialog.ContinueButton, "Unable to click continue button");
                String notificationMessage = " has been successfully deleted";
                if (!DS_BP_NotificationUtilities.VerifyNotification(notificationMessage))
                {
                    return false;
                }
                Control_ActionUtilities.Click(CodeListsPage.BreadcrumbCodeLists, "Unable to click delete items link");
            }
            return true;
        }

        public static bool SetupLabTests(List<MapLabDictionaryData> testsdata, out List<String> codelistsItemsDetailsList)
        {
            codelistsItemsDetailsList = new List<String>();
            if (Control_PropertyUtilities.IsEnabled(MapLabDictionary.LabTestSelected))
            {
                foreach (MapLabDictionaryData test in testsdata)
                {
                    if (!DomainsUtilities.SetLabTests(test))
                    {
                        return false;
                    }
                }
            }
            else
            {
                Control_ActionUtilities.Click(MapLabDictionary.LabTest, String.Empty);
                foreach (MapLabDictionaryData test in testsdata)
                {
                    if (!DomainsUtilities.SetLabTests(test))
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        public static bool SetupLabUnits(List<MapLabDictionaryData> unitsdata, out List<String> codelistsItemsDetailsList)
        {
            codelistsItemsDetailsList = new List<String>();
            if (Control_PropertyUtilities.IsEnabled(MapLabDictionary.LabUnitSelected))
            {
                foreach (MapLabDictionaryData unit in unitsdata)
                {
                    if (!DomainsUtilities.SetLabUnits(unit))
                    {
                        return false;
                    }
                }
            }
            else
            {
                Control_ActionUtilities.Click(MapLabDictionary.LabUnit, String.Empty);
                foreach (MapLabDictionaryData unit in unitsdata)
                {
                    if (!DomainsUtilities.SetLabUnits(unit))
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        public static bool LabTestsUnitsDetails(List<MapLabDictionaryData> testunititemsdata, out List<String> codelistsItemsDetailsList)
        {
            codelistsItemsDetailsList = new List<String>();
            foreach (MapLabDictionaryData testunititems in testunititemsdata)
            {
                if (Control_PropertyUtilities.IsEnabled(MapLabDictionary.LabTestSelected) && Control_PropertyUtilities.IsControlVisible(DS_HomePage.GetLink(testunititems.LinkName)))
                {
                    if(!DomainsUtilities.SetUpdatedLabTestData(testunititems))
                    {
                        return false;
                    }
                }
                else if (Control_PropertyUtilities.IsEnabled(MapLabDictionary.LabUnitSelected) && Control_PropertyUtilities.IsControlVisible(DS_HomePage.GetLink(testunititems.LinkName)))
                {
                    if (!DomainsUtilities.SetUpdatedLabUnitData(testunititems))
                    {
                        return false;
                    }
                }
                else if (Control_PropertyUtilities.IsEnabled(MapLabDictionary.LabTestSelected) && Control_PropertyUtilities.IsControlNull(DS_HomePage.GetLink(testunititems.LinkName)))
                {
                    if (!DomainsUtilities.SetLabTestData(testunititems))
                    {
                        return false;
                    }
                }
                else if (Control_PropertyUtilities.IsEnabled(MapLabDictionary.LabUnitSelected) && Control_PropertyUtilities.IsControlNull(DS_HomePage.GetLink(testunititems.LinkName)))
                {
                    if (!DomainsUtilities.SetLabUnitData(testunititems))
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        public static bool SetUpdatedLabTestData(MapLabDictionaryData testunititems)
        {
            try
            {
                Control_ActionUtilities.CheckCheckbox(MapLabDictionary.CheckAllLabTest);
                Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(testunititems.LinkName), "Unable to find link " + testunititems.LinkName + " in Designer Home Page");
                Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabTestCodeValueDropDown, testunititems.LabTestName1, "Unable to select " + testunititems.LabTestName1);
                Control_ActionUtilities.Click(MapLabDictionary.MapLabDictUpdateSave, String.Empty);
                Control_ActionUtilities.Click_PerssEnterKey(MapLabDictionary.LabUnitLink(testunititems.LabUnitsTabName), "Unable to find click " + testunititems.LabUnitsTabName + " in Designer Home Page");
                Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabUnitCodeValueDropDown, testunititems.LabUnitName1, "Unable to select " + testunititems.LabUnitName1);
                Control_ActionUtilities.Click(MapLabDictionary.MapLabDictSave, String.Empty);
                return true;
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool SetUpdatedLabUnitData(MapLabDictionaryData testunititems)
        {
            try
            {
                Control_ActionUtilities.CheckCheckbox(MapLabDictionary.CheckAllLabUnit);
                Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(testunititems.LinkName), "Unable to find link " + testunititems.LinkName + " in Designer Home Page");
                Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabTestCodeValueDropDown, testunititems.LabUnitName1, "Unable to select " + testunititems.LabUnitName1);
                Control_ActionUtilities.Click(MapLabDictionary.MapLabDictUpdateUnitSave, String.Empty);
                Control_ActionUtilities.Click_PerssEnterKey(MapLabDictionary.LabTestLink(testunititems.LabTestsTabName), "Unable to find click " + testunititems.LabTestsTabName + " in Designer Home Page");
                Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabTestCodeValueDropDown, testunititems.LabTestName1, "Unable to select " + testunititems.LabTestName1);
                Control_ActionUtilities.Click(MapLabDictionary.MapLabDictSave, String.Empty);
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool SetLabTestData(MapLabDictionaryData testunititems)
        {
            Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabTestCodeValueDropDown, testunititems.LabTestName1, "Unable to select " + testunititems.LabTestName1);
            Control_ActionUtilities.Click_PerssEnterKey(MapLabDictionary.LabUnitLink(testunititems.LabUnitsTabName), "Unable to find click " + testunititems.LabUnitsTabName + " in Designer Home Page");
            Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabUnitCodeValueDropDown, testunititems.LabUnitName1, "Unable to select " + testunititems.LabUnitName1);
            Control_ActionUtilities.Click(MapLabDictionary.MapLabDictSave, String.Empty);
            return true;
        }

        public static bool SetLabUnitData(MapLabDictionaryData testunititems)
        {
            Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabUnitCodeValueDropDown, testunititems.LabUnitName1, "Unable to select " + testunititems.LabUnitName1);
            Control_ActionUtilities.Click_PerssEnterKey(MapLabDictionary.LabTestLink(testunititems.LabTestsTabName), "Unable to find click " + testunititems.LabTestsTabName + " in Designer Home Page");
            Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabTestCodeValueDropDown, testunititems.LabTestName1, "Unable to select " + testunititems.LabTestName1);
            Control_ActionUtilities.Click(MapLabDictionary.MapLabDictSave, String.Empty);
            return true;
        }

        public static bool SetLabTests(MapLabDictionaryData test)
        {
            //WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
            //list.AddSearchItem(new WebTable_SearchCriteriaItem(2, codelistsitems.CodeItemDesc, TableColumnContentType.Text));
            //IControl processRow = WebTableUtilities.Table_FindRow(CodeListsPage.CodeListItemsTable, list);
            //IControl proecssCell = WebTableUtilities.GetCell(processRow, 0);
            //Control_ActionUtilities.Click(proecssCell, "Unable to click find" + codelistsitems.CodelistName);
            Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabTestCodeValueDropDown, test.LabTestName, "Unable to select " + test.LabTestName);
            Control_ActionUtilities.CheckCheckbox(MapLabDictionary.DisplayInRRFirstTestCheckBox);
            return true;
        }

        public static bool SetLabUnits(MapLabDictionaryData unit)
        {
            Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabUnitCodeValueDropDown, unit.LabUnitName, "Unable to select " + unit.LabUnitName);
            return true;
        }

        public static bool UpdateAttributeMapping(List<AttributeMappingData> attributeDataList, out List<String> attributemappingData)
        {
            attributemappingData = new List<String>();
            if (Control_PropertyUtilities.IsControlVisible(LabMappingsPage.EditSelectedLink))
            {
                Control_ActionUtilities.Click_PerssEnterKey(DS_Domains.AttributeMappingTableSelectAllCheckbox, String.Empty);
                Control_ActionUtilities.Click(LabMappingsPage.EditSelectedLink, "Unable to find link Edit Selected link in Attribute mapping Page");
            }
            foreach (AttributeMappingData attributeDataListitem in attributeDataList)
            {
                if (!DomainsUtilities.MapCodelistItemsInAttributeMapping(attributeDataListitem))
                {
                    return false;
                }
            }
            return true;
        }

        public static bool AttributeMappingItemDetails(List<AttributeMappingData> attributeDataList, out List<String> attributemappingData)
        {
            attributemappingData = new List<String>();
            if (Control_PropertyUtilities.IsControlVisible(LabMappingsPage.EditSelectedLink))
            {
                Control_ActionUtilities.Click_PerssEnterKey(DS_Domains.AttributeMappingTableSelectAllCheckbox, String.Empty);
                Control_ActionUtilities.Click(LabMappingsPage.EditSelectedLink, "Unable to find link Edit Selected link in Attribute mapping Page");
                foreach (AttributeMappingData attributeDataListitem in attributeDataList)
                {
                    if (!DomainsUtilities.UpdateAttributeMappingData(attributeDataListitem))
                    {
                        return false;
                    }
                }
            }
            else
            {
                foreach (AttributeMappingData attributeDataListitem in attributeDataList)
                {
                    if (!DomainsUtilities.SetAttributeMappingData(attributeDataListitem))
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        public static bool MapCodelistItemsInAttributeMapping(AttributeMappingData attributeDataListitem)
        {
            DomainsUtilities.ClickUpdateCodelistMappingButton(LabMappingsPage.AttributeMappingTable);
            SetMale_Dropdown(LabMappingsPage.AttributeMapping_CodelistMappingTable, "Item:", attributeDataListitem.Male);
            SetFemale_Dropdown(LabMappingsPage.AttributeMapping_CodelistMappingTable, "Item:", attributeDataListitem.Female);
            SetNotSpecified_Dropdown(LabMappingsPage.AttributeMapping_CodelistMappingTable, "Item:", attributeDataListitem.NotSpecified);
            Control_ActionUtilities.Click(LabMappingsPage.AttributeMapping_CodelistMappingTableOkButton, String.Empty);
            return true;
        }

        public static bool UpdateAttributeMappingData(AttributeMappingData attributeDataListitem)
        {
            if ((attributeDataListitem.DOBAge).Equals("Date of Birth (Day, Month, Year)"))
            {
                UpdateGenderEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.GenderEvent);
                UpdateGenderForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.GenderForm);
                UpdateGenderItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.GenderItem);
                DomainsUtilities.ClickUpdateCodelistMappingButton(LabMappingsPage.AttributeMappingTable);
                UpdateDOBAge_Dropdown(LabMappingsPage.AttributeMappingTable, "Select:", attributeDataListitem.DOBAge);
                UpdateDOBEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent);
                UpdateDOBForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm);
                UpdateDOBItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem);
                UpdateDOBEvent1_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent1);
                UpdateDOBForm1_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm1);
                UpdateDOBItem1_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem1);
                UpdateDOBEvent2_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent2);
                UpdateDOBForm2_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm2);
                UpdateDOBItem2_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem2);
                SetMale_Dropdown(LabMappingsPage.AttributeMapping_CodelistMappingTable, "Item:", attributeDataListitem.Male);
                SetFemale_Dropdown(LabMappingsPage.AttributeMapping_CodelistMappingTable, "Item:", attributeDataListitem.Female);
                SetNotSpecified_Dropdown(LabMappingsPage.AttributeMapping_CodelistMappingTable, "Item:", attributeDataListitem.NotSpecified);
                Control_ActionUtilities.Click(LabMappingsPage.AttributeMapping_CodelistMappingTableOkButton, String.Empty);
            }
            else if ((attributeDataListitem.DOBAge).Equals("Date of Birth (Whole Date)"))
            {
                UpdateGenderEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.GenderEvent);
                UpdateGenderForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.GenderForm);
                UpdateGenderItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.GenderItem);
                DomainsUtilities.ClickUpdateCodelistMappingButton(LabMappingsPage.AttributeMappingTable);
                UpdateDOBAge_Dropdown(LabMappingsPage.AttributeMappingTable, "Select:", attributeDataListitem.DOBAge);
                UpdateDOBEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent);
                UpdateDOBForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm);
                UpdateDOBItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem);
            }
            else if ((attributeDataListitem.DOBAge).Equals("Age"))
            {
                UpdateGenderEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.GenderEvent);
                UpdateGenderForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.GenderForm);
                UpdateGenderItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.GenderItem);
                DomainsUtilities.ClickUpdateCodelistMappingButton(LabMappingsPage.AttributeMappingTable);
                UpdateDOBAge_Dropdown(LabMappingsPage.AttributeMappingTable, "Select:", attributeDataListitem.DOBAge);
                UpdateDOBEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent);
                UpdateDOBForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm);
                UpdateDOBItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem);
                UpdateDOBEvent1_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent1);
                UpdateDOBForm1_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm1);
                UpdateDOBItem1_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem1);
            }
            else if(!String.IsNullOrEmpty(attributeDataListitem.DOBAge))
            {
                UpdateGenderEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.GenderEvent);
                UpdateGenderForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.GenderForm);
                UpdateGenderItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.GenderItem);
                DomainsUtilities.ClickUpdateCodelistMappingButton(LabMappingsPage.AttributeMappingTable);
            }
            Control_ActionUtilities.Click(CodeListsPage.CodeListItemSave, String.Empty);
            return true;
        }

        static bool ClickUpdateCodelistMappingButton(IControl AttributeMappingTable)
        {
            try
            {
                IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 0);
                IControl cell = WebTableUtilities.GetCell(row, 2);
                IControl buttonclick = LabMappingsPage.GetCodelistMappingButton(cell);
                return Control_ActionUtilities.Click(buttonclick, String.Empty);
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateGenderEvent_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 0);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetEventDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateGenderForm_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 0);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetFormDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateGenderItem_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 0);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetItemDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateDOBAge_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 1);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetDOBAgeDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateDOBEvent_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 2);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetEventDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateDOBForm_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 2);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetFormDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateDOBItem_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 2);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetItemDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateDOBEvent1_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 3);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetEventDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateDOBForm1_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 3);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetFormDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateDOBItem1_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 3);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetItemDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateDOBEvent2_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 4);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetEventDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateDOBForm2_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 4);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetFormDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool UpdateDOBItem2_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 4);
                    IControl cell = WebTableUtilities.GetCell(row, 2);
                    IControl dropdown = LabMappingsPage.GetItemDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool SetAttributeMappingData(AttributeMappingData attributeDataListitem)
        {
            SetGenderEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.GenderEvent);
            SetGenderForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.GenderForm);
            SetGenderItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.GenderItem);
            DomainsUtilities.ClickCodelistMappingButton(LabMappingsPage.AttributeMappingTable);
            if ((attributeDataListitem.DOBAge).Equals("Date of Birth (Day, Month, Year)"))
            {
                SetDOBAge_Dropdown(LabMappingsPage.AttributeMappingTable, "Select:", attributeDataListitem.DOBAge);
                SetDOBEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent);
                SetDOBForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm);
                SetDOBItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem);
                SetDOBEvent1_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent1);
                SetDOBForm1_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm1);
                SetDOBItem1_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem1);
                SetDOBEvent2_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent2);
                SetDOBForm2_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm2);
                SetDOBItem2_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem2);
                SetMale_Dropdown(LabMappingsPage.AttributeMapping_CodelistMappingTable, "Item:", attributeDataListitem.Male);
                SetFemale_Dropdown(LabMappingsPage.AttributeMapping_CodelistMappingTable, "Item:", attributeDataListitem.Female);
                SetNotSpecified_Dropdown(LabMappingsPage.AttributeMapping_CodelistMappingTable, "Item:", attributeDataListitem.NotSpecified);
                Control_ActionUtilities.Click(LabMappingsPage.AttributeMapping_CodelistMappingTableOkButton, String.Empty);
            }
            else if((attributeDataListitem.DOBAge).Equals("Date of Birth (Whole Date)"))
            {
                SetDOBAge_Dropdown(LabMappingsPage.AttributeMappingTable, "Select:", attributeDataListitem.DOBAge);
                SetDOBEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent);
                SetDOBForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm);
                SetDOBItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem);
            }
            else if((attributeDataListitem.DOBAge).Equals("Age"))
            {
                SetDOBAge_Dropdown(LabMappingsPage.AttributeMappingTable, "Select:", attributeDataListitem.DOBAge);
                SetDOBEvent_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent);
                SetDOBForm_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm);
                SetDOBItem_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem);
                SetDOBEvent1_Dropdown(LabMappingsPage.AttributeMappingTable, "Event:", attributeDataListitem.DOBEvent1);
                SetDOBForm1_Dropdown(LabMappingsPage.AttributeMappingTable, "Form:", attributeDataListitem.DOBForm1);
                SetDOBItem1_Dropdown(LabMappingsPage.AttributeMappingTable, "Item:", attributeDataListitem.DOBItem1);
            }
            Control_ActionUtilities.Click(CodeListsPage.CodeListItemSave, String.Empty);
            return true;
        }

        static bool ClickCodelistMappingButton(IControl AttributeMappingTable)
        {
            try
            {
                IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 0);
                IControl cell = WebTableUtilities.GetCell(row, 2);
                IControl buttonclick = LabMappingsPage.GetCodelistMappingButton(cell);
                return Control_ActionUtilities.Click(buttonclick, String.Empty);
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetGenderEvent_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 0);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetEventDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetGenderForm_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 0);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetFormDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetGenderItem_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 0);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetItemDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetDOBAge_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 1);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetDOBAgeDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetDOBEvent_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 2);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetEventDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetDOBForm_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 2);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetFormDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetDOBItem_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 2);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetItemDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetDOBEvent1_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 3);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetEventDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetDOBForm1_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 3);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetFormDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetDOBItem1_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 3);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetItemDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetDOBEvent2_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 4);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetEventDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetDOBForm2_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 4);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetFormDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetDOBItem2_Dropdown(IControl AttributeMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMappingTable, 4);
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl dropdown = LabMappingsPage.GetItemDropdown(cell);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetMale_Dropdown(IControl AttributeMapping_ColdelistMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMapping_ColdelistMappingTable, 0);
                    IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Dropdown);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetFemale_Dropdown(IControl AttributeMapping_ColdelistMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMapping_ColdelistMappingTable, 1);
                    IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Dropdown);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetNotSpecified_Dropdown(IControl AttributeMapping_ColdelistMappingTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(AttributeMapping_ColdelistMappingTable, 2);
                    IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Dropdown);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool LabMappingItemDetails(String domainName, List<Lab_DomainItemMappingData> codelistitemsdata, out List<String> labtestsunitsItemsDetailsList)
        {
            labtestsunitsItemsDetailsList = new List<String>();
            if(Control_PropertyUtilities.IsControlVisible(DS_HomePage.GetLink("Edit Selected")))
            {
                Control_ActionUtilities.CheckCheckbox(DS_Domains.LabMappingTableSelectAllCheckbox);
                Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink("Edit Selected"), "Unable to find link Edit Selected link in Attribute mapping Page");
            }
            else
            {
                Control_ActionUtilities.Click(LabMappingsPage.AddNewDomain, "Unable to click to add new domain");
                Control_ActionUtilities.Dropdown_SelectItem(LabMappingsPage.SelectionLabMappingDomainDropDown, domainName, "Unable to select " + domainName);
            }
            foreach (Lab_DomainItemMappingData codelistitem in codelistitemsdata)
            {
                if (!DomainsUtilities.SetLabDomainItemMappingData(codelistitem))
                {
                    return false;
                }

            }
            Control_ActionUtilities.Click(CodeListsPage.CodeListItemSave, String.Empty);
            return true;
        }

        public static bool SetLabDomainItemMappingData(Lab_DomainItemMappingData codelistitem)
        {

            SetLabMappingDomain_Dropdown(codelistitem, DS_Domains.LabMappingTable, codelistitem.MappingElement, codelistitem.DomainItem);
            return true;
        }

        static bool SetLabMappingDomain_Dropdown(Lab_DomainItemMappingData codelistitem, IControl labMappingTable, String mappingElement, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(labMappingTable, codelistitem.RowNo);
                    IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 2, TableColumnContentType.Dropdown);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool CodeListsItemDetails(List<CodelistItemsData> codelistitemsdata, out List<String> labtestsunitsItemsDetailsList)
        {
            labtestsunitsItemsDetailsList = new List<String>();
            foreach (CodelistItemsData codelistitem in codelistitemsdata)
            {
                //Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(codelistitem.CodelistName), "Unable to find link " + codelistitem.CodelistName + " in Designer Home Page");
                Control_ActionUtilities.Click(CodeListsPage.AddCodeListItem, "Unable to click ");
                if (!DomainsUtilities.SetCodelistData(codelistitem))
                {
                    return false;
                }
            }
            return true;
        }

        public static bool SetCodelistData(CodelistItemsData codelistitem)
        {

            Control_ActionUtilities.Textbox_SetText(CodeListsPage.SetCodePrefix, codelistitem.CodePrefix, String.Empty);
            Control_ActionUtilities.Textbox_SetText(CodeListsPage.CodeListItemDesc, codelistitem.CodeItemDesc, String.Empty);
            Control_ActionUtilities.Textbox_SetText(CodeListsPage.CodeListItemValue, codelistitem.CodeItemValue, String.Empty);
            Control_ActionUtilities.Click(CodeListsPage.CodeListItemSave, String.Empty);
            String notificationMessage = codelistitem.CodeItemDesc + " has been successfully added";
            if (!DS_BP_NotificationUtilities.VerifyNotification(notificationMessage))
            {
                return false;
            }
            IControl breadCrumbContainer = DL_CommonObjects.DS_BreadCrumbContainer;
            IControl breadCrumbItem = BP_BreadCrumbUtilities.GetClickableBreadCrumbItem(breadCrumbContainer, codelistitem.CodelistName);
            if (!Control_PropertyUtilities.IsControlNull(breadCrumbItem))
            {
                return Control_ActionUtilities.Click(breadCrumbItem, "Unable to click breadCrumbItem " + codelistitem.CodelistName);
            }
            return true;
        }

        public static bool AddNewDomainItemDetails(IEnumerable<DomainItemsData> domainitemsdata, out List<String> domainItemsDetailsList)
        {
            domainItemsDetailsList = new List<String>();
            foreach (DomainItemsData domainitem in domainitemsdata)
            {
                Control_ActionUtilities.Click(DS_Domains.AddNewDomainItem, "Unable to click ");
                if (!DomainsUtilities.EnterStudyData(domainitem))
                {
                    return false;
                }
            }
            return true;
        }       
        public static bool SearchDomainItemDetails(List<DomainItemsData> domainItems)
        {
            try
            {
                //domainItemsDetailsList = new List<String>();
                foreach (DomainItemsData domainItem in domainItems)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(1, domainItem.ItemName, TableColumnContentType.Text));
                    IControl tableRow = WebTableUtilities.Table_FindRow(DS_Domains.DomainItemsTable, list);
                    if (Control_PropertyUtilities.IsControlNull(tableRow))
                    {
                         return false;                        
                    }
                }
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool EnterStudyData(DomainItemsData domainitem)
        {
            DomainsUtilities.SetStudyData(domainitem);
            //Control_ActionUtilities.Click_PerssEnterKey(DL_AddSitePage.SaveButton, String.Empty);
            //return IsSiteSaved();
            return true;
        }

        public static bool SetStudyData(DomainItemsData domainitem)
        {
            SetItemNamedData_Text(DS_Domains.StudyTable, "Item Name:", domainitem.ItemName);
            SetSourceFieldData_Dropdown(DS_Domains.StudyTable, "Source:", domainitem.Source);
            SetDatatypeFieldData_Dropdown(DS_Domains.StudyTable, "Datatype:", domainitem.Datatype);
            Thread.Sleep(3000);
            SetCodeListFieldData_Dropdown(DS_Domains.StudyTable, "CodeList:", domainitem.Codelist);
            SetMaxLenFieldData_Text(DS_Domains.StudyTable, "Max Len:", domainitem.maxlen);
            Control_ActionUtilities.Click(DS_Domains.DomainItemSave, String.Empty);
            String notificationMessage = domainitem.ItemName + " has been successfully added";
            if (!DS_BP_NotificationUtilities.VerifyNotification(notificationMessage))
            {
                return false;
            }
            return true;
        }

       public static bool UpdateDomainItemDetails(IEnumerable<DomainItemsData> domainitemsdata, out List<String> domainItemsDetailsList)
        {            
            domainItemsDetailsList = new List<String>();
            foreach (DomainItemsData domainitem in domainitemsdata)
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, domainitem.ItemName, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(DS_Forms.DomainItemsListTable, list);
                IControl proecssCell = WebTableUtilities.GetCell(processRow, 14);
                IControl cellImage = WebTableUtilities.GetInputControl(proecssCell);
                Control_ActionUtilities.Click(cellImage, "Unable to click Image");
                //Control_ActionUtilities.Click(DS_Domains.AddNewDomainItem, "Unable to click ");
                if (!DomainsUtilities.EnterDomainData(domainitem))
                {
                    return false;
                }
            }
            return true;
        }

        public static bool EnterDomainData(DomainItemsData domainitem)
        {
            DomainsUtilities.SetDomainData(domainitem);
            //Control_ActionUtilities.Click_PerssEnterKey(DL_AddSitePage.SaveButton, String.Empty);
            //return IsSiteSaved();
            return true;
        }

        public static bool SetDomainData(DomainItemsData domainitem)
        {
            SetSourceFieldData_Dropdown(DS_Domains.StudyTable, "Source:", domainitem.Source);
            SetDatatypeFieldData_Dropdown(DS_Domains.StudyTable, "Datatype:", domainitem.Datatype);
            SetCodeListFieldData_Dropdown(DS_Domains.StudyTable, "CodeList:", domainitem.Codelist);
            SetMaxLenFieldData_Text(DS_Domains.StudyTable, "Max Len:", domainitem.maxlen);
            IControl row = WebTableUtilities.GetRow(DS_Domains.StudyTable, 2);
            IControl processCell = WebTableUtilities.GetCell(row, 8);
            IControl saveImage = DS_Domains.GetImageControl(processCell, "Save");
            Control_ActionUtilities.Click(saveImage, "Unable to click Image");
            String notificationMessage = domainitem.ItemName + " has been successfully updated";
            if (!DS_BP_NotificationUtilities.VerifyNotification(notificationMessage))
            {
                return false;
            }
            return true;
        }

        static bool SetItemNamedData_Text(IControl StudyTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(StudyTable, 0);
                    IControl textbox = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Textbox);
                    return Control_ActionUtilities.Textbox_SetText(textbox, valueToSet, String.Empty);
                }
            }
            catch(Exception e)
            {

            }
            return false;
        }

        static bool SetMaxLenFieldData_Text(IControl StudyTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(StudyTable, 1);
                    IControl textbox = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Textbox);
                    return Control_ActionUtilities.Textbox_SetText(textbox, valueToSet, String.Empty);
                }
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        static bool SetSourceFieldData_Dropdown(IControl StudyTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(StudyTable, 0);
                    IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 3, TableColumnContentType.Dropdown);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch(Exception e)
            {

            }
            return false;
        }

        static bool SetDatatypeFieldData_Dropdown(IControl StudyTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    IControl row = WebTableUtilities.GetRow(StudyTable, 0);
                    IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 5, TableColumnContentType.Dropdown);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch(Exception e)
            {

            }
            return false;
        }

        static bool SetCodeListFieldData_Dropdown(IControl StudyTable, String searchText, String valueToSet)
        {
            try
            {
                if (!String.IsNullOrEmpty(valueToSet))
                {
                    Thread.Sleep(2000);
                    IControl row = WebTableUtilities.GetRow(StudyTable, 0);
                    IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 7, TableColumnContentType.Dropdown);
                    return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
                }
            }
            catch(Exception e)
            {

            }
            return false;
        }

        static WebTable_SearchCriteriaItemList GetSearchItemList(String cellText)
        {
            WebTable_SearchCriteriaItem item = new WebTable_SearchCriteriaItem(0, cellText, TableColumnContentType.Text);
            WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
            list.AddSearchItem(item);
            return list;
        }
        
    }
}
