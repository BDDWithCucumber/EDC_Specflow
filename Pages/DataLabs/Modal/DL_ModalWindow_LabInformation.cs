using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_LabInformation
    {
        static IControl LabInfoTable { get { return SyncUtilities.FindVisibleElement(By.ClassName("trheight")); } }

        public static IControl CloseButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnClose")); } }

        public static IControl GetDataCell(String data)
        {
            ReadOnlyCollection<IControl> dataCells = SyncUtilities.FindElements_Parent(LabInfoTable.WebElement, By.TagName("td"));
            foreach (IControl dataCell in dataCells)
            {
                String cellText = Control_PropertyUtilities.GetText(dataCell);
                if (data.Trim().Equals(cellText, StringComparison.InvariantCultureIgnoreCase))
                {
                    return dataCell;
                }
            }
            return null;
        }
    }
}
