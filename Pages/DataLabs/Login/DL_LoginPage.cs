using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Login
{
    public static class DL_LoginPage
    {
        public static IControl UserNameTextbox { get { return SyncUtilities.FindElement(By.Id("txtUsername")); } }

        public static IControl PasswordTextbox { get { return SyncUtilities.FindElement(By.Id("txtPassword")); } }

        public static IControl LoginButton { get { return SyncUtilities.FindElement(By.Id("btnLogin")); } }
    }
}