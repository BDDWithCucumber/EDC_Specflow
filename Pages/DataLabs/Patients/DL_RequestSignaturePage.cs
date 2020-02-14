using Framework;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Patients
{
    public class DL_RequestSignaturePage
    {
        public static IControl EventsFormsTable { get { return SyncUtilities.FindVisibleElement(By.Id("tblEventFormList")); } }

        public static IControl SubmitButton { get { return SyncUtilities.FindVisibleElement(By.Id("RequestSignature_btnSubmit")); } }

        public static IControl SelectAllButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnSelectAll")); } }
        public static IControl GetRequestCheckboxForForm(String eventName,String formName)
        {
            try
            {
                String cssSelector = "tr[eventlabel='" + eventName + "']";
                ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(EventsFormsTable.WebElement, By.CssSelector(cssSelector));
                foreach (IControl row in rows)
                {
                    ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(row.WebElement, By.TagName("td"));
                    if (cells.Count >= 5) {
                        String cellText = WebTableUtilities.GetText(cells[0]);
                        if(cellText.Equals(formName, StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[4].WebElement, By.TagName("input"));
                        }
                    }
                }
            }
            catch(Exception e)
            {

            }
            return null;
        }
    }
}
