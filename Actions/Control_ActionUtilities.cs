/*using Interfaces;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Text;

namespace Actions
{
    public static class Control_ActionUtilities
    {
        public static bool Textbox_SetText(IControl textbox, String text, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (textbox != null && textbox.WebElement != null)
                {
                    textbox.WebElement.SendKeys(text);
                    isOperationSucceeded = true;
                }

                if (!isOperationSucceeded)
                {
                    LogException("Object does not exist and failed to set text to textbox", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                LogException("Failed to set text to textbox", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Textbox_GetText(IControl textbox, String logMessageOnException, out String text)
        {
            bool isOperationSucceeded = false;
            text = String.Empty;
            try
            {
                if (textbox != null && textbox.WebElement != null)
                {
                    text = textbox.WebElement.Text;
                    isOperationSucceeded = true;
                }

                if (!isOperationSucceeded)
                {
                    LogException("Object does not exist and failed to get text from textbox", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                LogException("Failed to get text from textbox", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Button_Click(IControl button, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (button != null && button.WebElement != null)
                {
                    button.WebElement.Click();
                    isOperationSucceeded = true;
                }

                if (!isOperationSucceeded)
                {
                    LogException("Object does not exist and failed to click button", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                LogException("Failed to click button", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Link_Click(IControl link, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (link != null && link.WebElement != null)
                {
                    link.WebElement.Click();
                    isOperationSucceeded = true;
                }

                if (!isOperationSucceeded)
                {
                    LogException("Object does not exist and failed to click link", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                LogException("Failed to click link", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Dropdown_SelectItem(IControl dropdown, String itemTextToSelect, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (dropdown != null && dropdown.SelectElement != null)
                {
                    dropdown.SelectElement.SelectByText(itemTextToSelect);
                    isOperationSucceeded = true;
                }
                if (!isOperationSucceeded)
                {
                    LogException("Object does not exist and failed to select dropdown item", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                LogException("Failed to select dropdown item", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        static void LogException(String actionMessage, String exception, String logMessageOnException)
        {
            StringBuilder message = new StringBuilder();
            message.AppendLine("----------------Start of log------------------");
            if (!String.IsNullOrEmpty(actionMessage))
            {
                message.AppendLine("Action-" + actionMessage);
            }
            if (!String.IsNullOrEmpty(exception))
            {
                message.AppendLine("Exception-" + exception);
            }
            if (!String.IsNullOrEmpty(logMessageOnException))
            {
                message.AppendLine("Message-" + logMessageOnException);
            }
            message.AppendLine("----------------End of log------------------");
            Assert.Fail(message.ToString());
        }
    }*/

/*public static class Control_ActionUtilities
    {
        public static bool Textbox_SetText(IWebElement textbox, String text, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (textbox != null)
                {
                    textbox.SendKeys(text);
                    isOperationSucceeded = true;
                }

                if (!isOperationSucceeded)
                {
                    LogException("Object does not exist and failed to set text to textbox", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                LogException("Failed to set text to textbox", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Textbox_GetText(IWebElement textbox, String logMessageOnException, out String text)
        {
            bool isOperationSucceeded = false;
            text = String.Empty;
            try
            {
                if (textbox != null)
                {
                    text = textbox.Text;
                    isOperationSucceeded = true;
                }

                if (!isOperationSucceeded)
                {
                    LogException("Object does not exist and failed to get text from textbox", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                LogException("Failed to get text from textbox", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Button_Click(IWebElement button, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (button != null)
                {
                    button.Click();
                    isOperationSucceeded = true;
                }

                if (!isOperationSucceeded)
                {
                    LogException("Object does not exist and failed to click button", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                LogException("Failed to click button", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Link_Click(IWebElement link, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (link != null)
                {
                    link.Click();
                    isOperationSucceeded = true;
                }

                if (!isOperationSucceeded)
                {
                    LogException("Object does not exist and failed to click link", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                LogException("Failed to click link", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Dropdown_SelectItem(SelectElement dropdown, String itemTextToSelect, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (dropdown != null)
                {
                    dropdown.SelectByText(itemTextToSelect);
                    isOperationSucceeded = true;
                }
                if (!isOperationSucceeded)
                {
                    LogException("Object does not exist and failed to select dropdown item", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                LogException("Failed to select dropdown item", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        static void LogException(String actionMessage, String exception, String logMessageOnException)
        {
            StringBuilder message = new StringBuilder();
            message.AppendLine("----------------Start of log------------------");
            if (!String.IsNullOrEmpty(actionMessage))
            {
                message.AppendLine("Action-" + actionMessage);
            }
            if (!String.IsNullOrEmpty(exception))
            {
                message.AppendLine("Exception-" + exception);
            }
            if (!String.IsNullOrEmpty(logMessageOnException))
            {
                message.AppendLine("Message-" + logMessageOnException);
            }
            message.AppendLine("----------------End of log------------------");
            Assert.Fail(message.ToString());
        }
    }*/
