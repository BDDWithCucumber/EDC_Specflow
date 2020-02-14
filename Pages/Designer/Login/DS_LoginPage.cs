using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.Login
{
    public static class DS_LoginPage
    {
        public static IControl UserNameTextBox { get { return SyncUtilities.FindElement(By.Id("Login_ContentBody_txtUsername")); } }
        public static IControl PasswordTextBox { get { return SyncUtilities.FindElement(By.Id("Login_ContentBody_txtPassword")); } }
        public static IControl LoginButton { get { return SyncUtilities.FindElement(By.Id("Login_ContentBody_btnLogin")); } }
    }
}
