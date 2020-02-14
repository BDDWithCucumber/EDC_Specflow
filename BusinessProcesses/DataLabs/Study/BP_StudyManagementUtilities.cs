using BusinessProcesses.DataLabs.Common;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Common;
using Pages.DataLabs.Study;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Study
{
    public class BP_StudyManagementUtilities
    {
        public static bool ChangeStatusInStudyManagementPage(String status)
        {
            try
            {
                if (Control_ActionUtilities.Dropdown_SelectItem(DL_StudyManagementPage.StudyStausDropdown, status, String.Empty))
                {
                    return Control_ActionUtilities.Click(DL_StudyManagementPage.SaveButton, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            return false;
        }

        public static bool IsNotesExistInStudyVersionPropertiesPage(string notes)
        {
            try
            {
                IControl notesControl = DL_StudyVersionPropertiesPage.Notes;
                return notes.Equals(Control_PropertyUtilities.GetText(notesControl), StringComparison.InvariantCultureIgnoreCase);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool IsPublishStudyFlagPageOpened()
        {
            try
            {
                return IsPageOpened("Publish Study Flags");
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsPublishStudyPageOpened()
        {
            try
            {
                return IsPageOpened("Publish Study");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool IsPageOpened(String pageName)
        {
            try
            {
                String errorItem = String.Empty;
                List<String> breadCrumbList = new List<String>();
                breadCrumbList.Add(pageName);
                return BP_BreadCrumbUtilities.HasBreadCrumbItems(DL_CommonObjects.BreadCrumbContainer, breadCrumbList, out errorItem);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}