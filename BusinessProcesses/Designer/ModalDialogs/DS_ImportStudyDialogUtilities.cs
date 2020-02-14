using Framework.Actions;
using Pages.Designer;
using Pages.Designer.ModelDialog;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.ModalDialogs
{
    public class DS_ImportStudyDialogUtilities
    {
        public static bool ClickChooseFileButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToFrame();
                Control_ActionUtilities.ClickModalButton(DS_ModelDialog.ChooseFileButton);
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
                Control_ActionUtilities.ClickModalButton(DS_ModelDialog.Continue);
                BrowserUtilities.SwitchToWindow();
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
