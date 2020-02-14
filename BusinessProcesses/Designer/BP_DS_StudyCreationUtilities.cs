using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.Designer;
using Pages.Designer.Data;
using Pages.Designer.ManageSponsors;
using Pages.Designer.StudyProperties;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer
{
   public class BP_DS_StudyCreationUtilities
    {
        public static bool AddStudy(IEnumerable<StudyData> studydata, out List<String> failSiteList)
        {
                failSiteList = new List<String>();
                foreach (StudyData study in studydata)
                {
                    if (!(BP_DS_StudyCreationUtilities.EnterStudyData(study)))
                    {
                    return false;
                       
                    }
                }
            return true;
        }

        public static bool Verifysavedisabled()
        {
           return Control_ActionUtilities.IsClickable((DS_StudyProperties.Save).WebElement);

        }
        public static bool AddStudyData(IEnumerable<StudyData> studydata, out List<String> failSiteList)
        {
            failSiteList = new List<String>();
            foreach (StudyData study in studydata)
            {
                if ((BP_DS_StudyCreationUtilities.EnterStudyData(study)))
                {
                    Control_ActionUtilities.Click_PerssEnterKey(DS_StudyProperties.Save, String.Empty);
                }
            }
            return true;
        }

        public static bool EnterStudyData(StudyData study)
        {
            BP_DS_StudyCreationUtilities.SetStudyData(DS_StudyProperties.StudyTable, study);
            return true;
        }

        public static void SetStudyData(IControl studyTable, StudyData study)
        {
            SetStudyFieldData_Text(studyTable, "Study Name:             ", study.StudyName);
            SetStudyFieldData_Text(studyTable, "Study Label:             ", study.StudyLabel);
            SetStudyFieldData_Text(studyTable, "Protocol:             ", study.Protocol);
            SetStudyFieldData_Text(studyTable, "Protocol Label:             ", study.ProtocolLabel);
            SetStudyFieldData_Text(studyTable, "Protocol Title:  ", study.ProtocolTitle);
            SetStudyFieldData_Text(studyTable, "External Study ID:             ", study.ExternalStudyID);
            SetStudyFieldData_Text(studyTable, "Study Phase:             ", study.StudyPhase);
            SetStudyFieldData_Text(studyTable, "Study Drug Name:             ", study.StudyDrugName);
            SetStudyFieldData_Text(studyTable, "Study Indication:             ", study.StudyIndication);
            SetStudyFieldData_Dropdown(studyTable, "Therapeutic Area:", study.TherapeuticArea);
            SetStudyFieldData_Dropdown(studyTable, "Client/Sponsor:             ", study.Sponsor);
            SetStudyFieldData_Dropdown(studyTable, "Target App:                             ", study.TargetApp);
            SetStudyFieldData_Dropdown(studyTable, "Safety Mapping: [?]  ", study.SafetyMapping);
            SetStudyFieldData_Dropdown(studyTable, "Local Labs: [?]  ", study.LocalLabs);
        }

        static bool SetStudyFieldData_Text(IControl StudyTable, String searchText, String valueToSet)
        {
            if (valueToSet != null)
            {
                IControl row = WebTableUtilities.Table_FindRow(StudyTable, GetSearchItemList(searchText));
                IControl textbox = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Textbox);
                return Control_ActionUtilities.Textbox_SetText(textbox, valueToSet, String.Empty);
            }
            return false;
        }

        static bool SetStudyFieldData_Dropdown(IControl StudyTable, String searchText, String valueToSet)
        {
            if (valueToSet != null)
            {
                IControl row = WebTableUtilities.Table_FindRow(StudyTable, GetSearchItemList(searchText));
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

        public static bool LabsDropDownStatus(String status)
        {
            try
            {
                
                if((Control_PropertyUtilities.IsControlDisabled(DS_StudyProperties.LabDropDown)))
                {
                    return false;
                }
               
                               
            }
            catch (Exception e)
            {
                new Reports.DebugLog.DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool LabsDropDownValue(String Value)
        {
            try
            {
                if ((Control_PropertyUtilities.GetText(DS_StudyProperties.LabDropDown)).Equals(Value))
                {

                    return true;
                }
            }
            catch (Exception e)
            {
                new Reports.DebugLog.DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool DeleteJobsContinue(String titleText, String bodyMessageText_Partial)
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            bool isClicked = false;
            //if (DeleteJobsModalExist_CheckHeaderTextAndBodyMessage(titleText, bodyMessageText_Partial))
            //{
            //    isClicked = Control_ActionUtilities.ClickModalButton(DS_ConfirmationPopup.DeleteJobsContinue);
            //}
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }

        public static bool ClickStudyLink(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.StudyManagementProcessLink(linkName), "Unable to find link " + linkName + " in Designer Home Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SetSponsorName(String SponsorName)
        {
            try
            { 
            return Control_ActionUtilities.Textbox_SetText(DS_ManageSponsors.SponsorName, SponsorName, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetSponsorLabel(String SponsorLabel)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DS_ManageSponsors.SponsorLabel, SponsorLabel, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickOnSaveSponsor()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_ManageSponsors.SponsorSaveButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }
    }
}
