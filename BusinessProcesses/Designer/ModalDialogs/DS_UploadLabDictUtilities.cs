using Framework.Actions;
using Pages.Designer.ManageLabs;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using Utilities;

namespace BusinessProcesses.Designer.ModalDialogs
{
    public class DS_UploadLabDictUtilities
    {
        public static bool ClickChooseFileButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToFrame();
                Control_ActionUtilities.ClickModalButton(ManageLabsPage.LabDictChoosefile);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickContinueButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToFrame();
                Control_ActionUtilities.ClickModalButton(ManageLabsPage.LabDictContinue);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool UploadStudyFile(String studyFileName)
        {
            try
            {
                //string assemblyFolder = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);

                String startupPath = AppDomain.CurrentDomain.BaseDirectory;
                String studiesFolder = String.Empty;
                if (startupPath.EndsWith("\\"))
                {
                    studiesFolder = startupPath.Replace("EDC_Automation\\bin\\Debug\\", "BusinessProcesses\\Designer\\LabDictFiles\\");
                }
                else
                {
                    studiesFolder = startupPath.Replace("EDC_Automation\\bin\\Debug", "BusinessProcesses\\Designer\\LabDictFiles\\");
                }

                Thread.Sleep(2000);
                //studyFileName = studyFileName.Replace(@"\", @"\\");
                String fullFolderPath = studiesFolder + studyFileName;
                SendKeys.SendWait(fullFolderPath);
                Thread.Sleep(1000);
                SendKeys.SendWait(@"{Enter}");
                Thread.Sleep(1000);

                DS_UploadLabDictUtilities.ClickContinueButton();
                Thread.Sleep(10 * 5000);
                BrowserUtilities.RefreshPage();
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
