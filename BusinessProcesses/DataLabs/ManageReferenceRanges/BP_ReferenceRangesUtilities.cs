using BusinessProcesses.DataLabs.Labs;
using BusinessProcesses.DataLabs.ManageReferenceRanges;
using Common;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.DataLabs.Common;
using Pages.DataLabs.Data;
using Pages.DataLabs.ManageReferenceRanges;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.DataLabs.ManageReferenceRanges
{
    public class BP_ReferenceRangesUtilities
    {
        public static bool ClickOnAddButton()
        {
            try
            {
                return Control_ActionUtilities.Click(ReferenceRangesPage.AddnewrecordButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickOnCancelButton()
        {
            try
            {
                return Control_ActionUtilities.Click(ReferenceRangesPage.AddnewrecordButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyCancelButtonIcon()
        {

            try
            {
                if (ReferenceRangesPage.CancelButton.WebElement.GetCssValue("color").Equals("rgba(255, 0, 0, 1)")
                                && ReferenceRangesPage.CancelButton.WebElement.GetCssValue("content").Equals("normal"))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickOnLabTestLink()
        {
            try
            {
                return Control_ActionUtilities.Click(ReferenceRangesPage.LabTestLink, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickOnSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(ReferenceRangesPage.SaveButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool GetFirstRowFromTableAndClickOnAction(string action)
        {
            try
            {
                IControl actionsCell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 13);
                IControl icon = BP_ReferenceRangesUtilities.GetActionIcon(actionsCell, action);
                return Control_ActionUtilities.Click(icon, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool GetFirstRowFromTableAndClickOnActionandVerifyError(string action, string errormessage)
        {
            try
            {
                IControl actionsCell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 13);
                IControl icon = BP_ReferenceRangesUtilities.GetActionIcon(actionsCell, action);
                Control_ActionUtilities.Click(icon, String.Empty);
                 Control_ActionUtilities.Click(ReferenceRangesPage.SaveButton, String.Empty);
                IControl MsgObj = ReferenceRangesPage.ErrorMessage(errormessage);
                if (!Control_PropertyUtilities.IsControlNull(MsgObj))
                {
                    string MsgText = Control_PropertyUtilities.GetText(MsgObj);
                    return errormessage.Equals(MsgText.Trim());
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool GetFirstRowFromTableAndClickOnSave(string errormessage)
        {
            try
            {
                //IControl actionsCell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 13);
                //IControl icon = BP_ReferenceRangesUtilities.GetActionIcon(actionsCell, action);
                //Control_ActionUtilities.Click(icon, String.Empty);
                Control_ActionUtilities.Click(ReferenceRangesPage.SaveButton, String.Empty);
                IControl MsgObj = ReferenceRangesPage.ErrorMessage(errormessage);
                if (!Control_PropertyUtilities.IsControlNull(MsgObj))
                {
                    string MsgText = Control_PropertyUtilities.GetText(MsgObj);
                    return errormessage.Equals(MsgText.Trim());
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }
        public static bool GetIConFromRowTableByRRIDandClickAction(string action, string rrID)
        {
            try
            {
                IControl actionsCell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetRowByReferenceRangeID(rrID), 13);
                IControl icon = BP_ReferenceRangesUtilities.GetActionIcon(actionsCell, action);
                return Control_ActionUtilities.Click(icon, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool GetFirstRowFromTableAndClickOnIcon(string action)
        {
            try
            {
                IControl actionsCell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 13);
                IControl icon = BP_ReferenceRangesUtilities.GetActionIcon(actionsCell, action);
                return Control_ActionUtilities.Click(icon, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        //public static IControl GetIcon(IControl actionsCell, String actionName)
        //{
        //    try
        //    {
        //        ReadOnlyCollection<IControl> actionIconList = SyncUtilities.FindVisibleElements_Parent(actionsCell.WebElement, By.TagName("a"));

        //        // IControl historyIcon = SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.TagName("img"));
        //        if (actionName.Equals("Edit") && actionIconList.Count > 0)
        //        {
        //            return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector(" a.k-button.k-button-icontext.k-grid-edit"));
        //        }
        //        else if (actionName.Equals("Copy") && actionIconList.Count > 0)
        //        {
        //            return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector("a.k-button.k-button-icontext.k-grid-copy"));
        //        }
        //        else if (actionName.Equals("Delete") && actionIconList.Count > 0)
        //        {
        //            return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector(" a.k-button.k-button-icontext.k-grid-deleterow"));
        //        }
        //        else if (actionName.Equals("History"))
        //        {
        //            return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.TagName("img"));
        //        }
        //        else if (actionName.Equals("Cancel") && actionIconList.Count > 0)
        //        {
        //            return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector("a.k-button.k-button-icontext.k-grid-cancel"));
        //        }
        //        else if (actionName.Equals("Save") && actionIconList.Count > 0)
        //        {
        //            return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector("a.k-button.k-button-icontext.k-primary.k-grid-update"));
        //        }
        //        else if (actionName.Equals("SaveAdd") && actionIconList.Count > 0)
        //        {
        //            return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector("a.k-button.k-grid-update.k-button-icontext.k-primary.saveadd"));
        //        }
        //    }
        //    catch (Exception e)
        //    {

        //    }
        //    return null;
        //}

        public static IControl GetActionIcon(IControl actionsCell, String actionName)
        {
            try
            {
                ReadOnlyCollection<IControl> actionIconList = SyncUtilities.FindVisibleElements_Parent(actionsCell.WebElement, By.TagName("a"));

                // IControl historyIcon = SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.TagName("img"));
                if (actionName.Equals("Edit") && actionIconList.Count > 0)
                {
                    return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector("a.k-button.k-button-icontext.k-grid-edit"));
                }
                else if (actionName.Equals("Copy") && actionIconList.Count > 0)
                {
                    return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector("a.k-button.k-button-icontext.k-grid-copy"));
                }
                else if (actionName.Equals("Delete") && actionIconList.Count > 0)
                {
                    return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector(" a.k-button.k-button-icontext.k-grid-deleterow"));
                }
                else if (actionName.Equals("History"))
                {
                    return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.TagName("img"));
                }
                else if (actionName.Equals("Cancel") && actionIconList.Count > 0)
                {
                    return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector("a.k-button.k-button-icontext.k-grid-cancel"));
                }
                else if (actionName.Equals("Save") && actionIconList.Count > 0)
                {
                    return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector("a.k-button.k-button-icontext.k-primary.save"));
                }
                else if (actionName.Equals("SaveAdd") && actionIconList.Count > 0)
                {
                    return SyncUtilities.FindVisibleElement_Parent(actionsCell.WebElement, By.CssSelector("a.k-button.k-grid-update.k-button-icontext.k-primary.saveadd"));
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static bool RowDataChange(List<ReferenceRangesData> rowdata)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                    BP_ReferenceRangesUtilities.EndDateSelection(rowdataValues.EndDate);
                    BP_ReferenceRangesUtilities.GenderDropdown(rowdataValues.Gender);
                    BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                    BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                    BP_ReferenceRangesUtilities.FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                    BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                    BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                    BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                    BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                    BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                    BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                    BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                    BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                    BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                    BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool RowDataChangeBySelectedRow(List<ReferenceRangesData> rowdata)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    if (rowdataValues.StartDate != null)
                    {
                        StartDateSelection(rowdataValues.StartDate);
                    }
                    if (rowdataValues.EndDate != null)
                    {
                        EndDateSelection(rowdataValues.EndDate);
                    }
                    if (rowdataValues.Gender != null)
                    {
                        GenderDropdown(rowdataValues.Gender);
                    }
                    if (rowdataValues.FromAgeSelect != null)
                    {
                        FromAgeDropDown(rowdataValues.FromAgeSelect);
                    }
                    if (rowdataValues.FromAgeSet != null)
                    {
                        FromAgeSet(rowdataValues.FromAgeSet);
                    }
                    if (rowdataValues.FromAgeRange != null)
                    {
                        FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                    }
                    if (rowdataValues.ToAgeSelect != null)
                    {
                        ToAgeDropDown(rowdataValues.ToAgeSelect);
                    }
                    if (rowdataValues.ToAgeSet != null)
                    {
                        ToAgeSet(rowdataValues.ToAgeSet);
                    }
                    if (rowdataValues.ToAgeRange != null)
                    {
                        ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                    }
                    if (rowdataValues.NormalRangeLowSelect != null)
                    {
                        NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                    }
                    if (rowdataValues.NormalRangeLowSet != null)
                    {
                        NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                    }
                    if (rowdataValues.NormalRangeHighSelect != null)
                    {
                        NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                    }
                    if (rowdataValues.NormalRangeHighSet != null)
                    {
                        NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                    }
                    if (rowdataValues.CriticalRangeLowSelect != null)
                    {
                        CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                    }
                    if (rowdataValues.CriticalRangeLowSet != null)
                    {
                        CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                    }
                    if (rowdataValues.CriticalRangeHighSelect != null)
                    {
                        CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                    }
                    if (rowdataValues.CriticalRangeHighSet != null)
                    {
                        CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                    }
                    if (rowdataValues.Unit != null)
                    {
                        UnitDropDown(rowdataValues.Unit);
                    }
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool RowDataChangeForEdit(List<ReferenceRangesData> rowdata, String operation)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    if (BP_ReferenceRangesUtilities.GetFirstRowFromTableAndClickOnAction(operation))
                    {
                        BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                        BP_ReferenceRangesUtilities.EndDateSelection(rowdataValues.EndDate);
                        BP_ReferenceRangesUtilities.GenderDropdown(rowdataValues.Gender);
                        BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                        BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                        BP_ReferenceRangesUtilities.FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                        BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                        BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                        BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                        BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                        BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                        BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                        BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                        BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                        BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                        BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                        BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                        BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                    }
                    else
                    {
                        return false;
                    }
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetRowDataForCreate(List<ReferenceRangesData> rowdata, String successmessage)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    Control_ActionUtilities.Click(ReferenceRangesPage.AddnewrecordButton, String.Empty);
                    BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                    BP_ReferenceRangesUtilities.EndDateSelection(rowdataValues.EndDate);
                    BP_ReferenceRangesUtilities.GenderDropdown(rowdataValues.Gender);
                    BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                    BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                    BP_ReferenceRangesUtilities.FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                    BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                    BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                    BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                    BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                    BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                    BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                    BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                    BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                    BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                    BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                    Control_ActionUtilities.MouseClick(ReferenceRangesPage.SaveButton, String.Empty);
                    IControl MsgObj = ReferenceRangesPage.SuccessMessage(successmessage);
                    if (!Control_PropertyUtilities.IsControlNull(MsgObj))
                    {
                        //string MsgText = Control_PropertyUtilities.GetText(MsgObj);
                        string MsgText = MsgObj.WebElement.GetAttribute("innerHTML");
                        successmessage.Equals(MsgText.Trim());
                    }
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetRowDataForCreateWithNA(List<ReferenceRangesData> rowdata, String successmessage)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    Control_ActionUtilities.Click(ReferenceRangesPage.AddnewrecordButton, String.Empty);
                    BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                    BP_ReferenceRangesUtilities.EndDateSelection(rowdataValues.EndDate);
                    BP_ReferenceRangesUtilities.GenderDropdown(rowdataValues.Gender);
                    BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                    BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                    BP_ReferenceRangesUtilities.FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                    BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                    BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                    BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                    BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                    BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                    BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                    BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                    BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                    BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                    BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                    if(rowdataValues.NA.Equals("Yes"))
                    {
                        BP_ReferenceRangesUtilities.CheckNotApplicableCheckbox();
                    }
                    else if(rowdataValues.NA.Equals("No"))
                    {
                        BP_ReferenceRangesUtilities.UncheckNotApplicableCheckbox();
                    }
                    
                    Control_ActionUtilities.MouseClick(ReferenceRangesPage.SaveButton, String.Empty);
                    IControl MsgObj = ReferenceRangesPage.SuccessMessage(successmessage);
                    if (!Control_PropertyUtilities.IsControlNull(MsgObj))
                    {
                        string MsgText = Control_PropertyUtilities.GetText(MsgObj);
                        successmessage.Equals(MsgText.Trim());
                    }
                    else
                    {
                        new DebugLogGenerator().WriteLog(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, "Save Message for Add Reference Range not found");
                        return false;
                    }
                    Thread.Sleep(3000);
                    rowdataValues.ReferenceRangeID = BP_ReferenceRangesUtilities.GetReferenceRangeID();
                    
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CompleteChkBox()
        {
           
            try
            {
                BP_Mrr_PagerUtilities.NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
                do
                {         
                   
                    return Control_ActionUtilities.CheckCheckbox(ReferenceRangesPage.ChkBoxSelection);
                }
                while (BP_Mrr_PagerUtilities.NavigateToLastPage(DL_Lab_MRR_Table.Pager));

            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool UnCheckCompleteChkBox()
        {

            try
            {
                BP_Mrr_PagerUtilities.NavigateToFirstPage(DL_Lab_MRR_Table.Pager);
                do
                {

                    return Control_ActionUtilities.UncheckCheckbox(ReferenceRangesPage.ChkBoxSelection);
                }
                while (BP_Mrr_PagerUtilities.NavigateToLastPage(DL_Lab_MRR_Table.Pager));

            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool SetRowDataForLabCreation(List<ReferenceRangesData> rowdata, String operation, String successmessage)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    if (BP_ReferenceRangesUtilities.GetFirstRowFromTableAndClickOnAction(operation))
                    {
                        BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                        BP_ReferenceRangesUtilities.EndDateSelection(rowdataValues.EndDate);
                        BP_ReferenceRangesUtilities.GenderDropdown(rowdataValues.Gender);
                        BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                        BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                        BP_ReferenceRangesUtilities.FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                        BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                        BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                        BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                        BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                        BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                        BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                        BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                        BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                        BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                        BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                        BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                        BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                        Control_ActionUtilities.MouseClick(ReferenceRangesPage.SaveButton, String.Empty);
                        IControl MsgObj = ReferenceRangesPage.SuccessMessage(successmessage);
                        if (!Control_PropertyUtilities.IsControlNull(MsgObj))
                        {
                            string MsgText = Control_PropertyUtilities.GetText(MsgObj);
                            successmessage.Equals(MsgText.Trim());
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetDuplicateorOverlapDataForCreate(List<ReferenceRangesData> rowdata, String errormessage)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    Control_ActionUtilities.Click(ReferenceRangesPage.AddnewrecordButton, String.Empty);
                    BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                    BP_ReferenceRangesUtilities.EndDateSelection(rowdataValues.EndDate);
                    BP_ReferenceRangesUtilities.GenderDropdown(rowdataValues.Gender);
                    BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                    BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                    BP_ReferenceRangesUtilities.FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                    BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                    BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                    BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                    BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                    BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                    BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                    BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                    BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                    BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                    BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                    Control_ActionUtilities.Click(ReferenceRangesPage.SaveButton, String.Empty);
                    IControl MsgObj = ReferenceRangesPage.ErrorMessage(errormessage);
                    if (!Control_PropertyUtilities.IsControlNull(MsgObj))
                    {
                        string MsgText = Control_PropertyUtilities.GetText(MsgObj);
                        return errormessage.Equals(MsgText.Trim());
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetInvalidDataForCreate(List<ReferenceRangesData> rowdata, String errormessage, String columnname)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    Control_ActionUtilities.Click(ReferenceRangesPage.AddnewrecordButton, String.Empty);
                    BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                    BP_ReferenceRangesUtilities.EndDateSelection(rowdataValues.EndDate);
                    BP_ReferenceRangesUtilities.GenderDropdown(rowdataValues.Gender);
                    BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                    BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                    BP_ReferenceRangesUtilities.FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                    BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                    BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                    BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                    BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                    BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                    BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                    BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                    BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                    BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                    BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                    Control_ActionUtilities.Click(ReferenceRangesPage.SaveButton, String.Empty);
                    IControl errorControl = ReferenceRangesPage.GetErrorControl(columnname);
                    String actualErrorMessage = Control_PropertyUtilities.GetText(errorControl);
                    if (errormessage.Equals(actualErrorMessage, StringComparison.InvariantCultureIgnoreCase))
                    {
                        IControl actionsCell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 13);
                        IControl icon = BP_ReferenceRangesUtilities.GetActionIcon(actionsCell, "Cancel");
                        Control_ActionUtilities.Click(icon, String.Empty);
                    }
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetInvalidDataForCreation(List<ReferenceRangesData> rowdata)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                    BP_ReferenceRangesUtilities.GenderDropdown(rowdataValues.Gender);
                    BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                    BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                    BP_ReferenceRangesUtilities.FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                    BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                    BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                    BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                    BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                    BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                    BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                    BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                    BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                    BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                    BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                    BP_ReferenceRangesUtilities.UncheckNotApplicableCheckbox();
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetValidDataForCreation(List<ReferenceRangesData> rowdata)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                    BP_ReferenceRangesUtilities.EndDateSelection(rowdataValues.EndDate);
                    BP_ReferenceRangesUtilities.GenderDropdown(rowdataValues.Gender);
                    BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                    BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                    BP_ReferenceRangesUtilities.FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                    BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                    BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                    BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                    BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                    BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                    BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                    BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                    BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                    BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                    BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        //public static bool SelectEntryCompleteChkBox()
        //{
        //    return Control_ActionUtilities.CheckCheckbox(ReferenceRangesPage.DeleteAllChkBox);
        //}

        public static bool SetDefaultDataForCreation(List<ReferenceRangesData> rowdata)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                    BP_ReferenceRangesUtilities.GenderDefaultData(rowdataValues.Gender);
                    BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                    BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                    BP_ReferenceRangesUtilities.FromAgeUnitDefaultData(rowdataValues.FromAgeRange);
                    BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                    BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                    BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                    //BP_ReferenceRangesUtilities.ToAgeUnitDefaultData(rowdataValues.ToAgeRange);
                    BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                    BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                    BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                    BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                    BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                    BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                    BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                    BP_ReferenceRangesUtilities.UncheckNotApplicableCheckbox();
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetInvalidDataForLabCreation(List<ReferenceRangesData> rowdata, String errormessage, String columnname)
        {
            try
            {
                foreach (ReferenceRangesData rowdataValues in rowdata)
                {
                    BP_ReferenceRangesUtilities.StartDateSelection(rowdataValues.StartDate);
                    BP_ReferenceRangesUtilities.EndDateSelection(rowdataValues.EndDate);
                    BP_ReferenceRangesUtilities.GenderDropdown(rowdataValues.Gender);
                    BP_ReferenceRangesUtilities.FromAgeDropDown(rowdataValues.FromAgeSelect);
                    BP_ReferenceRangesUtilities.FromAgeSet(rowdataValues.FromAgeSet);
                    BP_ReferenceRangesUtilities.FromAgeRangeDropDown(rowdataValues.FromAgeRange);
                    BP_ReferenceRangesUtilities.ToAgeDropDown(rowdataValues.ToAgeSelect);
                    BP_ReferenceRangesUtilities.ToAgeSet(rowdataValues.ToAgeSet);
                    BP_ReferenceRangesUtilities.ToAgeRangeDropDown(rowdataValues.ToAgeRange);
                    BP_ReferenceRangesUtilities.NormalRangeLowDropDown(rowdataValues.NormalRangeLowSelect);
                    BP_ReferenceRangesUtilities.NormalRangeLowSet(rowdataValues.NormalRangeLowSet);
                    BP_ReferenceRangesUtilities.NormalRangeHighDropDown(rowdataValues.NormalRangeHighSelect);
                    BP_ReferenceRangesUtilities.NormalRangeHighSet(rowdataValues.NormalRangeHighSet);
                    BP_ReferenceRangesUtilities.CriticalRangeLowDropDown(rowdataValues.CriticalRangeLowSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeLowSet(rowdataValues.CriticalRangeLowSet);
                    BP_ReferenceRangesUtilities.CriticalRangeHighDropDown(rowdataValues.CriticalRangeHighSelect);
                    BP_ReferenceRangesUtilities.CriticalRangeHighSet(rowdataValues.CriticalRangeHighSet);
                    BP_ReferenceRangesUtilities.UnitDropDown(rowdataValues.Unit);
                    BP_ReferenceRangesUtilities.CheckNotApplicableCheckbox();
                    Control_ActionUtilities.Click(ReferenceRangesPage.SaveButton, String.Empty);
                    IControl errorControl = ReferenceRangesPage.GetErrorControl(columnname);
                    String actualErrorMessage = Control_PropertyUtilities.GetText(errorControl);
                    return errormessage.Equals(actualErrorMessage, StringComparison.InvariantCultureIgnoreCase);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool StartDateSelection(String startdate)
        {
            try
            {
                IControl startdatecell = WebTableUtilities.GetElement(ReferenceRangesPage.GetEditableRow(), String.Empty, 2, TableColumnContentType.Textbox);
                return Control_ActionUtilities.Textbox_SetText(startdatecell, startdate, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool EndDateSelection(String enddate, IControl row = null)
        {
            try
            {
                IControl startdatecell;
                if (Control_PropertyUtilities.IsControlNull(row))
                {
                    startdatecell = WebTableUtilities.GetElement(ReferenceRangesPage.GetEditableRow(), String.Empty, 3, TableColumnContentType.Textbox);
                }
                else
                {
                    startdatecell = WebTableUtilities.GetElement(row, String.Empty, 3, TableColumnContentType.Textbox);

                }
                return Control_ActionUtilities.Textbox_SetText(startdatecell, enddate, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool GenderDropdown(String gender)
        {
            try
            {
                IControl gendercell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 4);
                IControl gendercellcontrol = SyncUtilities.FindVisibleElement_Parent(gendercell.WebElement, By.CssSelector(".k-input"));
                Control_ActionUtilities.MouseClick(gendercell, "Not able to click on GenderDropdown");
                return ClickMRRDropdownItem(gender);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool GenderDefaultData(String gender)
        {
            try
            {
                IControl gendercell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 4);
                IControl gendercellcontrol = SyncUtilities.FindVisibleElement_Parent(gendercell.WebElement, By.CssSelector(".k-input"));
                Control_ActionUtilities.MouseClick(gendercell, "Not able to click on GenderDropdown");
                return ClickMRRDropdownItemToSelectTheDefaultValue(gender);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool FromAgeUnitDefaultData(String fromagerange)
        {
            try
            {
                IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 5);
                IControl fromAgeSecondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.XPath(".//span[2]/span/span[1]"));
                Control_ActionUtilities.MouseClick(fromAgeSecondControl, "Not able to click on FromAgeRangeDropDown");
                return ClickMRRDropdownItemToSelectTheDefaultValue(fromagerange);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ToAgeUnitDefaultData(String toagerange)
        {
            try
            {
                IControl toAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 6);
                IControl toAgeSecondControl = SyncUtilities.FindVisibleElement_Parent(toAgecell.WebElement, By.CssSelector(".//span[2]/span/span[1]"));
                Control_ActionUtilities.Click(toAgeSecondControl, "Not able to click on ToAgeRangeDropDown");
                return ClickMRRDropdownItemToSelectTheDefaultValue(toagerange);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool GetReferenceId()
        {
            try
            {

                IControl rferenceIdcell = WebTableUtilities.GetCell(ReferenceRangesPage.GetFirstRow, 1);
                if (Control_PropertyUtilities.IsControlVisible(rferenceIdcell))
                {
                    String val = Control_PropertyUtilities.GetText(rferenceIdcell);
                    if (!String.IsNullOrEmpty(val))
                    {
                        return true;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool GetReferenceID()
        {
            try
            {
                IControl referenceidcell = WebTableUtilities.GetCell(ReferenceRangesPage.GetFirstRow, 1);
                ReadOnlyCollection<IControl> cList = SyncUtilities.FindElements_Parent(referenceidcell.WebElement, By.XPath(".//*"));
                //ReadOnlyCollection<IControl> cList1 = SyncUtilities.FindElements_Parent(referenceidcell.WebElement, By.CssSelector("*"));
                if(cList.Count == 0)
                {
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static string GetReferenceRangeID()
        {
            try
            {
                IControl referenceidcell = WebTableUtilities.GetCell(ReferenceRangesPage.GetFirstRow, 1);
                string ReferenceIDVal = referenceidcell.WebElement.Text.Trim();
                return ReferenceIDVal;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }
        public static bool VerifySuccessMessageOnPage(string SuccessMsgToVerify)
        {
            try
            {
                IControl MsgObj = ReferenceRangesPage.SuccessMessage(SuccessMsgToVerify);
                if (!Control_PropertyUtilities.IsControlNull(MsgObj))
                {
                    string MsgText = Control_PropertyUtilities.GetText(MsgObj);
                    return SuccessMsgToVerify.Equals(MsgText.Trim());
                }
                else
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifyErrorMessageOnPage(string ErrorMsgToVerify)
        {
            try
            {
                IControl MsgObj = ReferenceRangesPage.ErrorMessage(ErrorMsgToVerify);
                if (!Control_PropertyUtilities.IsControlNull(MsgObj))
                {
                    string MsgText = Control_PropertyUtilities.GetText(MsgObj);
                    return ErrorMsgToVerify.Equals(MsgText.Trim());
                }
                else
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifyErrorMessageOnDuplicateRecordSave(string ErrorMsgToVerify)
        {
            try
            {
                IControl MsgObj = ReferenceRangesPage.ErrorMessageOnDuplicateRecordSave(ErrorMsgToVerify);
                if (!Control_PropertyUtilities.IsControlNull(MsgObj))
                {
                    string MsgText = Control_PropertyUtilities.GetText(MsgObj);
                    return ErrorMsgToVerify.Equals(MsgText.Trim());
                }
                else
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool FromAgeDropDown(String fromage)
        {
            try
            {
                IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 5);
                IControl fromAgeFirstControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.CssSelector("span:first-child"));
                Control_ActionUtilities.MouseClick(fromAgeFirstControl, "Not able to click on FromAgeDropDown");
                return ClickMRRDropdownItem(fromage);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ReferenceRangeLabTestSearch(String testname)
        {
            try
            {
                return ClickRRDropdownItem(testname);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static ReadOnlyCollection<IControl> GetDropdownItems()
        {
            try
            {
                String dropdonwItemsHostCSSSelector = "#leftpanel > ul";
                IControl host = SyncUtilities.FindVisibleElement(By.CssSelector(dropdonwItemsHostCSSSelector));
                if (!Control_PropertyUtilities.IsControlNull(host))
                {
                    return SyncUtilities.FindElements_Parent(host.WebElement, By.TagName("li"));
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return null;
        }

        public static bool FromAgeSet(String fromagesetdata)
        {
            try
            {
                IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 5);
                IControl secondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.CssSelector("input"));
                return Control_ActionUtilities.Textbox_SetText(secondControl, fromagesetdata, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool FromAgeRangeDropDown(String fromagerange)
        {
            try
            {
                IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 5);
                IControl fromAgeSecondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.XPath(".//span[2]/span/span[1]"));
                Control_ActionUtilities.MouseClick(fromAgeSecondControl, "Not able to click on FromAgeRangeDropDown");
                return ClickMRRDropdownItem(fromagerange);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool ClickMRRDropdownItem(String itemName)
        {
            try
            {
                ReadOnlyCollection<IControl> cList = DL_Lab_MRR_Table.GetDropdownItems();
                foreach (IControl c in cList)
                {
                    if (Control_PropertyUtilities.GetText(c).Equals(itemName, StringComparison.InvariantCultureIgnoreCase))
                    {                        
                        bool retVal = Control_ActionUtilities.Click(c, String.Empty);
                        return retVal;
                    }
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool ClickMRRDropdownItemToSelectTheDefaultValue(String itemName)
        {
            try
            {
                IControl cList = ReferenceRangesPage.SetDefaultItem();
                    if (Control_PropertyUtilities.GetText(cList).Equals(itemName, StringComparison.InvariantCultureIgnoreCase))
                    {
                        bool retVal = Control_ActionUtilities.Click(cList, String.Empty);
                        return retVal;
                    }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickRRDropdownItem(String itemName)
        {
            try
            {
                ReadOnlyCollection<IControl> cList = BP_ReferenceRangesUtilities.GetDropdownItems();
                foreach (IControl c in cList)
                {
                    if (Control_PropertyUtilities.GetText(c).Equals(itemName, StringComparison.InvariantCultureIgnoreCase))
                    {
                        IControl link = SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.TagName("a"));
                        return Control_ActionUtilities.Click(link, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ToAgeDropDown(String toage)
        {
            try
            {
                IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 6);
                IControl toAgeFirstControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.CssSelector("span:first-child"));
                Control_ActionUtilities.MouseClick(toAgeFirstControl, "Not able to click on ToAgeDropDown");
                return ClickMRRDropdownItem(toage);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ToAgeSet(String toagesetdata)
        {
            try
            {
                IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 6);
                IControl secondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.CssSelector("input"));
                return Control_ActionUtilities.Textbox_SetText(secondControl, toagesetdata, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ToAgeRangeDropDown(String toagerange)
        {
            try
            {
                IControl toAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 6);
                IControl toAgeSecondControl = SyncUtilities.FindVisibleElement_Parent(toAgecell.WebElement, By.XPath(".//span[2]/span/span[1]"));
                if (Control_ActionUtilities.Click(toAgeSecondControl, "Not able to click on ToAgeRangeDropDown"))
                {
                    new DebugLogGenerator().WriteLog(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, "ToAgeRange drop down is clicked successfully.");
                    return ClickMRRDropdownItem(toagerange);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        //public static bool FromAgeRangeDropDown1(String fromagerange)
        //{
        //    try
        //    {
        //        IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetFirstRow, 5);
        //        IControl fromAgeSecondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.XPath("//*[@id='gridReferenceRanges']//td[6]/span[2]/span/span[1]"));
        //        Control_ActionUtilities.MouseClick(fromAgeSecondControl, "Not able to click on FromAgeRangeDropDown");
        //        return ClickMRRDropdownItem(fromagerange);
        //    }
        //    catch (Exception e)
        //    {
        //        new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
        //    }
        //    return false;
        //}

        //public static bool ToAgeRangeDropDown1(String toagerange)
        //{
        //    try
        //    {
        //        IControl toAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetFirstRow, 6);
        //        IControl toAgeSecondControl = SyncUtilities.FindVisibleElement_Parent(toAgecell.WebElement, By.XPath("//*[@id='gridReferenceRanges']//td[7]/span[2]/span/span[1]"));
        //        if (Control_ActionUtilities.Click(toAgeSecondControl, "Not able to click on ToAgeRangeDropDown"))
        //        {
        //            new DebugLogGenerator().WriteLog(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, "ToAgeRange drop down is clicked successfully.");
        //            return ClickMRRDropdownItem(toagerange);
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
        //    }
        //    return false;
        //}

        public static bool NormalRangeLowDropDown(String normalrangelow)
        {
            try
            {
                IControl normalrangecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 7);
                IControl normalrangecellControl = SyncUtilities.FindVisibleElement_Parent(normalrangecell.WebElement, By.CssSelector("span:first-child"));
                Control_ActionUtilities.MouseClick(normalrangecellControl, "Not able to click on NormalRangeLowDropDown");
                return ClickMRRDropdownItem(normalrangelow);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool NormalRangeLowSet(String normalrangelowsetdata)
        {
            try
            {
                IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 7);
                IControl secondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.CssSelector("input"));
                return Control_ActionUtilities.Textbox_SetText(secondControl, normalrangelowsetdata, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool NormalRangeHighDropDown(String normalrangehigh)
        {
            try
            {
                IControl normalrangehighcell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 8);
                IControl normalrangehighcellControl = SyncUtilities.FindVisibleElement_Parent(normalrangehighcell.WebElement, By.CssSelector("span:first-child"));
                Control_ActionUtilities.MouseClick(normalrangehighcellControl, "Not able to click on NormalRangeHighDropDown");
                return ClickMRRDropdownItem(normalrangehigh);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool NormalRangeHighSet(String normalrangehighsetdata)
        {
            try
            {
                IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 8);
                IControl secondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.CssSelector("input"));
                return Control_ActionUtilities.Textbox_SetText(secondControl, normalrangehighsetdata, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CriticalRangeHighDropDown(String criticalrangehigh)
        {
            try
            {
                IControl criticalrangehighcell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 10);
                IControl normalrangecellControl = SyncUtilities.FindVisibleElement_Parent(criticalrangehighcell.WebElement, By.CssSelector("span:first-child"));
                Control_ActionUtilities.MouseClick(normalrangecellControl, "Not able to click on CriticalRangeHighDropDown");
                return ClickMRRDropdownItem(criticalrangehigh);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CriticalRangeHighSet(String criticalrangehighsetdata)
        {
            try
            {
                IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 10);
                IControl secondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.CssSelector("input"));
                return Control_ActionUtilities.Textbox_SetText(secondControl, criticalrangehighsetdata, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CriticalRangeLowDropDown(String criticalrangelow)
        {
            try
            {
                IControl criticalrangelowcell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 9);
                IControl normalrangelowcellControl = SyncUtilities.FindVisibleElement_Parent(criticalrangelowcell.WebElement, By.CssSelector("span:first-child"));
                Control_ActionUtilities.MouseClick(normalrangelowcellControl, "Not able to click on CriticalRangeLowDropDown");
                return ClickMRRDropdownItem(criticalrangelow);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CriticalRangeLowSet(String criticalrangelowsetdata)
        {
            try
            {
                IControl fromAgecell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 9);
                IControl secondControl = SyncUtilities.FindVisibleElement_Parent(fromAgecell.WebElement, By.CssSelector("input"));
                return Control_ActionUtilities.Textbox_SetText(secondControl, criticalrangelowsetdata, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool UnitDropDown(String unit)
        {
            try
            {
                IControl unitcell = WebTableUtilities.GetCell(ReferenceRangesPage.GetEditableRow(), 11);
                IControl unitcellcontrol = SyncUtilities.FindVisibleElement_Parent(unitcell.WebElement, By.CssSelector(".k-input"));
                Control_ActionUtilities.MouseClick(unitcellcontrol, "Not able to click on UnitDropDown");
                return ClickMRRDropdownItem(unit);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CheckNotApplicableCheckbox()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(ReferenceRangesPage.Checkbox_NotApplicable);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool UncheckNotApplicableCheckbox()
        {
            try
            {
                return Control_ActionUtilities.UncheckCheckbox(ReferenceRangesPage.Checkbox_NotApplicable);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyErrorMessage(String message, String columnName)
        {
            try
            {
                IControl errorControl = ReferenceRangesPage.GetErrorControl(columnName);
                bool isHidden = Control_PropertyUtilities.CompareCSSValue(errorControl, "display", "none");
                String actualErrorMessage = Control_PropertyUtilities.GetText(errorControl);
                return message.Equals(actualErrorMessage, StringComparison.InvariantCultureIgnoreCase) &&
                        !isHidden;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyReferenceRangeIds(List<ReferenceRangesData> rDataList, out List<string> FailedItems)
        {
            bool isExist = true;
            FailedItems = new List<string>();
            try
            {
                List<string> rrIDs = new List<string>();
                rrIDs = ReferenceRangesPage.GetReferenceRangesID();
                foreach(ReferenceRangesData rdata in rDataList)
                {
                    if (!rrIDs.Contains(rdata.ReferenceRangeID))
                    {
                        isExist = false;
                        FailedItems.Add(rdata.ReferenceRangeID);
                    }
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return isExist;
        }
    }
}
