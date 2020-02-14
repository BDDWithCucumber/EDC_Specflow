using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Edge;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.IE;
using System;
using System.Threading;
using TechTalk.SpecFlow;

namespace Utilities
{
    public static class BrowserUtilities
    {
        public static IWebDriver WebDriver { get; set; }

        public static String CurrentWindowHandle { get; set; }

        public static bool LaunchBrowser(String browserType, String url)
        {
            try
            {
                switch (browserType)
                {
                    case "IE":
                        WebDriver = new InternetExplorerDriver(GetIEOptions());
                        break;
                    case "Firefox":
                        WebDriver = new FirefoxDriver(GetFirefoxOptions());
                        break;
                    //case "Edge":
                        //WebDriver = new EdgeDriver();
                        //System.setProperty("webdriver.edge.driver", "WebDriver exe path in your machine");
                        //WebDriver driver = new EdgeDriver();
                    //    break;
                    default:
                        WebDriver = new ChromeDriver(GetChromeOptions());
                        break;
                }
                WebDriver.Manage().Window.Maximize();
                //WebDriver.Manage().Timeouts().ImplicitWait = new TimeSpan(0, 0, 30);
                WebDriver.Navigate().GoToUrl(url);
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }
        public static bool LaunchBrowser_prompt_download_false(String browserType, String url)
        {
            try
            {
                switch (browserType)
                {
                    case "IE":
                        WebDriver = new InternetExplorerDriver(GetIEOptions());
                        break;
                    case "Firefox":
                        WebDriver = new FirefoxDriver(GetFirefoxOptions());
                        break;
                    //case "Edge":
                    //WebDriver = new EdgeDriver();
                    //System.setProperty("webdriver.edge.driver", "WebDriver exe path in your machine");
                    //WebDriver driver = new EdgeDriver();
                    //    break;
                    default:
                        WebDriver = new ChromeDriver(GetChromeOptions_Prompt_Download_false());
                        break;
                }
                WebDriver.Manage().Window.Maximize();
                //WebDriver.Manage().Timeouts().ImplicitWait = new TimeSpan(0, 0, 30);
                WebDriver.Navigate().GoToUrl(url);
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }
        static ChromeOptions GetChromeOptions()
        {
            ChromeOptions options = new ChromeOptions();
            //options.AddUserProfilePreference("download.default_directory", GetDownloadsFolderPath());
            options.AddUserProfilePreference("download.prompt_for_download", true);
            return options;
        }
        static ChromeOptions GetChromeOptions_Prompt_Download_false()
        {
            ChromeOptions options = new ChromeOptions();
            //options.AddUserProfilePreference("download.default_directory", GetDownloadsFolderPath());
            options.AddUserProfilePreference("download.prompt_for_download", false);
            return options;
        }

        static FirefoxOptions GetFirefoxOptions()
        {
            FirefoxOptions options = new FirefoxOptions();
            options.SetPreference("browser.download.dir", GetDownloadsFolderPath());
            return options;
        }

        static InternetExplorerOptions GetIEOptions()
        {
            InternetExplorerOptions options = new InternetExplorerOptions();
            return options;
        }

        static String GetDownloadsFolderPath()
        {
            return FeatureContext.Current["DownloadsFolderPath"].ToString();
        }

        public static bool RefreshPage()
        {
            try
            {
                WebDriver.Navigate().Refresh();
                return true;
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool SwitchToWindow()
        {
            try
            {
                if (WebDriver != null)
                {
                    WebDriver.SwitchTo().Window(CurrentWindowHandle);
                    Thread.Sleep(2000);
                    return true;
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool SwitchToFrame()
        {
            CurrentWindowHandle = WebDriver != null ? WebDriver.CurrentWindowHandle : String.Empty;
            try
            {
                IControl form = SyncUtilities.FindVisibleElement(By.Name("frmDefault"));
                if (form.WebElement != null)
                {
                    IControl frame = SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.TagName("iframe"));
                    if (frame.WebElement != null)
                    {
                        WebDriver.SwitchTo().Frame(frame.WebElement);
                        Thread.Sleep(2000);
                        return true;
                    }
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }
        public static bool SwitchToNAFrame()
        {
            CurrentWindowHandle = WebDriver != null ? WebDriver.CurrentWindowHandle : String.Empty;
            try
            {
                IControl form = SyncUtilities.FindVisibleElement(By.Name("Show items with value that:"));
                if (form.WebElement != null)
                {
                    IControl frame = SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.TagName("iframe"));
                    if (frame.WebElement != null)
                    {
                        WebDriver.SwitchTo().Frame(frame.WebElement);
                        Thread.Sleep(2000);
                        return true;
                    }
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }
        public static bool DS_SwitchToFrame()
        {
            CurrentWindowHandle = WebDriver != null ? WebDriver.CurrentWindowHandle : String.Empty;
            try
            {
                IControl form = SyncUtilities.FindVisibleElement(By.Name("aspnetForm"));
                if (form.WebElement != null)
                {
                    IControl frame = SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.TagName("iframe"));
                    if (frame.WebElement != null)
                    {
                        WebDriver.SwitchTo().Frame(frame.WebElement);
                        Thread.Sleep(2000);
                        return true;
                    }
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }

        public static bool DS_SwitchToConfirmationFrame()
        {
            return DS_SwitchToFrame();
            //CurrentWindowHandle = WebDriver != null ? WebDriver.CurrentWindowHandle : String.Empty;
            //try
            //{
            //    IControl form = SyncUtilities.FindVisibleElement(By.Name("aspnetForm"));
            //    if (form.WebElement != null)
            //    {
            //        IControl frame = SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.TagName("table"));
            //        if (frame.WebElement != null)
            //        {
            //            WebDriver.SwitchTo().Frame(frame.WebElement);
            //            Thread.Sleep(2000);
            //            return true;
            //        }
            //    }
            //}
            //catch (Exception e)
            //{
            //}
            //return false;
        }

        public static bool SwitchToWebFocusFrame()
        {
            CurrentWindowHandle = WebDriver != null ? WebDriver.CurrentWindowHandle : String.Empty;
            try
            {
                IControl form = SyncUtilities.FindVisibleElement(By.XPath("//div[@class='output-area-frame ibx-widget ibx-iframe ibx-selection-manager ibx-sm-focus-default']"));
                if (form.WebElement != null)
                {
                    IControl frame = SyncUtilities.FindVisibleElement_Parent(form.WebElement, By.TagName("iframe"));
                    if (frame.WebElement != null)
                    {
                        BrowserUtilities.WebDriver.SwitchTo().Frame(frame.WebElement);
                        Thread.Sleep(2000);
                        return true;
                    }
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }
        public static bool SwitchToFrameUsingFrameName(String FrameName)
        {
            try
            {

                IControl frame = SyncUtilities.FindElement(By.XPath("//iframe[@name='" + FrameName + "']"));
                Thread.Sleep(3000);
                BrowserUtilities.WebDriver.SwitchTo().Frame(frame.WebElement);
                return true;
            }
            catch(Exception e)
            {
                return false;
            }
        }

        public static bool SwitchToDefaultContent()
        {
            try
            {
                BrowserUtilities.WebDriver.SwitchTo().DefaultContent();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }

        }
    }
}
