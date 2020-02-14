using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using Utilities;

namespace Pages.DataLabs.Common
{
    public class DL_ActionPalette
    {
        public static IControl Sidebar
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("sidebar"));
            }
        }
        
        public static IControl ActionPalette_GetActionsHost(String actionPaletteName)
        {
            String actionPaletteId = GetActionPaletteId(actionPaletteName);
            if (!String.IsNullOrEmpty(actionPaletteId))
            {
                return SyncUtilities.FindVisibleElement_Parent(Sidebar.WebElement, By.Id(actionPaletteId));
            }
            return null;
        }

        public static IControl ActionPalette_GetLeftActionPalette()
        {
            return SyncUtilities.FindVisibleElement(By.Id("leftpanel"));
        }


        public static IControl ActionPalette_FlagDisplayHost
        {
            get
            {
                return SyncUtilities.FindVisibleElement_Parent(Sidebar.WebElement, By.Id("ReviewFlagVerify_trFlagDisplay"));
            }
        }

        static String GetActionPaletteId(String actionPaletteName)
        {
            String id = String.Empty;
            if (actionPaletteName.Equals("GroupDetailsActions", StringComparison.InvariantCultureIgnoreCase))
            {
                id = "GroupDetailActions_trActionDisplay";
            }
            else
            {
                id = actionPaletteName + "_trActionDisplay";
            }
            return id;
        }
        public static IControl ActionPalette_GetLink(IControl actionPaletteGroup, String linkName)
        {
            return SyncUtilities.FindVisibleElement_Parent(actionPaletteGroup.WebElement, By.LinkText(linkName));
        }

        public static bool IsActionPaletteLinkAvailable(IControl actionPaletteGroup, String linkName)
        {
            IControl c = SyncUtilities.FindElement_Parent(actionPaletteGroup.WebElement, By.LinkText(linkName));
            return !Control_PropertyUtilities.IsControlNull(c);
        }
        
        public static bool IsLinkAvailableInLeftPalette(IControl actionPaletteGroup, String linkName)
        {
            IControl c = SyncUtilities.FindElement_Parent(actionPaletteGroup.WebElement, By.LinkText(linkName));
            return !Control_PropertyUtilities.IsControlNull(c);
        }

        public static bool IsActionPalettteExpanded(IControl actionDetails)
        {
            String propertyValue = actionDetails.WebElement.GetAttribute("class");
            return propertyValue.Equals("visible", StringComparison.InvariantCultureIgnoreCase);
        }
        public static IControl ActionPalette_GetExpandCollapseImage(IControl actionDetails)
        {
            String propertyValue = actionDetails.WebElement.GetAttribute("id");
            String[] valueList = propertyValue.Split('_');
            if (valueList.Length == 2)
            {
                String value1 = valueList[0];
                String imageId = value1 + "_imgToggle";
                return SyncUtilities.FindElement_Parent(Sidebar.WebElement, By.Id(imageId));
            }
            return null;
        }

        public static IControl GetMarkRquiredLinkForFlagType(string flagType)
        {
            if (flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag3_MarkRequired"));
            }
            else if (flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag2_MarkRequired"));
            }
            else if (flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag1_MarkRequired"));
            }
            return null;
        }

        public static IControl GetMarkAllLinkForFlagType(string flagType)
        {
            if (flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag3_MarkAll"));
            }
            else if (flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag2_MarkAll"));
            }
            else if (flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag1_MarkAll"));
            }
            return null;
        }

        public static IControl GetUnmarkAllLinkForFlagType(string flagType)
        {
            if (flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag3_UnmarkAll"));
            }
            else if (flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag2_UnmarkAll"));
            }
            else if (flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag1_UnmarkAll"));
            }
            return null;
        }

        public static IControl GetExpandCollapseIconOfFlag(string flagType)
        {
            if(flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag3_Flag"));
            }
            else if(flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag2_Flag"));
            }
            else if(flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.Id("Flag1_Flag"));
            }
            return null;
        }

    }
}