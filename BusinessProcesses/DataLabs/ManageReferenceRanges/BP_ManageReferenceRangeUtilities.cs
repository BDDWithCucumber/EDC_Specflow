using System;
using Framework.Actions;
using Pages.DataLabs.ManageReferenceRanges;
using Reports.DebugLog;
using System.Reflection;
using Interfaces;
using Utilities;
using Pages.DataLabs.Data;
using System.Collections.Generic;
using Framework;

namespace BusinessProcesses.DataLabs.ManageReferenceRanges
{
    public class BP_ManageReferenceRangeUtilities
    {    
        
        public static bool EditMode()
        {
            try
            {
                return Control_PropertyUtilities.IsEnabled(DL_Lab_MRR_Table.AddNewRecord) &&
                       Control_PropertyUtilities.IsEnabled(DL_Lab_MRR_Table.DeleteButton); 
                       
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        
        public static bool ViewMode()
        {
            try
            {
                return !Control_PropertyUtilities.IsControlNull(DL_Lab_MRR_Table.AddNewRecord)&&
                       !Control_PropertyUtilities.IsControlNull(DL_Lab_MRR_Table.DeleteButton);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
        public static bool ActionIconsInEditMode(string action)
        {
            try
            {
                IControl actionsCell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 13);
                IControl icon = DL_Lab_MRR_Table.GetActionIcon(actionsCell, action);
                if (action.Equals("Edit") || action.Equals("Copy") || action.Equals("Delete"))
                {
                    return Control_PropertyUtilities.IsEnabled(icon);
                }
                else if (action.Equals("History"))
                {
                    return Control_PropertyUtilities.IsEnabled(icon);
                }

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool ActionIconsInViewMode(string action)
        {
            try
            {
                IControl actionsCell = WebTableUtilities.GetCell(DL_Lab_MRR_Table.GetFirstRow, 13);
                IControl icon = DL_Lab_MRR_Table.GetActionIcon(actionsCell, action);
                if (action.Equals("Edit") || action.Equals("Copy") || action.Equals("Delete"))
                {
                    return Control_PropertyUtilities.IsControlNull(icon);
                }
                else if(action.Equals("History"))
                {
                    return Control_PropertyUtilities.IsEnabled(icon);
                }

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }

        public static bool VerifyText(String Message)
        {
            try
            {
                IControl mrrMessage = DL_Lab_MRR_Table.MRR_Message;
                String MRR_Message = Control_PropertyUtilities.GetText(mrrMessage);
                return Message.Equals(MRR_Message, StringComparison.InvariantCultureIgnoreCase);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }        
       
    }
}
