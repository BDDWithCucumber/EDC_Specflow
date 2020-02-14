using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.Designer.ModelDialog
{
    public class DS_Labs_ModalBase
    {
        public static IControl Title
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#aspnetForm > .rwTransparentWindow > .rwTable .rwTitleRow"));
            }
        }

        public static IControl Message
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#aspnetForm > .rwTransparentWindow > .rwTable .rwContentRow"));
            }
        }
    }
}