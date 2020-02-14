using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Common
{
    public class DL_DCFs_FlagsPalette
    {
        public static IControl ReadyToPrint_Off { get { return SyncUtilities.FindVisibleElement(By.ClassName("menuPopRow")); } }

        public static IControl ReadyToPrint_On { get { return SyncUtilities.FindVisibleElement(By.ClassName("menuPopRowLast")); } }
    }
}
