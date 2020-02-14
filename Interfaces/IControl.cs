using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;

namespace Interfaces
{
    public interface IControl
    {
        IWebElement WebElement { get; }
        SelectElement SelectElement { get; }
    }
}
