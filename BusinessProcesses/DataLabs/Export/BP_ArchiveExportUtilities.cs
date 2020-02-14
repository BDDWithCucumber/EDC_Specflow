using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Export;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Windows.Forms;

namespace BusinessProcesses.DataLabs.Export
{
    public class BP_ArchiveExportUtilities
    {
        public static bool ClickAllDataArchiveExportRadioButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_ArchiveExportPage.AllDataArchiveExport_RadioButton, "Unable to click AllDataArchiveExport_RadioButton in StudyArchivePage");
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool SelectSites(List<StudyArchive_SiteData> sites)
        {
            try
            {
                foreach (StudyArchive_SiteData site in sites)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(1, site.Site, TableColumnContentType.Text));
                    IControl tableRow = WebTableUtilities.Table_FindRow(DL_ArchiveExportPage.SitesTable, list);
                    if (!Control_PropertyUtilities.IsControlNull(tableRow))
                    {
                        IControl tableCell = WebTableUtilities.GetCell(tableRow, 0);
                        IControl checkbox = WebTableUtilities.GetInputControl(tableCell);
                        if (!Control_ActionUtilities.Click(checkbox, "Unable to click site " + site.Site + "checkbox in ArchiveExportPage"))
                        {
                            return false;
                        }
                    }
                }
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool ClickExportButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_ArchiveExportPage.ExportButton, "Unable to click Export button in StudyArchivePage");
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool ClickCancelButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_ArchiveExportPage.CancelButton, "Unable to click Export button in StudyArchivePage");
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool SetDownloadFilePath(string filePath)
        {
            try
            {
                Thread.Sleep(2000);
                SendKeys.SendWait(filePath);
                Thread.Sleep(1000);
                SendKeys.SendWait(@"{Enter}");
                Thread.Sleep(1000);
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }
    }
}
