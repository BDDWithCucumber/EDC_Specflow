using System;
using OpenQA.Selenium;
using Interfaces;
using Framework.Actions;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using Utilities;

namespace Framework
{
    public class ActionPaletteUtilities
    {
        public static IWebElement GetLinkFromActionPalette(IControl ActionsPalette, String ActionLink, String LogMessageOnException)
        {
            bool ActionLinkFound = false;

            try
            {
                if(ExpandActionsPalette(ActionsPalette, "Unable to expand Actions Palettte"))
                {
                    IWebElement Action = ActionsPalette.WebElement.FindElement(By.XPath("//*[contains(text(), '" + ActionLink + "')]//ancestor::a[1]"));
                    if (Action != null)
                    {
                        ActionLinkFound = true;
                        return Action;
                    }
                }
                if (!ActionLinkFound)
                {
                    Control_ActionUtilities.LogException("Action Palette is not displayed.", String.Empty, LogMessageOnException);
                }
            }            
            catch (Exception e)
            {
                Control_ActionUtilities.LogException("Failed to get Action link.", e.ToString(), LogMessageOnException);
            }
            return null;
        }

        public static bool ExpandActionsPalette(IControl ActionsPalette, String LogMessageOnException)
        {
            bool ActionsExpanded = false;

            try
            {
                if (ActionsPalette != null && ActionsPalette.WebElement != null)
                {
                    IWebElement Actions = ActionsPalette.WebElement;
                    if (Actions.GetProperty("class") != "visible")
                    {
                        IWebElement ExpandCollapseIcon = Actions.FindElement(By.XPath(".//preceding::tr[1]//img[contains(@id, 'Actions_imgToggle')]"));
                        if (ExpandCollapseIcon != null)
                        {
                            ExpandCollapseIcon.Click();
                            ActionsExpanded = true;
                        }
                    }
                    //return ActionsExpanded;
                    if (!ActionsExpanded)
                    {
                        Control_ActionUtilities.LogException("Expand Icon for Actions palette is not displayed.", String.Empty, LogMessageOnException);
                    }
                }
                else
                {
                    Control_ActionUtilities.LogException("Actions Palette is not displayed to expand.", String.Empty, LogMessageOnException);
                }
            }
            catch (Exception e)
            {
                Control_ActionUtilities.LogException("Unable to expand Actions Palette.", e.ToString(), LogMessageOnException);
            }
            return ActionsExpanded;
        }

        public static bool VerifyActionLinksDisplayed(IControl ActionsPalette, String ActionsToVerify, String PageName, out String UnavailableActions)
        {
            UnavailableActions = String.Empty;
            bool Verification = true;
            try
            {
                if (ActionsPalette != null && ActionsPalette.WebElement != null)
                {
                    string[] ActionsArray = ActionsToVerify.Split(',');
                    foreach (string ActionLinkToVerify in ActionsArray)
                    {
                        if (GetLinkFromActionPalette(ActionsPalette, ActionLinkToVerify, "Unable to get action link " + ActionsToVerify + " from actions palette on " + PageName + ".") == null)
                        {
                            UnavailableActions = UnavailableActions + ActionsToVerify + ", ";
                            Verification = false;
                        }
                    }
                }
                else
                {
                    Verification = false;
                }
                if (!Verification)
                {
                    Control_ActionUtilities.LogException("Action Link verification on " + PageName + " page is failed.", string.Empty, "");
                }
            }
            catch (Exception e)
            {
                Control_ActionUtilities.LogException("Unable to verify action links on " + PageName + ".", e.ToString(), "Action links verification failed.");
            }
            return Verification;
        }

        public static bool VerifyActionLinksNotDisplayed(IControl ActionsPalette, String ActionsToVerify, String PageName, out String AvailableActions)
        {
            AvailableActions = String.Empty;
            bool Verification = true;
            try
            {
                if (ActionsPalette != null && ActionsPalette.WebElement != null)
                {
                    string[] ActionsArray = ActionsToVerify.Split(',');
                    foreach (string ActionLinkToVerify in ActionsArray)
                    {
                        if (GetLinkFromActionPalette(ActionsPalette, ActionLinkToVerify, "Action link " + ActionsToVerify + " is displayed in actions palette on " + PageName + ".") != null)
                        {
                            AvailableActions = AvailableActions + ActionsToVerify + ", ";
                            Verification = false;
                        }
                    }
                }
                else
                {
                    Verification = false;
                }
                if (!Verification)
                {
                    Control_ActionUtilities.LogException("Action Link verification on " + PageName + " page is failed.", string.Empty, "");
                }
            }
            catch (Exception e)
            {
                Control_ActionUtilities.LogException("Unable to verify action links on " + PageName + ".", e.ToString(), "Action links verification failed.");
            }
            return Verification;
        }

        public static bool ClickOnActionLink(IControl ActionsPalette, String ActionToClick, String PageName, String LogExceptionMessage)
        {
            bool isActionClicked = false;
            try
            {
                IWebElement ActionLink = GetLinkFromActionPalette(ActionsPalette, ActionToClick, "Unable to get Action link " + ActionToClick + " on " + PageName + ".");
                if (ActionLink != null)
                {
                    ActionLink.Click();
                    isActionClicked = true;
                }
            }
            catch (Exception e)
            {
                Control_ActionUtilities.LogException("Clicking on " + ActionToClick + " action link on " + PageName + " page has failed.", e.ToString(), LogExceptionMessage);
            }
            return isActionClicked;
        }

        public static bool VerifyActionsOrder(IControl ActionsPalette, String ActionsToVerifyInOrder, String PageName, String LogExceptionMessage)
        {
            bool isOrderVerified = false;
            try
            {
                List<String> ActionsToVerify = new List<String>();
                String[] ActionsArray = ActionsToVerifyInOrder.Split(',');
                int iLink = 0;
                if (ExpandActionsPalette(ActionsPalette, "Verification of Actions order on " + PageName + " page."))
                {
                    IList<IWebElement> ActionLinks = ActionsPalette.WebElement.FindElements(By.XPath(".//ancestor::a"));
                    if (ActionLinks.Count == ActionsArray.Length+1)
                        {
                            foreach (IWebElement Link in ActionLinks)
                            {
                                if (Link.Text.Equals(ActionsArray[iLink], StringComparison.InvariantCultureIgnoreCase))
                                {
                                    isOrderVerified = true;
                                }
                                else
                                {
                                    isOrderVerified = false;
                                    break;
                                }
                                iLink++;
                            }
                        }
                    else
                    {
                        Control_ActionUtilities.LogException("Unable to verify action links order.", "Number of actions to verify and the number of actions in applciation are not matching.", LogExceptionMessage);
                    }
                    if (!isOrderVerified)
                    {
                        Control_ActionUtilities.LogException("Actions links order in " + PageName + " page is failed.", String.Empty, LogExceptionMessage);
                    } 
                }
            }
            catch (Exception e)
            {
                Control_ActionUtilities.LogException("Unable to verify actions links order in action palette of " + PageName + " page.", e.ToString(), LogExceptionMessage);
            }
            return isOrderVerified;
        }
    }
}
