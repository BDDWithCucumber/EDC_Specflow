using Framework.Actions;
using Pages.Designer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.Designer
{
    public class BP_DS_FormPageUtilities
    {
        public static bool VeifyPage(string PageName)
        {
            try
            {
                string pageHeader = Framework.Actions.Control_PropertyUtilities.GetText(DS_Forms.pageHeader);                
                return pageHeader.Equals(PageName);
            }
            catch (Exception e)
            {
                new Reports.DebugLog.DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
       
    }
}
