using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Study;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Study
{
    public class BP_PublishStudyPage_MajorStudyUpdateUtilities
    {
        public static bool SetPatientMigrateOption(String patientMigrationRadioButtonText)
        {
            try
            {
                IControl radioButton = DL_PublishStudyPage_MajorStudyUpdate.GetPatientMigrationRadioButton(patientMigrationRadioButtonText);
                if (radioButton != null)
                {
                    return Control_ActionUtilities.Click(radioButton, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickPublishButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_PublishStudyPage_MajorStudyUpdate.PublishButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickPublishButton_MinorUpdate()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_PublishStudyPage_MajorStudyUpdate.PublishButton_Minor, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickCancelButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_PublishStudyPage_MajorStudyUpdate.CancelButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}