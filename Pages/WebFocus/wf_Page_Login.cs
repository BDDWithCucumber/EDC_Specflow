using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.WebFocus
{
    public static class wf_Page_Login
    {
        public static IControl UserNameTextbox { get { return SyncUtilities.FindElement(By.Id("SignonUserName")); } }

        public static IControl PasswordTextbox { get { return SyncUtilities.FindElement(By.Id("SignonPassName")); } }

        public static IControl LoginButton { get { return SyncUtilities.FindElement(By.Id("SignonbtnLogin")); } }
    }
}
