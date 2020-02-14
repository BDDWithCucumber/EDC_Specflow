using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Common;
using Reports.DebugLog;
using System;
using System.Reflection;
using System.Threading;

namespace BusinessProcesses.DataLabs.Common
{
    public class BP_ActionPaletteUtilities
    {
        public static bool InvokeActionPaletteLink(String actionPalette_LinkName, String actionPalette)
        {
            try
            {
                Thread.Sleep(1000);
                IControl actionPalette_Group = GetExpandedActionPaletteGroup(actionPalette);
                IControl linkToInvoke = DL_ActionPalette.ActionPalette_GetLink(actionPalette_Group, actionPalette_LinkName);
                if (linkToInvoke != null && !Control_PropertyUtilities.IsControlNull(linkToInvoke))
                {
                    return Control_ActionUtilities.Click(linkToInvoke, "Unable to click ActionPalette item " + actionPalette_LinkName);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsActionPaletteLinkAvailable(String actionPalette_LinkName, String actionPalette)
        {
            try
            {
                IControl actionPalette_Group = GetExpandedActionPaletteGroup(actionPalette);
                return DL_ActionPalette.IsActionPaletteLinkAvailable(actionPalette_Group, actionPalette_LinkName);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
         }

        public static IControl GetExpandedActionPaletteGroup(String actionPalette)
        {
            IControl actionPalette_Group = DL_ActionPalette.ActionPalette_GetActionsHost(actionPalette);
            if (!DL_ActionPalette.IsActionPalettteExpanded(actionPalette_Group))
            {
                IControl expandCollapseImage = DL_ActionPalette.ActionPalette_GetExpandCollapseImage(actionPalette_Group);
                Control_ActionUtilities.Click(expandCollapseImage, "Unable to expand ActionPalette group");
            }
            return actionPalette_Group;
        }


        public static bool ClickLinkUnderFlagsPalette(string flagType, string linkName)
        {try
            {
                if (linkName.Equals("Mark All", StringComparison.InvariantCultureIgnoreCase))
                {
                    return ClickMarkAllInFlags(flagType);
                }
                else if (linkName.Equals("Unmark All", StringComparison.InvariantCultureIgnoreCase))
                {
                    return ClickUnmarkAllInFlags(flagType);
                }
                else if (linkName.Equals("Mark Required", StringComparison.InvariantCultureIgnoreCase))
                {
                    return ClickMarkRequiredInFlags(flagType);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickMarkRequiredInFlags(String flagType)
        {
            try
            {
                if (ExpandFlagGroup() && ExpandFlagType(flagType))
                {
                    IControl markAllLink = DL_ActionPalette.GetMarkRquiredLinkForFlagType(flagType);
                    return Control_ActionUtilities.Click(markAllLink, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickMarkAllInFlags(String flagType)
        {
            try
            {
                if (ExpandFlagGroup() && ExpandFlagType(flagType))
                {
                    IControl markAllLink = DL_ActionPalette.GetMarkAllLinkForFlagType(flagType);
                    return Control_ActionUtilities.Click(markAllLink, String.Empty);
                }                
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickUnmarkAllInFlags(String flagType)
        {
            try
            {
                if (ExpandFlagGroup() && ExpandFlagType(flagType))
                {
                    IControl unmarkAllLink = DL_ActionPalette.GetUnmarkAllLinkForFlagType(flagType);
                    return Control_ActionUtilities.Click(unmarkAllLink, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool ExpandFlagType(String flagType)
        {
            try
            {
                IControl expandCollapseIcon = DL_ActionPalette.GetExpandCollapseIconOfFlag(flagType);
                if (!IsFlagTypeExpanded(expandCollapseIcon))
                {
                    if (!Control_PropertyUtilities.IsControlNull(expandCollapseIcon))
                    {
                        return Control_ActionUtilities.Click(expandCollapseIcon, String.Empty);
                    }
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool IsFlagTypeExpanded(IControl expandCollapseIcon)
        {
            bool found = false;
            String propertyValue = Control_PropertyUtilities.GetAttributeValue(expandCollapseIcon, "src", out found);
            if (found)
            {
                return propertyValue.Contains("collapse");
            }
            return found;
        }

        static bool ExpandFlagGroup()
        {
            try
            {
                if (!DL_ActionPalette.IsActionPalettteExpanded(DL_ActionPalette.ActionPalette_FlagDisplayHost))
                {
                    IControl expandCollapseImage = DL_ActionPalette.ActionPalette_GetExpandCollapseImage(DL_ActionPalette.ActionPalette_FlagDisplayHost);
                    return Control_ActionUtilities.Click(expandCollapseImage, "Unable to expand ActionPalette group");
                }
                else
                {
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}