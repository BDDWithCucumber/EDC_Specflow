using BusinessProcesses.Designer.ModalDialogs;
using BusinessProcesses.Designer.VerifyStudy;
using Common;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium.Remote;
using Pages.Designer;
using Pages.Designer.Data;
using Pages.Designer.StudyProperties;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Utilities;
using static System.Collections.Specialized.BitVector32;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace BusinessProcesses.Designer
{    
    public class BP_DS_CreateStudyFromExistingUtilities
    { 
        public static bool WhenISelectThePopupWindow(string title, string message)
        {
            return BrowserUtilities.DS_SwitchToFrame();
            
        }

        public static bool ClickStudyLink(String linkName)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(linkName), "Unable to find link " + linkName + " in Designer Home Page");                
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool DownloadTheStudy(String linkName)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(linkName), "Unable to find link " + linkName + " in Designer Home Page");                                
                //SendKeys.SendWait(@"{Enter}");               
                BrowserUtilities.SwitchToWindow();
                return true;
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
                IControl StudiesTable = DS_HomePage.StudiesTableInCreateStudyFromExistingStudyWindow;
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
        public static bool ChangeTheStudyName(string StudyNameChange)
        {
            try
            {
                IControl studyNameChange = DS_StudyProperties.StudyNameChange();
                studyNameChange.WebElement.Clear();

                studyNameChange.WebElement.SendKeys(StudyNameChange);


                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }


    }
}
