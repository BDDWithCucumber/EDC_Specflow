using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Interactions;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading;

namespace Utilities
{
    public static class SyncUtilities
    {
        static int WaitTime = 60;

        public static IControl FindElement(By locator)
        {
            IWebElement webElement = null;
            try
            {
                //WebDriverWait wait = new WebDriverWait(BrowserUtilities.WebDriver, TimeSpan.FromSeconds(10));
                //webElement = wait.Until(ExpectedConditions.ElementExists(locator));
                WaitUntilDocumentIsReady();
                webElement = BrowserUtilities.WebDriver.FindElement(locator);
                //Actions actions = new Actions(BrowserUtilities.WebDriver);
                //actions.MoveToElement(webElement);
                //actions.Perform();
            }
            catch (WebDriverTimeoutException e)
            {

            }
            catch (WebDriverException e)
            {

            }
            catch (Exception e)
            {

            }
            ScrollIntoView(webElement);
            return new Control(webElement);
        }

        public static IControl FindVisibleElement(By locator)
        {
            int i = 0;
            while (i < WaitTime)
            {
                ++i;
                ReadOnlyCollection<IControl> cList = FindElements(locator);
                foreach (Control c in cList)
                {
                    if (c != null && c.WebElement != null && IsElementVisible(c.WebElement))
                    {
                        ScrollIntoView(c.WebElement);
                        return c;
                    }
                }
                Thread.Sleep(1000);
            }
            return null;
        }

        public static IControl FindClickableElement(By locator)
        {
            int i = 0;
            while (i < WaitTime)
            {
                ++i;
                ReadOnlyCollection<IControl> cList = FindElements(locator);
                foreach (IControl c in cList)
                {
                    if (c != null && c.WebElement != null && IsElementClickable(c.WebElement))
                    {
                        ScrollIntoView(c.WebElement);
                        return c;
                    }
                }
                Thread.Sleep(1000);
            }
            return null;
        }

        public static IControl FindElement_Parent(IWebElement parent, By locator)
        {
            IWebElement element = null;
            try
            {
                if (parent != null)
                {
                    WaitUntilDocumentIsReady();
                    element = parent.FindElement(locator);
                }
            }
            catch (NoSuchElementException e)
            {

            }
            catch (WebDriverTimeoutException e)
            {

            }
            catch (WebDriverException e)
            {

            }
            catch (Exception e)
            {

            }
            ScrollIntoView(element);
            return new Control(element);
        }

        public static IControl FindVisibleElement_Parent(IWebElement parent, By locator)
        {
            int i = 0;
            while (parent != null && i < WaitTime)
            {
                ++i;
                ReadOnlyCollection<IControl> cList = FindElements_Parent(parent, locator);
               
                    foreach (IControl c in cList)
                    {
                        if (c != null && c.WebElement != null && IsElementVisible(c.WebElement))
                        {
                        ScrollIntoView(c.WebElement);
                        return c;
                        }
                    }
                    Thread.Sleep(1000);
               
            }
            return null;
        }

        public static ReadOnlyCollection<IControl> FindElements(By locator)
        {
            IList<IWebElement> elements = null;
            try
            {
                WaitUntilDocumentIsReady();
                elements = BrowserUtilities.WebDriver.FindElements(locator);
            }
            catch (WebDriverTimeoutException e)
            {

            }
            catch (Exception e)
            {

            }
            return GetControlList(elements);
        }



        public static ReadOnlyCollection<IControl> FindElements_Parent(IWebElement parent, By locator)
        {
            IList<IWebElement> elements = null;
            try
            {
                if (parent != null)
                {
                    WaitUntilDocumentIsReady();
                    elements = parent.FindElements(locator);
                }
            }
            catch (WebDriverTimeoutException e)
            {

            }
            catch (Exception e)
            {

            }
            return GetControlList(elements);
        }

        public static ReadOnlyCollection<IControl> FindVisibleElements_Parent(IWebElement parent, By locator)
        {
            int i = 0;
            while (i < WaitTime)
            {
                ++i;
                List<IControl> finalList = new List<IControl>();
                ReadOnlyCollection<IControl> elements = FindElements_Parent(parent, locator);
                if (elements.Count > 0)
                {
                    foreach (IControl c in elements)
                    {
                        if (c != null && c.WebElement != null && IsElementVisible(c.WebElement))
                        {
                            finalList.Add(c);
                        }
                    }
                }
                if(finalList.Count > 0)
                {
                    return new ReadOnlyCollection<IControl>(finalList);
                }
            }
            return GetControlList(new List<IWebElement>());
        }

        static ReadOnlyCollection<IControl> GetControlList(IList<IWebElement> elements)
        {
            List<IControl> list = new List<IControl>();
            if (elements != null)
            {
                foreach (IWebElement item in elements)
                {
                    list.Add(new Control(item));
                }
            }
            return new ReadOnlyCollection<IControl>(list);
        }

        static bool IsElementVisible(IWebElement webElement)
        {
            if (webElement != null)
            {
                return webElement.Displayed && (webElement.Size.Width > 0 || webElement.Size.Height > 0);
            }
            return false;
        }

        static bool IsElementClickable(IWebElement webElement)
        {
            if (webElement != null)
            {
                return webElement.Displayed && webElement.Size.Width > 0 && webElement.Size.Height > 0 && webElement.Enabled;
            }
            return false;
        }

        static void ScrollIntoView(IWebElement webElement)
        {
            try
            {
                if (webElement != null)
                {
                    if (webElement.Location.Y > 1000 && webElement.Location.Y < 2000)
                    {
                        ScrollTo(0, webElement.Location.Y-800); // Make sure element is in the view but below the top navigation pane
                    }
                    //IJavaScriptExecutor javaScriptExecutor = (IJavaScriptExecutor)BrowserUtilities.WebDriver;
                    //javaScriptExecutor.ExecuteScript("arguments[0].scrollIntoView(false);", webElement);
                    //Thread.Sleep(300);
                }
            }
            catch (Exception e)
            {
            }
        }
        public static void ScrollTo(int xPosition = 0, int yPosition = 0)
        {
            var js = String.Format("window.scrollTo({0}, {1})", xPosition, yPosition);
            IJavaScriptExecutor javaScriptExecutor = (IJavaScriptExecutor)BrowserUtilities.WebDriver;

            javaScriptExecutor.ExecuteScript(js);
        }
        static void WaitUntilDocumentIsReady()
        {
            //Thread.Sleep(2000);
            //IJavaScriptExecutor javascriptExecutor = (IJavaScriptExecutor)BrowserUtilities.WebDriver;
            //WebDriverWait wait = new WebDriverWait(BrowserUtilities.WebDriver, TimeSpan.FromSeconds(WaitTime));
            //try
            //{
            //    Func<IWebDriver, bool> readyCondition = webDriver => (bool)javascriptExecutor.ExecuteScript("return (document.readyState == 'complete' && jQuery.active == 0)");
            //    wait.Until(readyCondition);
            //}
            //catch (InvalidOperationException)
            //{
            //    wait.Until(wd => javascriptExecutor.ExecuteScript("return document.readyState").ToString() == "complete");
            //}
            //catch(Exception e)
            //{
            //}
        }
    }
}