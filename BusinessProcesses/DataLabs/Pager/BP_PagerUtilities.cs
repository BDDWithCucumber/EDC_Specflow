using Framework.Actions;
using Interfaces;
using Pages.DataLabs;
using Pages.DataLabs.Pager;
using System;

namespace BusinessProcesses.DataLabs.Pager
{
    public class BP_PagerUtilities
    {
        internal static bool NavigateToFirstPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Pagination.GetFirstPageIcon(pager));
        }
        internal static bool NavigateToPreviousPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Pagination.GetPreviousPageIcon(pager));
        }
        internal static bool NavigateToNextPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Pagination.GetNextPageIcon(pager));
        }
        internal static bool NavigateToLastPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Pagination.GetLastPageIcon(pager));
        }

        static bool ClickPageNavigationButton(IControl c)
        {
            bool found = false;
            String cssValue = Control_PropertyUtilities.GetAttributeValue(c, "class", out found);
            if (!cssValue.Contains("k-state-disabled"))
            {
                return Control_ActionUtilities.Click(c, String.Empty);
            }
            return false;
        }
    }
}
