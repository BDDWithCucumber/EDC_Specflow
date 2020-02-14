using Common;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.CodeLists
{
    public class CodeListsGroupPage
    {
        public static IControl AddButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_RadListBoxSource > div.rlbButtonAreaRight.rlbMiddle > ul > li:nth-child(1) > button")); } }
        public static IControl RemoveButton { get { return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_RadListBoxSource > div.rlbButtonAreaRight.rlbMiddle > ul > li:nth-child(2) > button")); } }
        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnSave")); } }
        public static IControl CancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnCancel")); } }
        public static IControl GroupName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_GroupsControl_grdCodelistGroup_ctl00_ctl02_ctl04_txtCLName"));
            }
        }

        public static IControl GroupDesc
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_GroupsControl_grdCodelistGroup_ctl00_ctl02_ctl04_txtCLDesc"));
            }
        }

        public static IControl CodelistGroupItemSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_GroupsControl_grdCodelistGroup_ctl00_ctl02_ctl04_btnSave"));
            }
        }

        public static IControl LinkageSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_CodeListRelationControl_grdCodelistRelation_ctl00_ctl02_ctl04_btnSave"));
            }
        }

        public static IControl LinkageName
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_CodeListRelationControl_grdCodelistRelation_ctl00_ctl02_ctl04_txtCLName"));
            }
        }

        public static IControl LinkageDesc
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_CodeListRelationControl_grdCodelistRelation_ctl00_ctl02_ctl04_txtCLDesc"));
            }
        }

        public static IControl CodelistSelection
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ctl00_ContentBody_rcbCodeLists_Input"));
            }
        }
        public static IControl CodelistSelectionDropDown { get { return new Control(CodelistSelection.WebElement, new SelectElement(CodelistSelection.WebElement)); } }

        public static IControl PrimarySelectionDropDown { get { return new Control(PrimaryCodelist.WebElement, new SelectElement(PrimaryCodelist.WebElement)); } }

        public static IControl PrimaryCodelist
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_CodeListRelationControl_grdCodelistRelation_ctl00_ctl02_ctl04_ddlPrimaryCodelist_Input"));
            }
        }

        public static IControl SecondarySelectionDropDown { get { return new Control(SecondaryCodelist.WebElement, new SelectElement(SecondaryCodelist.WebElement)); } }

        public static IControl SecondaryCodelist
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_CodeListRelationControl_grdCodelistRelation_ctl00_ctl02_ctl04_ddlSecondaryCodelist_Input"));
            }
        }

        public static IControl CodelistGroupDropdownInvokerButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_rcbCodeLists_Arrow"));
            }
        }

        public static IControl GetCodelistGroupItem(String itemName)
        {
            try
            {
                List<IControl> items = GetCodelistGroupDropdownItems();
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

        static List<IControl> GetCodelistGroupDropdownItems()
        {
            try
            {
                IControl host = SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_rcbCodeLists_DropDown"));
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

        public static IControl AddNewCodelistGroup
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rgCommandCell > table > tbody > tr > td > div:nth-of-type(1) > a"));
            }
        }

        public static IControl PrimarySecondaryCodeListItemsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdCodeListRelationGroupItem_ctl00"));
            }
        }

        public static IControl CheckTheCheckBox
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_GroupsControl_grdCodelistGroup_ctl00_ctl04_colSelectSelectCheckBox"));
            }
        }
    }
}
