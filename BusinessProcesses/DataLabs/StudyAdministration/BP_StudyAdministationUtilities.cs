using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Labs;
using Pages.DataLabs.Study;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Common
{
    public class BP_StudyAdministationUtilities
    {

        public static bool InvokeLinkInStudyAdministrationPage(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(DL_StudyAdministrationPage.GetLink(linkName), "Unable to find link " + linkName + " in StudyAdministration Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
        public static string VerifyLabManagementDescription()
        {
            return Control_PropertyUtilities.GetText(DL_LabManagementPage.LabmangementDescription);
         }

        public static bool IsLinkAvailable(String linkName)
        {
            try
            {
                IControl c = DL_StudyAdministrationPage.GetLink(linkName);
                return !Control_PropertyUtilities.IsControlNull(c);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
    }
}