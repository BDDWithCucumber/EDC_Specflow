using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.Designer.CompareStudyPopup;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.CompareStudy
{
    public class CompareStudyPopupUtilities
    {
        public static bool ClickSourceStudy(String studyName)
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(3, studyName, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(CompareStudyPopup.StudyListTable, list);
                IControl StudyNamecell = WebTableUtilities.GetCell(processRow, 0);
                IControl cellImage = WebTableUtilities.GetInputControl(StudyNamecell);
                Control_ActionUtilities.Click(cellImage, "Unable to click the radio button of study" + studyName);
            }
            catch (Exception e)
            {

            }
            BrowserUtilities.SwitchToWindow();
            return true;
        }

        public static bool ClickTargetStudy(String studyName)
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(3, studyName, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(CompareStudyPopup.StudyListTable, list);
                IControl StudyNamecell = WebTableUtilities.GetCell(processRow, 1);
                IControl cellImage = WebTableUtilities.GetInputControl(StudyNamecell);
                Control_ActionUtilities.Click(cellImage, "Unable to click the radio button of study" + studyName);
            }
            catch (Exception e)
            {

            }
            BrowserUtilities.SwitchToWindow();
            return true;
        }

        public static bool ClickSourceStudyVersion(String studyName)
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(2, studyName, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(CompareStudyPopup.SourceStudyTable, list);
                IControl StudyNamecell = WebTableUtilities.GetCell(processRow, 0);
                IControl cellImage = WebTableUtilities.GetInputControl(StudyNamecell);
                Control_ActionUtilities.Click(cellImage, "Unable to click the radio button of study" + studyName);
            }
            catch (Exception e)
            {

            }
            BrowserUtilities.SwitchToWindow();
            return true;
        }

        public static bool ClickTargetStudyVersion(String studyName)
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, studyName, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(CompareStudyPopup.TargetStudyTable, list);
                IControl StudyNamecell = WebTableUtilities.GetCell(processRow, 0);
                IControl cellImage = WebTableUtilities.GetInputControl(StudyNamecell);
                Control_ActionUtilities.Click(cellImage, "Unable to click the radio button of study" + studyName);
            }
            catch (Exception e)
            {

            }
            BrowserUtilities.SwitchToWindow();
            return true;
        }

        public static bool SelectSourceAndtarget(String process, String expectedStatus)
        {
            try
            {
               Control_ActionUtilities.Click(CompareStudyPopup.SelectSourceRadioButton, "Unable to click radio button");
               Control_ActionUtilities.Click(CompareStudyPopup.SelectTargetRadioButton, "Unable to click radio button");
               return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool ClickTwoDiffStudiesRadioButton()
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            try
            {
                return Control_ActionUtilities.Click(CompareStudyPopup.TwoDiffStudiesRadioButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return false;
        }

        public static bool ClickSameStudyRadioButton()
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            try
            {
                return Control_ActionUtilities.Click(CompareStudyPopup.SameStudyRadioButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return true;
        }

        public static bool ClickStudyNextButton()
        {
            try
            {
                return Control_ActionUtilities.Click(CompareStudyPopup.NextButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }

        public static bool ClickStudyVersionNextButton()
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            try
            {
                return Control_ActionUtilities.Click(CompareStudyPopup.NextButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return true;
        }

        public static bool ClickCompareStudyButton()
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            try
            {
                return Control_ActionUtilities.Click(CompareStudyPopup.CompareButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            return true;
        }
    }
}
