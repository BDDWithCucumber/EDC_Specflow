using Framework.Actions;
using Interfaces;
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
    public class BP_PISignatureUtilities
    {

        public static bool IsAttestationEditable()
        {
            try
            {
                return Control_PropertyUtilities.IsControlVisible(DL_PISignaturePage.AttestationTextArea) && 
                    !Control_PropertyUtilities.IsControlDisabled(DL_PISignaturePage.AttestationTextArea);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
