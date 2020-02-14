
using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Export
{
    public class DL_ExportPage
    {
        public static IControl QuickExportLink { get { return SyncUtilities.FindVisibleElement(By.LinkText("Quick Export")); } }
        public static IControl ArchiveExportLink { get { return SyncUtilities.FindVisibleElement(By.LinkText("Archive Export")); } }
        public static IControl AdvancedExportLink { get { return SyncUtilities.FindVisibleElement(By.LinkText("Advanced Export")); } }
    }
}