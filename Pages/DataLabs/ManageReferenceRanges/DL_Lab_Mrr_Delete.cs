using Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;
using OpenQA.Selenium;
using Framework;
using Framework.Actions;
using System.Collections.ObjectModel;

namespace Pages.DataLabs.ManageReferenceRanges
{
    public class DL_Lab_Mrr_Delete
    {       
       public static IControl Checkbox(IControl row)
        {
            return SyncUtilities.FindElement_Parent(row.WebElement, By.CssSelector("label.k-checkbox-label"));
        }
        public static IControl ViewDeletedReferenceRangesCheckBox
        {
            get
            {
               return SyncUtilities.FindElement(By.CssSelector("#ViewDeletedCheckBox"));
            }
        }
        public static IControl StrikeThroughRow
        {
            get
            {
                IControl rows = SyncUtilities.FindVisibleElement(By.CssSelector("#gridReferenceRanges > div.k-grid-content.k-auto-scrollable > table > tbody > tr"));
                return SyncUtilities.FindElement_Parent(rows.WebElement, By.ClassName("deleted-reference-range"));
            }
        }    
       public static IControl DeleteButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("a.k-button.k-button-icontext.k-grid-btndelete"));
            }
        }

    }
}
