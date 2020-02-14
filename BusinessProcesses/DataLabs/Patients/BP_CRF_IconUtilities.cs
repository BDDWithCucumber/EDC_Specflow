using Framework.Actions;
using Interfaces;
using Pages.DataLabs;
using Pages.DataLabs.Patients;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_CRF_IconUtilities
    {
        public static bool InvokeIcon_FaltQuestion(String questionPrompt, String iconName,string flagType=null)
        {
            try
            {
                IControl icon = DL_CRF_Question_Icon.GetIcon_FlatQuestion(questionPrompt, iconName, flagType);
                return Control_ActionUtilities.Click(icon, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsIconAvailable_FlatQuestion(String questionPrompt, String iconName, string flagType = null)
        {
            try
            {
                IControl icon = DL_CRF_Question_Icon.GetIcon_FlatQuestion(questionPrompt, iconName, flagType);
                return !Control_PropertyUtilities.IsControlNull(icon);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool InvokeIcon_TableQuestion(String tableName, String questionPrompt, String iconName,string flagType=null)
        {
            try
            {
                return Control_ActionUtilities.Click(DL_CRF_Question_Icon.GetIcon_TableQuestion(tableName, questionPrompt, iconName, flagType), String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsIconAvailable_TableQuestion(String tableName, String questionPrompt, String iconName, string flagType=null)
        {
            try
            {
                IControl icon = DL_CRF_Question_Icon.GetIcon_TableQuestion(tableName, questionPrompt, iconName, flagType);
                return !Control_PropertyUtilities.IsControlNull(icon);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClearItem(String tableName, String questionPrompt)
        {
            try
            {
                IControl icon = DL_CRF_Question_Icon.GetIcon_TableQuestion(tableName, questionPrompt, "arrow6_dn.png");
                if (Control_ActionUtilities.Click(icon, String.Empty))
                {
                    return Control_ActionUtilities.Click(DL_CRFPage.GetClearItemElement, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClearItemFlatQuestion(string questionPrompt)
        {
            try
            {
                IControl icon = DL_CRF_Question_Icon.GetIcon_FlatQuestion(questionPrompt, "arrow6_dn.png");
                if (Control_ActionUtilities.Click(icon, "Unable to Select down arrow on question : " + questionPrompt))
                {
                    return Control_ActionUtilities.Click(DL_CRFPage.GetClearItemElement, "Unable to get Clear Item link for question prompt : " + questionPrompt);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool InvokeAddComment(String tableName, String questionPrompt)
        {
            try
            {
                IControl icon = DL_CRF_Question_Icon.GetIcon_TableQuestion(tableName, questionPrompt, "arrow6_dn.png");
                if (Control_ActionUtilities.Click(icon, String.Empty))
                {
                    return Control_ActionUtilities.Click(DL_CRFPage.GetAddCommentElement, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool InvokeTableHistory(String tableName)
        {
            try
            {
                IControl tableHistoryIcon = DL_CRF_QuestionBase.GetTableHistoryIcon(tableName);
                if (!Control_PropertyUtilities.IsControlNull(tableHistoryIcon))
                {
                    return Control_ActionUtilities.Click(tableHistoryIcon, "Unable to invoke table history icon for table " + tableName.ToUpper());
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool IconVisualIndicator(string TabelName,string questionPrompt)
        {
            try
            {
                if (!Control_PropertyUtilities.IsControlNull(DL_CRFPage.GetVisualIndicatorImage(TabelName,questionPrompt)))
                {
                    return true;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool IconLowVisualIndicator(string TabelName, string questionPrompt)
        {
            try
            {
                if (!Control_PropertyUtilities.IsControlNull(DL_CRFPage.GetLowVisualIndicatorImage(TabelName, questionPrompt)))
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
        public static bool NoVisualIndicatorIcon(string TabelName, string questionPrompt)
        {
            try
            {
                bool LowIndicator = Control_PropertyUtilities.IsControlNull(DL_CRFPage.GetLowVisualIndicatorImage(TabelName, questionPrompt));
                bool HighIndicator = Control_PropertyUtilities.IsControlNull(DL_CRFPage.GetVisualIndicatorImage(TabelName, questionPrompt));
                if (!(LowIndicator || HighIndicator))
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
    }
}