using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.Domains
{
    public class DS_QuestionPage
    {
        public static IControl CodelistGroupDropdownInvokerButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_questionTab_questionData_rcbGroups > .rcbInner > button"));
            }
        }
        public static IControl CodelistLinkageDropdownInvokerButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_questionTab_questionData_rcbLinkages > .rcbInner > button"));
            }
        }  
        public static IControl CodelistLinkage_ItemNameDropdownInvokerButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_questionTab_questionData_rcbItems > .rcbInner > button"));
            }
        }


        static List<IControl> GetCodelistGroupDropdownItems()
        {
            try
            {
                IControl host = SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_questionData_rcbGroups_DropDown"));
                if (!Control_PropertyUtilities.IsControlNull(host))
                {
                    return SyncUtilities.FindVisibleElements_Parent(host.WebElement, By.CssSelector(".rcbScroll > ul > li")).ToList<IControl>();
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        static List<IControl> GetCodelistLinkageDropdownItems()
        {
            try
            {
                IControl host = SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_questionData_rcbLinkages_DropDown"));
                if (!Control_PropertyUtilities.IsControlNull(host))
                {
                    return SyncUtilities.FindVisibleElements_Parent(host.WebElement, By.CssSelector(".rcbScroll > ul > li")).ToList<IControl>();
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        static List<IControl> GetCodelistLinkage_Item_DropdownItems()
        {
            try
            {
                IControl host = SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_questionData_rcbItems_DropDown"));
                if (!Control_PropertyUtilities.IsControlNull(host))
                {
                    return SyncUtilities.FindVisibleElements_Parent(host.WebElement, By.CssSelector(".rcbScroll > ul > li")).ToList<IControl>();
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }


        public static IControl GetCodelistGroupItem(String itemName)
        {
            try
            {
                List<IControl> items = GetCodelistGroupDropdownItems();
                foreach (IControl item in items)
                {
                    String itemText = Control_PropertyUtilities.GetText(item);
                    if(itemText.Equals(itemName, StringComparison.InvariantCultureIgnoreCase))
                    {
                        return item;
                    }
                }
            }
            catch(Exception e)
            {

            }
            return null;
        }

        public static IControl GetCodelistLinkageItem(String itemName)
        {
            try
            {
                List<IControl> items = GetCodelistLinkageDropdownItems();
                foreach (IControl item in items)
                {
                    String itemText = Control_PropertyUtilities.GetText(item);
                    if (itemText.Equals(itemName, StringComparison.InvariantCultureIgnoreCase))
                    {
                        return item;
                    }
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static IControl GetCodelistLinkageItem_Item(String itemName)
        {
            try
            {
                List<IControl> items = GetCodelistLinkage_Item_DropdownItems();
                foreach (IControl item in items)
                {
                    String itemText = Control_PropertyUtilities.GetText(item);
                    if (itemText.Equals(itemName, StringComparison.InvariantCultureIgnoreCase))
                    {
                        return item;
                    }
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }        

        public static IControl AutoBuildQuestionSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_btnSaveClose"));
            }
        }

        public static IControl QuestionSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_SaveClose2"));
            }
        }

        public static IControl QuestionSaveAndNext
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_questionTab_SaveNext2"));
            }
        }

    }
}
