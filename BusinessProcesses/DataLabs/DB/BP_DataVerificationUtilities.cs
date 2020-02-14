using Common;
using Pages.DataLabs.Data;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.DB
{
    public class BP_DataVerificationUtilities
    {
        public bool VerifyData(SQLInfo sqlInfo, String command,DataTable dataToVerify)
        {
            try
            {

            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return true;
        }
    }
}
