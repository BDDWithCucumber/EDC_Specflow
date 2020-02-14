using BusinessProcesses.Designer.Common;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.Designer;
using Pages.Designer.ConfirmationPopup;
using Pages.Designer.Data;
using Pages.Designer.StudyProperties;
using Pages.Designer.VerifyStudy;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.VerifyStudy
{
    public class DS_BP_VerifyStudyUtilities
    {
        public static bool VerifyStudyContinue(String titleText, String bodyMessageText_Partial)
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            bool isClicked = false;
            if (IsModalExist_CheckHeaderTextAndBodyMessage(titleText, bodyMessageText_Partial))
            {
                isClicked = Control_ActionUtilities.ClickModalButton(VerifyStudyPopup.VerifyContinue);
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }

        public static bool IsStudyAvailable(object p)
        {
            throw new NotImplementedException();
        }

        public static bool IsModalExist_CheckHeaderTextAndBodyMessage(String titleText, String bodyMessageText_Partial)
        {
            try
            {
                return titleText.Equals(Control_PropertyUtilities.GetText(VerifyStudyPopup.VerifyStudyHeader).Trim()) &&
                Control_PropertyUtilities.GetText(VerifyStudyPopup.VerifyStudyMessage).Contains(bodyMessageText_Partial);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
            public static bool IsStudyAvailable(IEnumerable<StudyData> studies)
        {
            try
            {
                IControl StudiesTable = DS_HomePage.StudiesTable;
                foreach (StudyData study in studies)
                {
                    WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                    searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, study.StudyName, TableColumnContentType.Link));
                    IControl row = WebTableUtilities.Table_FindRow(StudiesTable, searchList, 0);
                    if (Control_PropertyUtilities.IsControlNull(row))
                    {
                        return false;
                    }
                    IControl cell = WebTableUtilities.GetCell(row, 1);
                    IControl link = WebTableUtilities.GetLink(cell);
                    Control_ActionUtilities.Click(link, "linknotfound");
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsStudyAvailableinHomePage(IEnumerable<StudyData> studies)
        {
            try
            {
                bool isClicked = false;
                String notificationMessage = "Study has been successfully deleted";
                IControl StudiesTable = DS_HomePage.StudiesTable;
                foreach (StudyData study in studies)
                {
                    WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                    searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, study.StudyName, TableColumnContentType.Link));
                    IControl row = WebTableUtilities.Table_FindRow(DS_HomePage.StudiesTable, searchList, 0);
                    if (!Control_PropertyUtilities.IsControlNull(row))
                    {

                        IControl cell = WebTableUtilities.GetCell(row, 9);
                        if ((Control_ActionUtilities.MouseClick(cell, String.Empty)))
                        {
                            if( Control_ActionUtilities.ClickModalButton(DS_ConfirmationPopup.DeleteJobsContinue))                           {
                                
                               
                               isClicked = DS_BP_NotificationUtilities.VerifyNotificationForDict(notificationMessage);

                            }
                            
                        }
                    } 
                }
                return isClicked;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }      

        public static bool IsStudyDeleted(IEnumerable<StudyData> studies)
        {
            try
            {
                bool StudyDeletedSucessfully = false;
                IControl StudiesTable = DS_HomePage.StudiesTable;
                foreach (StudyData study in studies)
                {
                    WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                    searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, study.StudyName, TableColumnContentType.Link));
                    IControl row = WebTableUtilities.Table_FindRow(DS_HomePage.StudiesTable, searchList, 0);
                    StudyDeletedSucessfully = Control_PropertyUtilities.IsControlNull(row);                    
                }
                return StudyDeletedSucessfully;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
