using Interfaces;
using OpenQA.Selenium;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Study
{
    public class DL_StudyVersionManagementPage
    {
        public static IControl StudyFilesTable
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("subtabStudyFiles"));
            }
        }

        public static IControl NoStudyUploadedMessage
        {
            get
            {
                IControl table_MainContent = SyncUtilities.FindElement(By.Id("tblMainContent"));
                ReadOnlyCollection<IControl> cList = SyncUtilities.FindVisibleElements_Parent(table_MainContent.WebElement, By.TagName("td"));
                foreach (IControl c in cList)
                {
                    if(c.WebElement.Text.Equals("There are no study files uploaded"))
                    {
                        return c;
                    }
                }
                return null;
            }
        }
    }
}
