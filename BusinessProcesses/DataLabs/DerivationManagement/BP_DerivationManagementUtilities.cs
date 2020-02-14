using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Framework.Actions;
using Pages.DataLabs.DerivationManagement;
using Reports.DebugLog;
using Interfaces;
using System.Threading;

namespace BusinessProcesses.DataLabs.DerivationManagement
{
    public class BP_DerivationManagementUtilities
    {
        public static bool SelectDerivationByDerivationNameFilter(string derivationName)
        {
            try
            {
                Control_ActionUtilities.Click(DL_DerivationManagement.derivationNameTextBoxFilter, "Unable to select the filter icon");
                Thread.Sleep(2000);

                Control_ActionUtilities.Click(DL_DerivationManagement.FilterTypeLink("NoFilter"), "Unable to select the Nofilter icon");
                
                Thread.Sleep(2000);

                Control_ActionUtilities.Textbox_SetText(DL_DerivationManagement.derivationNameTextBox, derivationName, "unable to set the derivation name - " + derivationName + "in the derivation name textbox");
                Thread.Sleep(5000);
                if(!Control_PropertyUtilities.IsControlNull(DL_DerivationManagement.derivationNameLink(derivationName)))
                {
                    if (!Control_ActionUtilities.Click(DL_DerivationManagement.derivationNameLink(derivationName), "Unable to select the link - " + derivationName))
                    {
                        return false;
                    }
                    else
                    {
                        return true;
                    }
                }
                return false;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectDerivationStatus(string derivationStatus)
        {
            try
            {
                if (!Control_ActionUtilities.Dropdown_SelectItem(DL_DerivationManagement.derivationStatusdropdown, derivationStatus, "unable to select the derivation status - "+derivationStatus))
                {
                    return false;
                }
                else
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
        public static bool ClickButtonOnDerivationPage(string buttonName)
        {
            try
            {
                if(!Control_ActionUtilities.Click(DL_DerivationManagement.ButtonName(buttonName),"unable to select the button - " + buttonName))
                {
                    return false;
                }
                else
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
