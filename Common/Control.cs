using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;

namespace Common
{
    public class Control : IControl
    {
        public IWebElement WebElement { get; }
        public SelectElement SelectElement { get; }
        public Control(IWebElement webElement)
        {
            this.WebElement = webElement;
        }
        public Control(IWebElement webElement, SelectElement selectElement)
        {
            this.WebElement = webElement;
            this.SelectElement = selectElement;
        }
    }
}
