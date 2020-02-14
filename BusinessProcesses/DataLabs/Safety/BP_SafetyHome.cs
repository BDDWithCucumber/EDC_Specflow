using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Safety;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.DataLabs.Safety
{
    public class BP_SafetyHome
    {
        public static bool SafetyHomePageVerification()
        {
            try
            {
                //Icontrol SafetyGrid = 
                if (Control_ActionUtilities.VerifyObjectExistOnPage(DL_SafetyHomePage.SafetyGrid, "Safety Grid","Safety Home Page","Unable to verify the Safety Home screen"))                    
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
        public static bool VerifySafetyGridDetailsColumnHeader(string headerName)
        {
            try
            {
                IControl safetyCaseheader = DL_SafetyHomePage.SafetyGridDetailsColumnHeader(headerName);
                if (!Control_PropertyUtilities.IsControlNull(safetyCaseheader))
                {
                    return true;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);

            }
            return false;
        }
    }
}
