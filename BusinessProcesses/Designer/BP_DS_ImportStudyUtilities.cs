using BusinessProcesses.Designer.ModalDialogs;
using Framework.Actions;
using Interfaces;
using Pages.Designer;
using Pages.Designer.ManageLabs;
using Pages.Designer.StudyProperties;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using Utilities;

namespace BusinessProcesses.Designer
{
    public class BP_DS_ImportStudyUtilities
    {

        public static bool ImportStudy(String studyFileName)
        {
            try
            {
                //string assemblyFolder = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);

                String startupPath = AppDomain.CurrentDomain.BaseDirectory;
                String studiesFolder = String.Empty;
                if (startupPath.EndsWith("\\"))
                {
                    studiesFolder = startupPath.Replace("EDC_Automation\\bin\\Debug\\", "BusinessProcesses\\Designer\\StudyFiles\\");
                }
                else
                {
                    studiesFolder = startupPath.Replace("EDC_Automation\\bin\\Debug", "BusinessProcesses\\Designer\\StudyFiles\\");
                }

                Thread.Sleep(2000);
                //studyFileName = studyFileName.Replace(@"\", @"\\");
                String fullFolderPath = studiesFolder + studyFileName;
                SendKeys.SendWait(fullFolderPath);
                Thread.Sleep(1000);
                SendKeys.SendWait(@"{Enter}");
                Thread.Sleep(1000);

                DS_ImportStudyDialogUtilities.ClickContinueButton();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
        public static string DownloadStudyFile(String studyFileName)
        {
            try
            {
                string zipFilePath = @"C:\Users\CHODISS\Downloads\";
                string extractedFilePath = @"C:\StudyFiles\";
                string folder = @"C:\Users\CHODISS\Downloads\";
                var file = new DirectoryInfo(folder).GetFiles("*Import_Study1_*").OrderByDescending(f => f.LastWriteTime).First();
                // ZipArchive zipfile = ZipFile.Read(zipFilePath);
                // DialogResult result = openFileDialog1.ShowDialog();
                string zipPath = zipFilePath + file.Name;
                string extractPath = Regex.Replace(extractedFilePath + file.Name, ".zip", "");
                ZipFile.ExtractToDirectory(zipPath, extractPath);
                return extractPath;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return null;
            }
        }
        public static bool ClickSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_StudyProperties.Save,"Unable to select Save button");
                
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool HandlethePopup()
        {
            try
            {
                bool control = Control_PropertyUtilities.IsControlNull(ImportLabDictionaryPage.ImportLabDictErrorTableOkButton);
                if (control == false)
                {
                    Control_ActionUtilities.Click(ImportLabDictionaryPage.ImportLabDictErrorTableOkButton, "Control not visible");
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }

        public static bool IsDictionaryNotificationTextExist()
        {
           return (DS_StudyProperties.labdictionaryItemtext.WebElement.Displayed);
        }
        public static bool IsDictionaryNotificationLinkExist()
        {
           return Control_ActionUtilities.Click(DS_StudyProperties.labdictionaryItemlink, String.Empty);
        }
        public static bool SearchForTheFile(string PartialFileName, string folderPath)
        {
            try
            {
                string filePath = folderPath+"\\";
                // DirectoryInfo hdDirectoryInWhichToSearch = new DirectoryInfo(@"c:\");
                DirectoryInfo hdDirectoryInWhichToSearch = new DirectoryInfo(filePath);
                FileInfo[] filesInDir = hdDirectoryInWhichToSearch.GetFiles("*" + PartialFileName + "*.*");

                foreach (FileInfo foundFile in filesInDir)
                {
                    string fullName = foundFile.FullName;
                    Console.WriteLine(fullName);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }


        public static bool VerifyMessageAtSponsor(String message)
        {
            try
            {
                string displayedMessageInApp = Control_PropertyUtilities.GetText(DS_StudyProperties.SponsorErrorMessage);

                return (displayedMessageInApp.Equals(message));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

    }
}
