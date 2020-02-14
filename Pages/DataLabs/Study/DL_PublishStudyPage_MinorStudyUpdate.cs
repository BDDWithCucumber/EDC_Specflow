using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Study
{
    public class DL_PublishStudyPage_MinorStudyUpdate
    {

        public static IControl pScriptCheckbox { get { return SyncUtilities.FindVisibleElement(By.Id("Study_PublishProtocol_chkPscript")); } }
        public static IControl DerivationsCheckbox { get { return SyncUtilities.FindVisibleElement(By.Id("Study_PublishProtocol_chkDerivation")); } }
        public static IControl QueriesCheckbox { get { return SyncUtilities.FindVisibleElement(By.Id("Study_PublishProtocol_chkQueries")); } }

        public static IControl PublishButton { get { return SyncUtilities.FindVisibleElement(By.Id("Study_PublishProtocol_btnPublishMinor")); } }
        public static IControl CancellButton { get { return SyncUtilities.FindVisibleElement(By.Id("Study_PublishProtocol_btnCancelPublish")); } }
    }
}