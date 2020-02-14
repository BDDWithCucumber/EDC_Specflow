using Framework.Actions;
using Pages.Designer.Common;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.Designer.Common
{
    public class HeaderStudyVerifyErrorUtilities
    {
        public static bool ClickHeaderStudyVerifyErrorLink()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_CommonObjects.StudyVerifyErrorLink, "Unable to find image link ");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

    }
}
