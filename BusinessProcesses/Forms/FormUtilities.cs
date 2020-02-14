using Framework.Actions;
using Pages.Designer;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.Forms
{
   public class FormUtilities
    {
        public static bool SetFormName(String formName)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DS_Forms.FormName, formName, String.Empty);
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetFormlabel(String formLabel)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DS_Forms.Formlabel, formLabel, String.Empty);
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool FormSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.FormSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool QuestionSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.QuestionSaveButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool QuestionSaveButtonInTable()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.QuestionSaveButtonInTable, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool AddQuestionButtonInTableQuestion(String TableName)
        {
            try
            {
                return Control_ActionUtilities.Click(DS_Forms.AddQuestionButtonInTable(TableName), "Unable to click on the link add question");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetQuestionData(string Question)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DS_Forms.Question, Question, "NotabletoettheQuestionData");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            
        }

        public static bool SetQuestionDataInTableQuestion(String TableQuestion)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DS_Forms.AddQuestionTextBoxInTable, TableQuestion, String.Empty);
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            
        }

        public static bool SetHeaderDataInQuestion(String HeaderName)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DS_Forms.AddHeaderInQuestion() , HeaderName, "Unabe to assign header");
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            
        }

        public static bool ClickAutoBuildCheckBox()
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(DS_Forms.AutoBuildCheckBox(), "Unable to check the autobuild checkbox");
                    }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }

        }

        public static bool SwitchTOCreateFormFrame(String FrameName)
        {
            try
            {
                return Utilities.BrowserUtilities.SwitchToFrameUsingFrameName(FrameName);
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }

        }

        public static bool SwitchToDefaultContent()
        {
            try
            {
                return Utilities.BrowserUtilities.SwitchToDefaultContent();
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }

        }



    }
}
