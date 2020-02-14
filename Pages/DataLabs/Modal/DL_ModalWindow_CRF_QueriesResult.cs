using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Modal
{
    public class DL_ModalWindow_CRF_QueriesResult
    {
        public static IControl Header
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("lyrCaption"));
            }
        }

        public static IControl ContinueButton
        {
            get
            {
                return SyncUtilities.FindClickableElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnContinue"));
            }
        }

        public static IControl BackToCRFButton
        {
            get
            {
                //return SyncUtilities.FindClickableElement(By.Id("ctl00_ctl00_CPH_body_ContentBody_btnCancel"));
                return SyncUtilities.FindClickableElement(By.CssSelector("input[type='submit'][value='Back to CRF']"));
            }
        }

        public static ReadOnlyCollection<IControl> GetQueryList(String queriesType)
        {
            try
            {
                IControl messageHolderCell = SyncUtilities.FindVisibleElement(By.ClassName("modMessageHolder"));
                if (messageHolderCell != null && messageHolderCell.WebElement != null)
                {
                    ReadOnlyCollection<IControl> messageBlockList = SyncUtilities.FindVisibleElements_Parent(messageHolderCell.WebElement, By.ClassName("modMessage"));
                    if (messageBlockList != null && messageBlockList.Count > 0)
                    {
                        foreach (IControl c in messageBlockList)
                        {
                            if (c.WebElement.Text.StartsWith(queriesType, StringComparison.InvariantCultureIgnoreCase))
                            {
                                return SyncUtilities.FindVisibleElements_Parent(c.WebElement, By.TagName("li"));
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }
            return null;
        }
    }
}