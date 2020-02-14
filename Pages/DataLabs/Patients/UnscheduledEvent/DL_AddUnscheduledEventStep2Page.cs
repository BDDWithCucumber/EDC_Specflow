using Common;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Patients.UnscheduledEvent
{
    public class DL_AddUnscheduledEventStep2Page
    {
        public static IControl GetFormCheckbox(String formName)
        {
            try
            {
                IControl formsTable = SyncUtilities.FindVisibleElement(By.Id("UnscheduledEvent_chkList"));
                ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(formsTable.WebElement, By.TagName("tr"));
                foreach (IControl c in rows)
                {
                    IControl formLabel = SyncUtilities.FindElement(By.TagName("label"));
                    if (!Control_PropertyUtilities.IsControlNull(formLabel))
                    {
                        String labelText = Control_PropertyUtilities.GetText(formLabel);
                        if(labelText.Equals(formName, StringComparison.InvariantCultureIgnoreCase))
                        {
                            return new Control(c.WebElement.FindElement(By.TagName("input")));
                            //return SyncUtilities.FindElement(By.TagName("input"));
                        }
                    }
                }
            }
            catch(Exception e)
            {

            }
            return null;
        }

        public static IControl NextButton { get { return SyncUtilities.FindVisibleElement(By.Id("UnscheduledEvent_btnNext")); } }
    }
}
