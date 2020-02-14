using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using Utilities;
using Common;
using Reports.DebugLog;

namespace Framework.Actions
{
    public static class Control_ActionUtilities
    {
        public static bool Textbox_SetText(IControl textbox, String text, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (textbox != null && textbox.WebElement != null && IsClickable(textbox.WebElement))
                {
                    ScrollIntoView(textbox.WebElement);
                    textbox.WebElement.Clear();
                    Thread.Sleep(250);
                    textbox.WebElement.SendKeys(text.ToString());
                    Thread.Sleep(250);
                   // textbox.WebElement.SendKeys("\t");
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
        public static bool Textbox_SetText1(IControl textbox, String text, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (textbox != null && textbox.WebElement != null && IsClickable(textbox.WebElement))
                {
                    ScrollIntoView(textbox.WebElement);                    
                    Thread.Sleep(250);
                    textbox.WebElement.SendKeys("");                    
                    textbox.WebElement.SendKeys(text);                    
                    Thread.Sleep(2500);
                    //textbox.WebElement.SendKeys("\t");
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
        public static bool CheckCheckbox(IControl checkbox)
        {
            try
            {
                bool found = false;
                String value = Control_PropertyUtilities.GetAttributeValue(checkbox, "checked", out found);
                if (!found)
                {
                    ScrollIntoView(checkbox.WebElement);
                    return Control_ActionUtilities.Click(checkbox, String.Empty);
                }
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool UncheckCheckbox(IControl checkbox)
        {
            try
            {
                bool found = false;
                String value = Control_PropertyUtilities.GetAttributeValue(checkbox, "checked", out found);
                if (found)
                {
                    ScrollIntoView(checkbox.WebElement);
                    return Control_ActionUtilities.Click(checkbox, String.Empty);
                }
                return true;
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool ClickModalButton(IControl control)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (control != null && control.WebElement != null && IsClickable(control.WebElement))
                {
                    ScrollIntoView(control.WebElement);
                    //Click(control, "Unable to click modal button");
                    control.WebElement.Click();
                    WaitForPageLoad();
                    isOperationSucceeded = true;
                }
                if (!isOperationSucceeded)
                {
                }
            }
            catch (Exception e)
            {
            }
            return isOperationSucceeded;
        }

        public static bool Click(IControl control, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (control != null && control.WebElement != null && IsClickable(control.WebElement))
                {
                    ScrollIntoView(control.WebElement);
                    IJavaScriptExecutor javascriptExecutor = (IJavaScriptExecutor)BrowserUtilities.WebDriver;
                    javascriptExecutor.ExecuteScript("arguments[0].click();", control.WebElement);
                    //control.WebElement.Click();
                    WaitForPageLoad();
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

        public static bool ClickWithoutVerify(IControl control, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (control != null && control.WebElement != null )
                {
                    ScrollIntoView(control.WebElement);
                    IJavaScriptExecutor javascriptExecutor = (IJavaScriptExecutor)BrowserUtilities.WebDriver;
                    javascriptExecutor.ExecuteScript("arguments[0].click();", control.WebElement);
                    //control.WebElement.Click();
                    WaitForPageLoad();
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

        public static bool Click_PerssEnterKey(IControl control, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (control != null && control.WebElement != null && IsClickable(control.WebElement))
                {
                    ScrollIntoView(control.WebElement);
                    IJavaScriptExecutor javascriptExecutor = (IJavaScriptExecutor)BrowserUtilities.WebDriver;
                    javascriptExecutor.ExecuteScript("arguments[0].click();", control.WebElement);
                    //control.WebElement.SendKeys(Keys.Enter);
                    WaitForPageLoad();
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

        public static bool MouseClick(IControl control, String logMessageOnException)
        {
            try
            {
                ScrollIntoView(control.WebElement);
                OpenQA.Selenium.Interactions.Actions action = new OpenQA.Selenium.Interactions.Actions(BrowserUtilities.WebDriver);
                action.MoveToElement(control.WebElement).Click(control.WebElement).Build().Perform();
                Thread.Sleep(1000);
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool MouseHover(IControl control, String logMessageOnException)
        {
            try
            {
                ScrollIntoView(control.WebElement);
                OpenQA.Selenium.Interactions.Actions action = new OpenQA.Selenium.Interactions.Actions(BrowserUtilities.WebDriver);
                action.MoveToElement(control.WebElement).Perform();
                Thread.Sleep(1000);
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static List<string> Dropdown_GetItems(IControl dropdown, out bool found)
        {
            found = true;
            List<String> items = new List<String>();
            try
            {
                IList<IWebElement> dropdownItemList = dropdown.SelectElement.Options;
                foreach (IWebElement dropdownItem in dropdownItemList)
                {
                    items.Add(dropdownItem.Text);
                }
            }
            catch (Exception e)
            {
                found = false;
            }
            return items;
        }

        public static bool Dropdown_SelectItem(IControl dropdown, String itemTextToSelect, String logMessageOnException)
        {
           
            bool isOperationSucceeded = false;
            try
            {
               if (dropdown != null && dropdown.SelectElement != null && Dropdown_HasItmes(dropdown))
                {
                    ScrollIntoView(dropdown.WebElement);
                    Click(dropdown, String.Empty);
                    dropdown.SelectElement.SelectByText(itemTextToSelect);
                    Thread.Sleep(2500);
                    //dropdown.WebElement.SendKeys("\t");
                    isOperationSucceeded = true;
                    WaitForPageLoad();
                }
                if (!isOperationSucceeded)
                {
                    //LogException("Object does not exist and failed to select dropdown item", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                //LogException("Failed to select dropdown item", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Dropdown_SelectItemOld(IControl dropdown, String itemTextToSelect, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (dropdown != null && dropdown.SelectElement != null && Dropdown_HasItmes(dropdown))
                {
                    ScrollIntoView(dropdown.WebElement);
                    dropdown.SelectElement.SelectByText(itemTextToSelect);
                    Thread.Sleep(250);
                    isOperationSucceeded = true;
                    WaitForPageLoad();
                }
                if (!isOperationSucceeded)
                {
                    //LogException("Object does not exist and failed to select dropdown item", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                //LogException("Failed to select dropdown item", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Dropdown_SelectItems(IControl dropdown, List<String> itemsToSelect)
        {
            try
            {
                if (!Control_PropertyUtilities.IsControlNull(dropdown) && dropdown.SelectElement.IsMultiple && Dropdown_HasItmes(dropdown))
                {
                    ScrollIntoView(dropdown.WebElement);
                    foreach (String itemToSelect in itemsToSelect)
                    {
                        if (!Dropdown_SelectItem(dropdown, itemToSelect, String.Empty))
                        {
                            return false;
                        }
                    }
                    return true;
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }

        public static bool SelectItemInDualSelectDropdown(IControl dropdown, String itemTextToSelect, String logMessageOnException)
        {
            bool isOperationSucceeded = false;
            try
            {
                if (dropdown != null && dropdown.SelectElement != null && Dropdown_HasItmes(dropdown))
                {
                    IList<IWebElement> dropdownItemList = dropdown.SelectElement.Options;
                    foreach (IWebElement dropdownItem in dropdownItemList)
                    {
                        if (dropdownItem.Text.Equals(itemTextToSelect, StringComparison.InvariantCultureIgnoreCase))
                        {
                            dropdownItem.Click();
                            Control_ActionUtilities.MouseClick(new Control(dropdownItem), "");
                            Thread.Sleep(250);
                            WaitForPageLoad();
                            isOperationSucceeded = true;
                            break;
                        }
                    }
                }
                if (!isOperationSucceeded)
                {
                    //LogException("Object does not exist and failed to select dropdown item", String.Empty, logMessageOnException);
                }
            }
            catch (Exception e)
            {
                //LogException("Failed to select dropdown item", e.ToString(), logMessageOnException);
            }
            return isOperationSucceeded;
        }

        public static bool Dropdown_SelectAllItems(IControl listBox, out bool noItemsFound)
        {
            noItemsFound = false;
            try
            {
                if (!Control_PropertyUtilities.IsControlNull(listBox) && listBox.SelectElement.IsMultiple && Dropdown_HasItmes(listBox))
                {
                    if (listBox.SelectElement.Options.Count > 0)
                    {
                        ScrollIntoView(listBox.WebElement);
                        foreach (IWebElement item in listBox.SelectElement.Options)
                        {
                            listBox.SelectElement.SelectByText(item.Text);
                            WaitForPageLoad();
                        }
                        return true;
                    }
                    else
                    {
                        noItemsFound = true;
                        return true;
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool Dropdown_VerifyItems(IControl Dropdown, List<string> ItemsToVerify, bool ItemsAvailable, string logMessageOnException)
        {
            bool isVerifySuccessful = false;
            int AvailableCnt = 0;
            int UnavailableCnt = 0;
            try
            {
                if (!Control_PropertyUtilities.IsControlNull(Dropdown) && Dropdown_HasItmes(Dropdown))
                {
                    ScrollIntoView(Dropdown.WebElement);
                    IList<IWebElement> ItemList = Dropdown.SelectElement.Options;
                    List<string> ActualItemsList = new List<string>();
                    foreach (IWebElement ListItem in ItemList)
                    {
                        ActualItemsList.Add(ListItem.Text);
                    }
                    foreach (string Item in ItemsToVerify)
                    {
                        if (ActualItemsList.Contains(Item))
                        {
                            AvailableCnt = AvailableCnt + 1;
                        }
                        else
                        {
                            UnavailableCnt = UnavailableCnt + 1;
                        }
                    }
                    if ((ItemsAvailable == true && AvailableCnt == ItemsToVerify.Count) || (ItemsAvailable == false && UnavailableCnt == ItemsToVerify.Count))
                    {
                        isVerifySuccessful = true;
                    }
                }
            }
            catch (Exception e)
            {
            }
            return isVerifySuccessful;
        }

        public static bool Dropdown_VerifyItems(IControl dropdown, List<string> itemsToVerify, string logMessageOnException)
        {
            try
            {
                if (!Control_PropertyUtilities.IsControlNull(dropdown) && Dropdown_HasItmes(dropdown))
                {
                    ScrollIntoView(dropdown.WebElement);
                    List<String> itemList = GetItemList(dropdown.SelectElement);
                    if (itemList.Count >= itemsToVerify.Count)
                    {
                        foreach (String item in itemsToVerify)
                        {
                            if (!itemList.Contains(item))
                            {
                                return false;
                            }
                        }
                    }
                    else
                    {
                        return false;
                    }
                    return true;
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }

        public static bool Dropdown_IsItemAvailable(IControl dropdown, String item, string logMessageOnException)
        {
            try
            {
                if (!Control_PropertyUtilities.IsControlNull(dropdown) && Dropdown_HasItmes(dropdown))
                {
                    ScrollIntoView(dropdown.WebElement);
                    List<String> itemList = GetItemList(dropdown.SelectElement);
                    return itemList.Contains(item);
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }

        static bool Dropdown_HasItmes(IControl dropdown)
        {
            bool hasItems = false;
            if (!Control_PropertyUtilities.IsControlNull(dropdown))
            {
                int i = 0;
                while (!hasItems && i < 10)
                {
                    ++i;
                    hasItems = dropdown.SelectElement.Options.Count > 0;
                    Thread.Sleep(1000);
                }
            }
            return hasItems;
        }

        static List<String> GetItemList(SelectElement selectElement)
        {
            List<String> list = new List<String>();
            foreach (IWebElement element in selectElement.Options)
            {
                if (!String.IsNullOrEmpty(element.Text))
                {
                    list.Add(element.Text);
                }
            }
            return list;
        }

        public static bool Dropdown_VerifySelectedItem(IControl Dropdown, string selectedItem, string logMessageOnException)
        {
            bool Verification = false;
            try
            {
                if (!Control_PropertyUtilities.IsControlNull(Dropdown))
                {
                    ScrollIntoView(Dropdown.WebElement);
                    Verification = Dropdown.SelectElement.SelectedOption.Text.Equals(selectedItem);
                }
            }
            catch (Exception e)
            {
                //
            }
            return Verification;
        }

        public static void LogException(String actionMessage, String exception, String logMessageOnException)
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
			//Assert.Fail(message.ToString());

			new DebugLogGenerator().WriteToDebugLog(message.ToString());

		}

        public static bool VerifyObjectExistOnPage(IControl ObjToVerify, string ObjectName, string PageName, string LogExceptionMsg)
        {
            bool ObjFound = false;
            if (ObjToVerify != null && ObjToVerify.WebElement != null)
            {
                ObjFound = true;
            }
            else
            {
                LogException("Verification of " + ObjectName + " on " + PageName + ".", String.Empty, LogExceptionMsg);
            }
            return ObjFound;
        }

        public static bool VerifyObjectNotExistOnPage(IControl ObjToVerify, string ObjectName, string PageName, string LogExceptionMsg)
        {
            bool ObjNotFound = false;
            if (ObjToVerify == null && ObjToVerify.WebElement == null)
            {
                ObjNotFound = true;
            }
            else
            {
                LogException("Verification of " + ObjectName + " on " + PageName + ".", String.Empty, LogExceptionMsg);
            }
            return ObjNotFound;
        }

        public static string GetTextOfAnObject(IControl ObjectToGetTextFrom, string ObjName, string PageName, string LogExceptionMsg)
        {
            string ObjText = "";
            if (ObjectToGetTextFrom != null && ObjectToGetTextFrom.WebElement != null)
            {
                ObjText = ObjectToGetTextFrom.WebElement.Text;
            }
            else
            {
                LogException("Verification of " + ObjectToGetTextFrom + " on " + PageName + ".", String.Empty, LogExceptionMsg);
            }
            return ObjText;
        }

        public static bool IsClickable(IWebElement webElement)
        {
            try
            {
                int i = 0;
                while (true)
                {
                    if (webElement.Displayed && webElement.Size.Width > 0 && webElement.Size.Height > 0 && webElement.Enabled)
                    {
                        return true;
                    }
                    if (i == 5)
                    {
                        return false;
                    }
                    Thread.Sleep(500);
                    ++i;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }

        static void WaitForPageLoad()
        {
            IJavaScriptExecutor javascriptExecutor = (IJavaScriptExecutor)BrowserUtilities.WebDriver;
            WebDriverWait wait = new WebDriverWait(BrowserUtilities.WebDriver, TimeSpan.FromMinutes(2));
            try
            {
                Func<IWebDriver, bool> readyCondition = webDriver => (bool)javascriptExecutor.ExecuteScript("return (document.readyState == 'complete' && jQuery.active == 0)");
                wait.Until(readyCondition);
            }
            catch (InvalidOperationException)
            {
                wait.Until(wd => javascriptExecutor.ExecuteScript("return document.readyState").ToString() == "complete");
            }
            catch(WebDriverException T)
            {

            }
            catch (Exception e)
            {

            }
        }

        static void ScrollIntoView(IWebElement webElement)
        {
            ((IJavaScriptExecutor)BrowserUtilities.WebDriver).ExecuteScript("arguments[0].scrollIntoView(false);", webElement);
            //OpenQA.Selenium.Interactions.Actions actions = new OpenQA.Selenium.Interactions.Actions(BrowserUtilities.WebDriver);
            //actions.MoveToElement(webElement, webElement.Location.X, webElement.Location.Y);
            //actions.Perform();
        }

        public static void DoubleClickOnObject(IControl control)
        {
            ScrollIntoView(control.WebElement);
            OpenQA.Selenium.Interactions.Actions actions = new OpenQA.Selenium.Interactions.Actions(BrowserUtilities.WebDriver);
            actions.DoubleClick(control.WebElement);
            actions.Perform();
        }

        public static bool SubmitSaveNCloseButton(IControl control, string LogMessageOnFailure)
		{
			try
			{
				ScrollIntoView(control.WebElement);
				control.WebElement.Click();
				return true;
			}
			catch (Exception e)
			{
				LogException("Unable to select the Save&Close Button", e.ToString(), LogMessageOnFailure);

			}
			return false;
		}
    }
}