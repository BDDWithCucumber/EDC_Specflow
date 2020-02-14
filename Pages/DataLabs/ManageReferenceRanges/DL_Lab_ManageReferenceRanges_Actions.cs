using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pages.DataLabs.ManageReferenceRanges
{
    public class DL_Lab_ManageReferenceRanges_Actions
    {
        public static IControl Savebutton { get { return Utilities.SyncUtilities.FindVisibleElement(By.XPath("Savebutton")); } }

        public static IControl SaveandAddbutton { get { return Utilities.SyncUtilities.FindVisibleElement(By.XPath("SaveandAdd")); } }

        public static IControl Cancelbutton { get { return Utilities.SyncUtilities.FindVisibleElement(By.XPath("Cancelbutton")); } }

        public static IControl Edit_Icon { get { return Utilities.SyncUtilities.FindVisibleElement(By.Name("EditIcon")); } }

        public static IControl Add_Button { get { return Utilities.SyncUtilities.FindVisibleElement(By.Name("AddButton")); } }

        public static IControl Delete_Button { get { return Utilities.SyncUtilities.FindVisibleElement(By.Name("DeleteButton")); } }

        public static IControl Delete_Icon { get { return Utilities.SyncUtilities.FindVisibleElement(By.Name("DeleteIcon")); } }

        public static IControl Copy_Icon { get { return Utilities.SyncUtilities.FindVisibleElement(By.Name("CopyIcon")); } }

        public static IControl History_Icon { get { return Utilities.SyncUtilities.FindVisibleElement(By.Name("HistoryIcon")); } }

        public static IControl Search_Field { get { return Utilities.SyncUtilities.FindVisibleElement(By.XPath("search")); } }

    }
}
