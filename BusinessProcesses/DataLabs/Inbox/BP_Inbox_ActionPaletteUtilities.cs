using BusinessProcesses.DataLabs.Common;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Inbox;
using System;

namespace BusinessProcesses.DataLabs.Inbox
{
    public class BP_Inbox_ActionPaletteUtilities
    {
        public static bool InvokeActionPaletteItem(String actionPaletteName)
        {
            IControl actionPalette = BP_ActionPaletteUtilities.GetExpandedActionPaletteGroup("Inbox_Folders");
            IControl actionPaletteItem = DL_InboxPage.GetActionPaletteItemToInvoke(actionPalette, actionPaletteName);
            return Control_ActionUtilities.Click(actionPaletteItem, String.Empty);
        }
    }
}
