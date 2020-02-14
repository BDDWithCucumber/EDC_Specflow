using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Pager;
using System;

namespace BusinessProcesses.DataLabs.Pager
{
    public class BP_CRF_DCF_PagerUtilites
    {
        public static bool NavigateToFirstPage()
        {
            return ClickPageNavigationButton(DL_CRF_DCF_Pagination.FirstPageButton);
        }
        public static bool NavigateToPreviousPage()
        {
            return ClickPageNavigationButton(DL_CRF_DCF_Pagination.PreviousPageButton);
        }
        public static bool NavigateToNextPage()
        {
            return ClickPageNavigationButton(DL_CRF_DCF_Pagination.NextPageButton);
        }
        public static bool NavigateToLastPage()
        {
            return ClickPageNavigationButton(DL_CRF_DCF_Pagination.LastPageButton);
        }

        static bool ClickPageNavigationButton(IControl c)
        {
            bool found = true;
            String cssValue = Control_PropertyUtilities.GetAttributeValue(c, "class", out found);
            if (!found)
            {
                return Control_ActionUtilities.Click(c, String.Empty);
            }
            if (found && !cssValue.Contains("disabled"))
            {
                return Control_ActionUtilities.Click(c, String.Empty);
            }
            return false;
        }
    }
}
