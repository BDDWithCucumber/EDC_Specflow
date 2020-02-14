using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading;
using Utilities;

namespace BusinessProcesses.DataLabs.Inbox
{
    public class BP_InboxUtilities
    {
        public static bool ClickInboxItem(String folderName, String subject)
        {
            try
            {
                int i = 0;
                while (i < 25)
                {
                    if (BP_Inbox_ActionPaletteUtilities.InvokeActionPaletteItem(folderName))
                    {
                        ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(Pages.DataLabs.Inbox.DL_InboxPage.InboxTable);
                        foreach (IControl row in rows)
                        {
                            IControl c = WebTableUtilities.GetElement(row, subject, 3, TableColumnContentType.Link_Partial);
                            if (!Control_PropertyUtilities.IsControlNull(c))
                            {
                                return Control_ActionUtilities.Click(c, "Unbale to click inbox item for subject " + subject);
                            }
                        }
                    }
                    ++i;
                    Thread.Sleep(5000);
                }

            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool CheckInbox_Subject_FromTop(String folderName, List<String> subjectList)
        {
            int counter = 0;
            bool jobsFinished = false;
            try
            {
                BP_Inbox_ActionPaletteUtilities.InvokeActionPaletteItem(folderName);
                while (counter <= 60 && !jobsFinished)
                {
                    Thread.Sleep(5 * 1000);
                    BrowserUtilities.RefreshPage();
                    jobsFinished = AreJobsFinished(subjectList);
                    ++counter;
                }
            }
            catch (Exception e)
            {

            }
            return jobsFinished;
        }
        public static bool CheckInbox_NormalizationSubject_FromTop(String folderName, List<String> subjectList)
        {
            int counter = 0;
            bool jobsFinished = false;
            try
            {
                BP_Inbox_ActionPaletteUtilities.InvokeActionPaletteItem(folderName);
                while (counter <= 60 && !jobsFinished)
                {
                    Thread.Sleep(5 * 1000);
                    BrowserUtilities.RefreshPage();
                    jobsFinished = AreNormalizationJobsFinished(subjectList);
                    ++counter;
                }
            }
            catch (Exception e)
            {

            }
            return jobsFinished;
        }
        static bool AreJobsFinished(List<String> subjectList)
        {
            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(Pages.DataLabs.Inbox.DL_InboxPage.InboxTable);
                if (rows.Count > subjectList.Count)
                {
                    int i = 1;
                    foreach (String subjectText in subjectList)
                    {
                        IControl c = WebTableUtilities.GetElement(rows[i], subjectText, 3, TableColumnContentType.Link_Partial);
                        if (Control_PropertyUtilities.IsControlNull(c))
                        {
                            return false;
                        }
                        ++i;
                    }
                    return true;
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }
        static bool AreNormalizationJobsFinished(List<String> subjectList)
        {
            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(Pages.DataLabs.Inbox.DL_InboxPage.InboxTable);
                if (rows.Count > subjectList.Count)
                {
                    int i = 1;
                    foreach (String subjectText in subjectList)
                    {
                        IControl c = WebTableUtilities.GetElement(rows[i], subjectText, 3, TableColumnContentType.Span);
                        if (Control_PropertyUtilities.IsControlNull(c))
                        {
                            return false;
                        }
                        ++i;
                    }
                    return true;
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }
    }
}
