using BusinessProcesses.DataLabs.Pager;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.ManageReferenceRanges;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.ManageReferenceRanges
{
    public class BP_MrrCreationUtilities
    {
        public static bool OpenLabTest(String labTestName)
        {
            IControl labTestLink = GetLabTestLink(labTestName);
            if (labTestLink != null)
            {
                return Control_ActionUtilities.Click(labTestLink, String.Empty);
            }
            return false;
        }

        public static IControl GetLabTestLink(String labTestName)
        {
            IControl labTestRow = GetLabTestRow(labTestName);
            if (labTestRow != null)
            {
                return WebTableUtilities.GetElement(labTestRow, labTestName, 0, TableColumnContentType.Link);
            }
            return null;
        }

        public static IControl GetLabTestRow(String labTestName)
        {
            ReadOnlyCollection<IControl> rows = null;
            if (WebTableUtilities.GetRowCount(DL_Lab_ManageReferenceRanges.LabTestsTable, out rows) > 0)
            {
                return FindLabTestRow(labTestName);
            }
            return null;
        }

        static IControl FindLabTestRow(String labTestName)
        {
            BP_PagerUtilities.NavigateToFirstPage(DL_Lab_ManageReferenceRanges.Pager);
            do
            {
                IControl labRow = FindRow(labTestName);
                if (labRow != null)
                {
                    return labRow;
                }
            }
            while (BP_PagerUtilities.NavigateToNextPage(DL_Lab_ManageReferenceRanges.Pager));

            return null;
        }

        static IControl FindRow(String labTestName)
        {
            WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, labTestName, TableColumnContentType.Link));
            IControl labTestRow = WebTableUtilities.Table_FindRow(DL_Lab_ManageReferenceRanges.LabTestsTable, searchList);
            if (labTestRow != null)
            {
                return labTestRow;
            }
            return null;
        }

        //public static void SetLabData(IControl mrrTable, MRRData mrr)
        //{
        //    SetLabFieldData_Text(mrrTable, "StartDate", mrr.StartDate);
        //    SetLabFieldData_Text(mrrTable, "EndDate: *", mrr.EndDate);
        //    SetLabFieldData_Text(mrrTable, "Gender: *", mrr.Gender);
        //    SetLabFieldData_Text(mrrTable, "FromAge:", mrr.FromAge);
        //    SetLabFieldData_Text(mrrTable, "FromAgeDropdown:", mrr.FromAgeDropdown);
        //    SetLabFieldData_Text(mrrTable, "ToAge:", mrr.ToAge);
        //    SetLabFieldData_Text(mrrTable, "ToAgeDropdown:", mrr.ToAgeDropdown);
        //    SetLabFieldData_Text(mrrTable, "NormalRangeLow", mrr.NormalRangeLow);
        //    SetLabFieldData_Text(mrrTable, "NormalRangeHigh", mrr.NormalRangeHigh);
        //    SetLabFieldData_Text(mrrTable, "CriticalRangeLow", mrr.CriticalRangeLow);
        //    SetLabFieldData_Dropdown(mrrTable, "CriticalRangeHigh", mrr.CriticalRangeHigh);
        //    SetLabFieldData_Text(mrrTable, "Unit", mrr.Unit);
        //}

        //static bool SetLabFieldData_Text(IControl labTable, String searchText, String valueToSet)
        //{
        //    if (valueToSet != null)
        //    {
        //        IControl row = WebTableUtilities.Table_FindRow(labTable, GetSearchItemList(searchText));
        //        IControl textbox = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Textbox);
        //        return Control_ActionUtilities.Textbox_SetText(textbox, valueToSet, String.Empty);
        //    }
        //    return false;
        //}

        //static bool SetLabFieldData_Dropdown(IControl labTable, String searchText, String valueToSet)
        //{
        //    if (valueToSet != null)
        //    {
        //        IControl row = WebTableUtilities.Table_FindRow(labTable, GetSearchItemList(searchText));
        //        IControl dropdown = WebTableUtilities.GetElement(row, String.Empty, 1, TableColumnContentType.Dropdown);
        //        return Control_ActionUtilities.Dropdown_SelectItem(dropdown, valueToSet, String.Empty);
        //    }
        //    return false;
        //}


    }
}
