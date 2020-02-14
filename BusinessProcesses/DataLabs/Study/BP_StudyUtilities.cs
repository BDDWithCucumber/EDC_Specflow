using BusinessProcesses.DataLabs.Common;
using BusinessProcesses.DataLabs.Modal;
using BusinessProcesses.DataLabs.Inbox;
using BusinessProcesses.DataLabs.Main;
using Framework;
using System;
using System.Collections.Generic;
using Reports.DebugLog;
using System.Reflection;
using Common;
using DBUtilities;

namespace BusinessProcesses.DataLabs.Study
{
    public class BP_StudyUtilities
    {
        public static bool DeleteStudy(SQLInfo dBInfo = null)
        {
            try
            {

				BP_DataManagerPortalDropdownUtilities.SelectPortalDropdownItem("Study Administration");
				BP_StudyAdministationUtilities.InvokeLinkInStudyAdministrationPage("Study Management");
				BP_ActionPaletteUtilities.InvokeActionPaletteLink("Manage Versions", "StudyResetAction");

				int i = 0;
				bool isStudyAvailable = true;
				while (i < 5 || isStudyAvailable)
				{
					++i;
					String studyStatus = GetStudyStatus();
					if (studyStatus.Equals("Uploaded", StringComparison.InvariantCultureIgnoreCase))
					{
						DeleteUploadedStudy();
					}
					else if (studyStatus.Equals("Staged", StringComparison.InvariantCultureIgnoreCase))
					{
						DeleteStagedStudy();
					}
					else if (studyStatus.Contains("Published"))
					{
						DeletePublishedStudy();
					}
					else if (studyStatus.Equals("Exception", StringComparison.InvariantCultureIgnoreCase))
					{
						DeleteExceptionStudy();
					}
					isStudyAvailable = BP_StudyVersionManagementUtilities.IsStudyAvailable();
				}
				string sqlQuery = @"DBCC CHECKIDENT ('LabReferenceRange', RESEED, 999)";
				if (!DatabaseUtilities.ExecuteUpdateQuery(sqlQuery, dBInfo))
				{
					return false;
				}

				return !isStudyAvailable;
			}
			catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static void DeleteUploadedStudy()
        {
            BP_StudyVersionManagementUtilities.InvokeStudyRow("Uploaded");
            BP_ActionPaletteUtilities.InvokeActionPaletteLink("Delete", "StudyVersionPropertiesActions");
            BP_ModalWindow.ClickContinue("Delete Study", "permanently remove");
        }

        public static void DeleteStagedStudy()
        {
            BP_StudyVersionManagementUtilities.InvokeStudyRow("Staged");
            BP_ActionPaletteUtilities.InvokeActionPaletteLink("Cancel", "StudyVersionPropertiesActions");
            BP_ModalWindow.ClickContinue("Cancel Study", "status back to Uploaded.");
            DeleteUploadedStudy();
        }

        public static bool DeletePublishedStudy()
        {
            try
            {
                if (BP_StudyVersionManagementUtilities.IsStudyAvailable())
                {
                    BP_BreadCrumbUtilities.ClickBreadCrumbItem("Study Management");
                    BP_ActionPaletteUtilities.InvokeActionPaletteLink("Reset Study", "StudyResetAction");
                    BP_ModalWindow.ClickContinue("Reset Study", "Study Reset will delete");
                    BP_ActionPaletteUtilities.InvokeActionPaletteLink("Manage Versions", "StudyResetAction");
                    BP_StudyVersionManagementUtilities.InvokeStudyRow("Published");
                    BP_ActionPaletteUtilities.InvokeActionPaletteLink("Recall", "StudyVersionPropertiesActions");
                    BP_ModalWindow.ClickContinue("Recall Study", "complete database backup");

                    DeleteUploadedStudy();
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static void DeleteExceptionStudy()
        {
            BP_StudyVersionManagementUtilities.InvokeStudyRow("Exception");
            BP_ActionPaletteUtilities.InvokeActionPaletteLink("Delete", "StudyVersionPropertiesActions");
            BP_ModalWindow.ClickContinue("Delete Study", "permanently remove");
        }

        public static bool UploadAndPublishStudy(String studyFileName, String studyLabel)
        {
            try
            {
                BP_ActionPaletteUtilities.InvokeActionPaletteLink("Manage Versions", "StudyResetAction");
                if (!BP_StudyVersionManagementUtilities.IsStudyAvailable())
                {
                    BP_ActionPaletteUtilities.InvokeActionPaletteLink("Upload Study File", "StudyVersionMgmtListActions");
                    //BP_UploadStudyFileUtilities.ClickFileBrowseButton();
                    BP_UploadStudyFileUtilities.UploadStudyOnBrowseField(studyFileName, studyLabel);
                    BP_StudyVersionManagementUtilities.InvokeStudyRow("Uploaded");
                    BP_ActionPaletteUtilities.InvokeActionPaletteLink("Stage", "StudyVersionPropertiesActions");
                    BP_StudyVersionManagementUtilities.InvokeStudyRow("Staged");
                    BP_ActionPaletteUtilities.InvokeActionPaletteLink("Publish", "StudyVersionPropertiesActions");
                    BP_MainNavigationUtilities.SelectPrimaryTabOnMenu("Inbox");
                    String jobText = "Publishing of Study file (" + studyLabel + ") - complete.";
                    return BP_InboxUtilities.CheckInbox_Subject_FromTop("Jobs", new List<String> { jobText });
                }
                return false;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool UploadAStudy(String studyFileName, String studyLabel)
        {
            try
            {
                BP_ActionPaletteUtilities.InvokeActionPaletteLink("Manage Versions", "StudyResetAction");
                if (!BP_StudyVersionManagementUtilities.IsStudyAvailable())
                {
                    BP_ActionPaletteUtilities.InvokeActionPaletteLink("Upload Study File", "StudyVersionMgmtListActions");
                    BP_UploadStudyFileUtilities.ClickFileBrowseButton();
                    BP_UploadStudyFileUtilities.UploadStudy(studyFileName, studyLabel);
                    return true;
                }
                return false;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static String GetStudyStatus()
        {
            String studyStatus = String.Empty;
            try
            {
                if (BP_StudyVersionManagementUtilities.IsStudyAvailable())
                {
                    studyStatus = BP_StudyVersionManagementUtilities.GetStudyStatus();
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return studyStatus;
        }
    }
}