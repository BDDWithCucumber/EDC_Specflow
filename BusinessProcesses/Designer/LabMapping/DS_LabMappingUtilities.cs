using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.Designer;
using Pages.Designer.Data;
using Pages.Designer.LabMapping;
using Pages.Designer.StudyProperties;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.Designer.LabMapping
{
    public class DS_LabMappingUtilities
    {
        public static bool ClickLabMappingTab()
        {
            try
            {
                return Control_ActionUtilities.Click(LabMappingsPage.LabMappingLink, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool MapDomainItems(IEnumerable<LadMappingData> domaindata, out List<String> failSiteList)
        {
            failSiteList = new List<String>();
            foreach (LadMappingData domainitem in domaindata)
            {
                if ((DS_LabMappingUtilities.EnterStudyData(domainitem)))
                {
                    Control_ActionUtilities.Click_PerssEnterKey(LabMappingsPage.LabMappingSave, String.Empty);
                }
            }
            return true;
        }

        public static bool EnterStudyData(LadMappingData domainitem)
        {
            DS_LabMappingUtilities.SetStudyData(LabMappingsPage.LabMappingTable, domainitem);
            return true;
        }

        public static void SetStudyData(IControl LabMappingTable, LadMappingData domainitem)
        {
            SetStudyFieldData_Dropdown(LabMappingTable, "Lab ID", domainitem.LabID);
            SetStudyFieldData_Dropdown(LabMappingTable, "CRF Collection Date", domainitem.CRFCollectionDate);
            SetStudyFieldData_Dropdown(LabMappingTable, "CRF Lab Test Name", domainitem.CRFLTN);
            SetStudyFieldData_Dropdown(LabMappingTable, "CRF Lab Value", domainitem.CRFLV);
            SetStudyFieldData_Dropdown(LabMappingTable, "CRF Lab (Original) Unit", domainitem.CRFOU);
        }

        static bool SetStudyFieldData_Dropdown(IControl LabMappingTable, String searchText, String valueToSet)
        {
            if (valueToSet != null)
            {
                IControl row = WebTableUtilities.Table_FindRow(LabMappingTable, GetSearchItemList(searchText));
                IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Dropdown);
                return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
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

        public static bool SelectLabMappingDomain(String itemName)
        {
            try
            {
              return Control_ActionUtilities.Dropdown_SelectItem(LabMappingsPage.SelectionLabMappingDomainDropDown, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool NewDomain()
        {
            try
            {
              return Control_ActionUtilities.Click(LabMappingsPage.AddNewDomain, "Unable to click to add new domain");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool LamMappingSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(LabMappingsPage.LabMappingSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyRaceField(IEnumerable<AttributeMappingData> attributemapping)
        {

            foreach (AttributeMappingData item in attributemapping)
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, item.FieldName, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(DS_Labs.AttributeMappingTable, list);
                //IControl proecssCell = WebTableUtilities.GetCell(processRow, 2);
                if (Control_PropertyUtilities.IsControlNull(processRow))
                {
                    return true;
                }
            }
            return false;
        }

        public static bool VerifySASField(List<AttributeMappingData> attributemapping)
        {

            foreach (AttributeMappingData item in attributemapping)
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(0, item.FieldName, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(DS_Labs.LabMappingTable, list);
                //IControl proecssCell = WebTableUtilities.GetCell(processRow, 2);
                if (Control_PropertyUtilities.IsControlNull(processRow))
                {
                    return true;
                }
            }
            return false;
        }

        public static bool SelectLabIDItem(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(LabMappingsPage.SelectLabID, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectLabIDItemForDomain(String itemName, String Domain)
        {
            try
            {
              return Control_ActionUtilities.Dropdown_SelectItem(LabMappingsPage.SelectLabIdForDomain(Domain), itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }


        public static bool SelectcrfCollectionDateItem(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(LabMappingsPage.SelectCRFCollectionDate, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectcrfLabTestNameItem(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(LabMappingsPage.SelectlabTestName, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectcrfLabValueItem(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(LabMappingsPage.SelectLabTestValue, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectcrfLabUnit(String itemName)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(LabMappingsPage.SelectLabUnit, itemName, "Unable to select " + itemName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

       public static bool ValidateLengthOfControl(String DomainName, String ItemName)
        {
            try
            {
                if (LabMappingsPage.SelectionLabMappingDomainDropDown.SelectElement.SelectedOption.Text.Length == DomainName.Length
                   && LabMappingsPage.SelectLabIdForDomain(DomainName).SelectElement.SelectedOption.Text.Length == ItemName.Length)
                {
                    return true;
                    //Console.Write(LabMappingsPage.SelectionLabMappingDomainDropDown.WebElement.GetCssValue("width"));
                }
                else { return false; }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static Boolean VerifyExpandCollapsePresentForEachSection()
        {
            try
            {
                List<IControl> expandCollapse = LabMappingsPage.ExpandCollapseButtonForAllSections();

                for (int i = 5; i < 10; i++)
                {

                    if (!Control_PropertyUtilities.IsControlDisplayed(expandCollapse[i]))
                    {
                        return false;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }

        public static Boolean ClickExpandCollapse(String SectionName)
        {
            try
            {
                if (Control_ActionUtilities.Click(LabMappingsPage.ExpandCollapseForSection(SectionName), "Element not clickable"))
                {
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static Boolean ValidateUserIsOnLabMappingsTab()
        {
            try
            {
                if (Control_PropertyUtilities.IsControlVisible(DS_StudyProperties.Tab("Lab Mappings")))
                {
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static Boolean VerifyExpandCollapseForAllSectionsIsExpanded()
        {
            try
            {
                int count = 0;
                foreach (IControl c in LabMappingsPage.AllDropdowns)
                {

                    if (count > 0 && !Control_PropertyUtilities.IsControlDisplayed(c))
                    {
                        return false;
                    }
                    count++;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
            
        }
    }
}
