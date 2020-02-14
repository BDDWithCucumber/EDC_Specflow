using Interfaces;
using OpenQA.Selenium;
using System;
using Utilities;

namespace Pages.DataLabs.Study
{
    public class DL_PublishStudyPage_MajorStudyUpdate
    {

        public static IControl PublishButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_PublishProtocol_btnPublish"));
            }
        }

        public static IControl PublishButton_Minor
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_PublishProtocol_btnPublishMinor"));
            }
        }

        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_PublishProtocol_btnCancel"));
            }
        }

        public static IControl GetPatientMigrationRadioButton(String radioButtonText)
        {
            if(radioButtonText.Equals("Migrate all patients", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_PublishProtocol_rdoMigrate"));
            }
            else if(radioButtonText.Equals("Do not migrate", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_PublishProtocol_rdoDoNotMigrate"));
            }
            return null;
        }
    }
}
