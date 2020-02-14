using Framework.Actions;
using Interfaces;
using Pages.DataLabs;
using Pages.DataLabs.Pager;
using System;

namespace BusinessProcesses.DataLabs.Pager
{
    public class BP_PagerUtilities1
    {
        public static bool NavigateToFirstPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Pagination1.GetFirstPageIcon(pager));
        }
        public static bool NavigateToPreviousPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Pagination1.GetPreviousPageIcon(pager));
        }
        public static bool NavigateToNextPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Pagination1.GetNextPageIcon(pager));
        }
        public static bool NavigateToLastPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Pagination1.GetLastPageIcon(pager));
        }

        static bool ClickPageNavigationButton(IControl c)
        {
            bool found = true;
            String cssValue = Control_PropertyUtilities.GetAttributeValue(c, "disabled", out found);
            if (!found)
            {
                return Control_ActionUtilities.Click(c, String.Empty);
            }
            if (found && !cssValue.Equals("disabled", StringComparison.InvariantCultureIgnoreCase))
            {
                return Control_ActionUtilities.Click(c, String.Empty);
            }
            return false;
        }
    }
}