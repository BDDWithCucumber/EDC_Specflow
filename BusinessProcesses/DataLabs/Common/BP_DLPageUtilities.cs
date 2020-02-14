using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Common;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Common
{
    public class BP_DLPageUtilities
    {
        public static bool IsCopyrithTextExists(String copyrightText)
        {
            try
            {
                IControl copyrightTextSpan = DatalabsPageFooter.DL_CopyRightSpan;
                String originalText = Control_PropertyUtilities.GetText(copyrightTextSpan);
                return originalText.Contains(copyrightText);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyServerTime(String serverTime)
        {
            try
            {
                IControl serverTimeLabel = DatalabsPageFooter.ServerTime;
                String originalText = Control_PropertyUtilities.GetText(serverTimeLabel);
                return originalText.Contains(serverTime);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifySuccessMessageOnPage(string SuccessMsgToVerify)
        {
            try
            {
                IControl MsgObj = DL_CommonObjects.SuccessMessage(SuccessMsgToVerify);
                if(!Control_PropertyUtilities.IsControlNull(MsgObj))
                {
                    string MsgText = Control_PropertyUtilities.GetText(MsgObj);
                    return SuccessMsgToVerify.Equals(MsgText.Trim());
                }
                else
                {
                    return false;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
    }
}
