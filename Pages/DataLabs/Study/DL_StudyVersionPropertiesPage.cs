using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Study
{
    public class DL_StudyVersionPropertiesPage
    {
        public static IControl Notes
        {
            get
            {
                IControl mainContent = SyncUtilities.FindVisibleElement(By.Id("tblMainContent"));
                return SyncUtilities.FindVisibleElement_Parent(mainContent.WebElement, By.ClassName("lblNotes"));
            }
        }
    }
}
