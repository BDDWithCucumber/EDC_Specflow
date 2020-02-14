using Framework.Actions;
using Pages.DataLabs.Study;
using Reports.DebugLog;
using System;
using System.IO;
using System.Reflection;
using System.Threading;
using System.Windows.Forms;

namespace BusinessProcesses.DataLabs.Study
{
    public class BP_UploadStudyFileUtilities
    {
        public static bool ClickFileBrowseButton()
        {
            return Control_ActionUtilities.ClickModalButton(DL_UploadStudyFilePage.BrowseButton);
        }
        public static bool SetStudyLabel(String studyLabelText)
        {
            return Control_ActionUtilities.Textbox_SetText(DL_UploadStudyFilePage.StudyLabelTextbox, studyLabelText, String.Empty);
        }
        public static bool ClickUploadButton()
        {
            return Control_ActionUtilities.ClickModalButton(DL_UploadStudyFilePage.UploadButton);
        }
        public static bool ClickCancelUploadButton()
        {
            return Control_ActionUtilities.Click(DL_UploadStudyFilePage.CancelButton, String.Empty);
        }
        public static bool UploadStudyOnBrowseField(String studyFileName, String label)
        {
            try
            {
                //string assemblyFolder = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);

                String startupPath = AppDomain.CurrentDomain.BaseDirectory;
                String studiesFolder = String.Empty;
                if (startupPath.EndsWith("\\"))
                {
                    studiesFolder = startupPath.Replace("EDC_Automation\\bin\\Debug\\", "BusinessProcesses\\DataLabs\\Study Files\\");
                }
                else
                {
                    studiesFolder = startupPath.Replace("EDC_Automation\\bin\\Debug", "BusinessProcesses\\DataLabs\\Study Files\\");
                }
                String fullFolderPath = studiesFolder + studyFileName;
                DL_UploadStudyFilePage.FileBrowseField.WebElement.SendKeys(fullFolderPath);
                Control_ActionUtilities.Textbox_SetText(DL_UploadStudyFilePage.StudyLabelTextbox, label, String.Empty);
                Control_ActionUtilities.ClickModalButton(DL_UploadStudyFilePage.UploadButton);
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
    
    public static bool UploadStudy(String studyFileName, String label)
        {
            try
            {
                //string assemblyFolder = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);

                String startupPath = AppDomain.CurrentDomain.BaseDirectory;
                String studiesFolder = String.Empty;
                if (startupPath.EndsWith("\\"))
                {
                    studiesFolder = startupPath.Replace("EDC_Automation\\bin\\Debug\\", "BusinessProcesses\\DataLabs\\Study Files\\");
                }
                else
                {
                    studiesFolder = startupPath.Replace("EDC_Automation\\bin\\Debug", "BusinessProcesses\\DataLabs\\Study Files\\");
                }

                Thread.Sleep(2000);
                //studyFileName = studyFileName.Replace(@"\", @"\\");
                String fullFolderPath = studiesFolder + studyFileName;
                SendKeys.SendWait(fullFolderPath);
                Thread.Sleep(1000);
                SendKeys.SendWait(@"{Enter}");
                Thread.Sleep(1000);

                Control_ActionUtilities.Textbox_SetText(DL_UploadStudyFilePage.StudyLabelTextbox, label, String.Empty);
                Control_ActionUtilities.ClickModalButton(DL_UploadStudyFilePage.UploadButton);
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
    }
}