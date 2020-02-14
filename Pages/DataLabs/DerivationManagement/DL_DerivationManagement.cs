    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using Utilities;
    using Framework;
    using Interfaces;
    using OpenQA.Selenium;
    using System.Collections.ObjectModel;
    using Framework.Actions;
    using Common;
    using OpenQA.Selenium.Support.UI;

namespace Pages.DataLabs.DerivationManagement
{
    public class DL_DerivationManagement
    {
        public static IControl derivationNameTextBox { get { return SyncUtilities.FindVisibleElement(By.XPath("//input[@id='DerivationMgmtList_grdDerives_ctl00_ctl02_ctl03_FilterTextBox_colName']")); } }

        public static IControl derivationNameTextBoxFilter { get { return SyncUtilities.FindVisibleElement(By.XPath("//input[@id='DerivationMgmtList_grdDerives_ctl00_ctl02_ctl03_Filter_colName']")); } }

        public static IControl derivationListTable { get { return SyncUtilities.FindVisibleElement(By.CssSelector("#DerivationMgmtList_grdDerives_ctl00 > tbody")); } }
        public static IControl FilterMenu { get { return SyncUtilities.FindVisibleElement(By.XPath("//div[@id='DerivationMgmtList_grdDerives_rfltMenu_detached']"));} }
        public static IControl FilterTypeLink(string linkName)
        {
            return new Control(FilterMenu.WebElement.FindElement(By.LinkText(linkName)));
        }
        public static IControl derivationNameLink(string derivationName)
        {
           // ReadOnlyCollection<IControl> derivationNamerows = WebTableUtilities.GetRows(DL_DerivationManagement.derivationListTable);
            ReadOnlyCollection<IControl> derivationNamerows = SyncUtilities.FindElements_Parent(DL_DerivationManagement.derivationListTable.WebElement, By.TagName("tr"));
            foreach (IControl row in derivationNamerows)
            {
                IControl derivationNameLink = SyncUtilities.FindVisibleElement_Parent(row.WebElement, By.TagName("a"));
                string linkText = Control_PropertyUtilities.GetText(derivationNameLink);

                if (derivationName.Equals(linkText, StringComparison.InvariantCultureIgnoreCase))
                {
                    return derivationNameLink;
                }

            }
            return null;
        }
        public static IControl derivationStatus { get { return SyncUtilities.FindVisibleElement(By.Id("DerivationMgmtDetail_ddlScriptState")); } }
        public static IControl derivationStatusdropdown { get { return new Control(derivationStatus.WebElement, new SelectElement(derivationStatus.WebElement)); } }

        public static IControl ButtonName(string buttonName)
        {
            buttonName = buttonName.ToUpper();
            switch (buttonName)
            {  
                case "SAVE":
                    return SyncUtilities.FindVisibleElement(By.Id("DerivationMgmtDetail_btnSave"));
                case "CANCEL":
                    return SyncUtilities.FindVisibleElement(By.Id("DerivationMgmtDetail_btnCancel"));

            }
            return null;
        }
    }
}
