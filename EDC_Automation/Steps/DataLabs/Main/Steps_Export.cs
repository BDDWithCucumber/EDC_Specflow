using BusinessProcesses.DataLabs.Export;
using BusinessProcesses.DataLabs.FileExplorer;
using BusinessProcesses.DataLabs.Inbox;
using BusinessProcesses.DataLabs.Modal;
using Pages.DataLabs.Data;
using System;
using System.Collections.Generic;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;

namespace EDC_Automation.Steps.DataLabs.Main
{
    [Binding]
    public class Steps_Export
    {
        [When(@"I click link ""(.*)"" in ExportPage")]
        public void WhenIClickLinkInExportPage(String linkName)
        {
            if (!BP_ExportUtilities.ClickLink(linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select export details in QuickExportPage")]
        public void WhenISelectExportDetailsInQuickExportPage(Table table)
        {
            QuickExportData data = table.CreateInstance<QuickExportData>();
            if (!BP_QuickExportUtilities.SetQuickExportData(data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Export button in QuickExportPage")]
        public void WhenIClickExportButtonInQuickExportPage()
        {
            if (!BP_QuickExportUtilities.ClickExportButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see link ""(.*)"" in ExportPage")]
        public void ThenISeeLinkInExportPage(string linkName)
        {
            if (!BP_ExportUtilities.IsLinkAvailable(linkName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I select sites in ArchiveExportPage")]
        public void WhenISelectSitesInArchiveExportPage(Table table)
        {
            IEnumerable<StudyArchive_SiteData> data = table.CreateSet<StudyArchive_SiteData>();
            if (!BP_ArchiveExportUtilities.SelectSites((List<StudyArchive_SiteData>)data))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click Export button in ArchiveExportPage")]
        public void WhenIClickExportButtonInArchiveExportPage()
        {
            if (!BP_ArchiveExportUtilities.ClickExportButton())
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see a modal dialog having title ""(.*)"" and partial message ""(.*)""")]
        public void ThenISeeAModalDialogHavingTitleAndPartialMessage(String title, String bodyMessageText)
        {
            if (!BP_ModalWindow.IsModalExist_VerifyHeaderTextAndBodyMessage(title, bodyMessageText))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I click inbox item ""(.*)"" in folder ""(.*)""")]
        public void WhenIClickInboxItemInFolder(String subject, String folder)
        {
            if (!BP_InboxUtilities.ClickInboxItem(folder, subject))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I give file path to save ""(.*)"" for StudyArchive")]
        public void WhenIGiveFilePathToSave(String filePath)
        {
            if (!BP_ArchiveExportUtilities.SetDownloadFilePath(filePath))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I download the file in the execution folder with name ""(.*)""\.")]
        public void WhenIDownloadTheFileInTheExecutionFolderWithName_(string FileName)
        {
            if (!BP_ArchiveExportUtilities.SetDownloadFilePath(FeatureContext.Current["ReportsFolderPath"].ToString() + FileName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see fully downloaded file ""(.*)""")]
        public void ThenISeeFullyDownloadedFile(String folderFullPath)
        {
            if (!BP_FileUtilites.CheckForFullyDownloadedFile(folderFullPath))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [Then(@"I see the file with name ""(.*)"" in execution folder\.")]
        public void ThenISeeTheFileWithNameInExecutionFolder_(String FileName)
        {
            if (!BP_FileUtilites.CheckForFullyDownloadedFile(FeatureContext.Current["ReportsFolderPath"].ToString() + FileName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [When(@"I unzip folder ""(.*)""")]
        public void WhenIUnzipFolder(string zipFolderFullPath)
        {
            if (!BP_FileUtilites.UnzipFolder(FeatureContext.Current["ReportsFolderPath"].ToString() + zipFolderFullPath))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }

        [Then(@"I see unzipped folder ""(.*)""")]
        public void ThenISeeUnzippedFolder(String unzippedFullFolderPath)
        {
            if (!BP_FileUtilites.IsFolderExist(FeatureContext.Current["ReportsFolderPath"].ToString() + unzippedFullFolderPath))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
        [When(@"I save the export file in the folder ""(.*)"" containing ""(.*)"" in the execution path with name ""(.*)""\.")]
        public void WhenISaveTheExportFileInTheFolderContainingInTheExecutionPathWithName_(string FolderPath, string FindFileName, string destFileName)
        {
            if (!BP_FileUtilites.FindAndSaveFile(FeatureContext.Current["ReportsFolderPath"].ToString() + FolderPath, FindFileName, FeatureContext.Current["ReportsFolderPath"].ToString() + destFileName))
            {
                ScenarioContext.Current["ActResult"] = "Failed";
            }
        }
    }
}
