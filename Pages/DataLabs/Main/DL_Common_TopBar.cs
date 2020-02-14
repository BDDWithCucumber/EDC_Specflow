using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Main
{
    public class DL_Common_TopBar
    {
        public static IControl StudyLabelLink
        {
            get
            {
                IControl siteNavDiv = SyncUtilities.FindElement(By.ClassName("site-nav"));
                IControl siteNavAdminSectionDiv = SyncUtilities.FindVisibleElement_Parent(siteNavDiv.WebElement, By.ClassName("site-nav__section--admin"));
                IControl studyLabelLink = SyncUtilities.FindVisibleElement_Parent(siteNavAdminSectionDiv.WebElement, By.ClassName("tipsyTooltipStudyLabel"));
                return studyLabelLink;
            }
        }
        public static IControl AdvanceSearchLink
        {
            get
            {
                IControl siteNavDiv = SyncUtilities.FindElement(By.ClassName("site-nav"));
                IControl siteNavAdminSectionDiv = SyncUtilities.FindVisibleElement_Parent(siteNavDiv.WebElement, By.ClassName("site-nav__section--admin"));
                return SyncUtilities.FindVisibleElement_Parent(siteNavAdminSectionDiv.WebElement, By.Id("ucHeader_lnkAdvSearch"));
            }

        }
        public static IControl LogoutLink { get { return SyncUtilities.FindElement(By.Id("ucHeader_lnkLogout")); } }
        public static IControl HelpIcon
        {
            get
            {
                IControl siteNavDiv = SyncUtilities.FindElement(By.ClassName("site-nav"));
                IControl siteNavAdminSectionDiv = SyncUtilities.FindVisibleElement_Parent(siteNavDiv.WebElement, By.ClassName("site-nav__section--admin"));
                return SyncUtilities.FindVisibleElement_Parent(siteNavAdminSectionDiv.WebElement, By.ClassName("sprite--help"));
            }
        }

        public static IControl GetMainTabHeader(String mainTabName)
        {
            IControl host = SyncUtilities.FindVisibleElement(By.CssSelector("#primary-nav.primary-nav.sitenav-primarytabs"));
            ReadOnlyCollection<IControl> headerList = SyncUtilities.FindVisibleElements_Parent(host.WebElement, By.TagName("li"));
            foreach (IControl c in headerList)
            {
                IControl headerLink = SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.TagName("a"));
                if (!Control_PropertyUtilities.IsControlNull(headerLink))
                {
                    String text = Control_PropertyUtilities.GetText(headerLink);
                    if(text.Trim().Equals(mainTabName, StringComparison.InvariantCultureIgnoreCase))
                    {
                        return c;
                    }
                }
            }
            return null;
        }
    }
}