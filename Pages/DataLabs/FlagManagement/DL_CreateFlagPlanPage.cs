using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;
using System.Collections.ObjectModel;
using Framework;
using Framework.Actions;
using Interfaces;
using Common;
using Reports.DebugLog;
using System.Reflection;

namespace Pages.DataLabs.FlagManagement
{
    public class DL_CreateFlagPlanPage
    {
        public static IControl AddPlanButton { get { return SyncUtilities.FindVisibleElement(By.LinkText("Add Plan")); } }
        public static IControl PlanNameTextBox { get { return SyncUtilities.FindVisibleElement(By.Id("txtPlanName")); } }
        public static IControl PlanLabelTextBox { get { return SyncUtilities.FindVisibleElement(By.Id("txtPlanLabel")); } }
        public static IControl AddRemoveExistingDataGrpChk { get { return SyncUtilities.FindVisibleElement(By.Id("chkExisting")); } }
        public static IControl AddNewDataGrpChk { get { return SyncUtilities.FindVisibleElement(By.Id("chkNew")); } }
        public static IControl NextButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnNext")); } }
        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnCancel")); } }
        public static IControl SaveCloseButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnFinish")); } }
        public static IControl BackButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnBack")); } }

        public static IControl FlagManagementMultiSelectdropdown { get { return SyncUtilities.FindVisibleElement(By.XPath("//p[@class='CaptionCont SlectBox']")); } }
        public static IControl GetFlagDataGroupListValue(String DataGroupOption)
        {
            try
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//p[@class='CaptionCont SlectBox']/following-sibling::div//*[text()='" + DataGroupOption + "']"));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }

        //public static IControl FlagDataGroupList { get { return new Control(FlagDataGroup.WebElement, new SelectElement(FlagDataGroup.WebElement)); } }
    }
}
