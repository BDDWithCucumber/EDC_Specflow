using BusinessProcesses.Designer.ModalDialogs;
using Framework.Actions;
using Pages.Designer;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BusinessProcesses.Designer
{
    public class BP_DS_HomePageUtilities
    {
        public static bool ImportAStudy(String studyFileName)
        {
            try
            {
                DS_ImportStudyDialogUtilities.ClickChooseFileButton();
                BP_DS_ImportStudyUtilities.ImportStudy(studyFileName);
                return true;
            }
            
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
        public static string GetErrorMessage1inManageLabs()
        {

            return Control_PropertyUtilities.GetText(DS_HomePage.ErrorTableinManageLabs);
        }
        public static string GetErrorMessage2ManageLabs()
        {
            return Control_PropertyUtilities.GetText(DS_HomePage.ErrorManageLabs);
        }
        public static bool ClickLinkInDesignerHomePage(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(linkName), "Unable to find link " + linkName + " in Designer Home Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            
        }
        public static bool IsMapLabDictionaryDisplayed(String linkName)
        {
            try
            {
                return Control_PropertyUtilities.IsControlVisible(DS_HomePage.GetLink(linkName));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }


        public static bool ControlIsVisible(String linkName)
        {
            try
            {
                return Control_PropertyUtilities.IsControlVisible(DS_HomePage.GetLink(linkName));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }



        public static bool SelectTheCheckBox()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_HomePage.CheckBox, "Not able to find the Checkbox");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SeeTheMessage(String message)
        {
            bool found = false;
            string messageFromApplication;
            try
            {
               
                    messageFromApplication =Control_PropertyUtilities.GetAttributeValue(DS_HomePage.ManageLabsMessage, message, out found );
                    string messageFromApplication1 = messageFromApplication.TrimStart(' ');
                    string messageFormApplication2 = messageFromApplication1.TrimEnd(' ');
                    return (messageFormApplication2.Equals(message));
             }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DesignerHomePage()
        {
            try
            {
                return Control_PropertyUtilities.IsControlVisible(DS_HomePage.DSHomePage);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DesignerCodelistspage()
        {
            try
            {
                return Control_PropertyUtilities.IsControlVisible(DS_HomePage.CodelistsPage);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickFormsButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_HomePage.Forms, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }        
        

    }
}
