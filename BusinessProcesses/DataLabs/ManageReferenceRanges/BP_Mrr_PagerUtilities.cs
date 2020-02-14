using Framework.Actions;
using Interfaces;
using Pages.DataLabs.ManageReferenceRanges;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.ManageReferenceRanges
{
    public class BP_Mrr_PagerUtilities
    {
        internal static bool NavigateToFirstPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Lab_Mrr_Table_Pagination.GetFirstPageIcon(pager));
        }
        internal static bool NavigateToPreviousPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Lab_Mrr_Table_Pagination.GetPreviousPageIcon(pager));
        }
        internal static bool NavigateToNextPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Lab_Mrr_Table_Pagination.GetNextPageIcon(pager));
        }
        internal static bool NavigateToLastPage(IControl pager)
        {
            return ClickPageNavigationButton(DL_Lab_Mrr_Table_Pagination.GetLastPageIcon(pager));
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
