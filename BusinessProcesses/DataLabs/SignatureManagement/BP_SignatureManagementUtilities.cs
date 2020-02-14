using Framework.Actions;
using Pages.DataLabs.SignatureManagement;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.SignatureManagement
{
    public class BP_SignatureManagementUtilities
    {
        public static bool ClickPISignatureLink()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_SignatureManagementPage.PISignatureLink, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
