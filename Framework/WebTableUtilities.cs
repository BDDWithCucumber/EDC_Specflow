using Common;
using Common.WebTable;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using Utilities;

namespace Framework
{
    public static class WebTableUtilities
    {
        public static IControl Table_FindRow(IControl webTable, WebTable_SearchCriteriaItemList searchCreteriaItemList, int startRowIndex = 0)
        {
            IControl tableBody;
            if (webTable != null && webTable.WebElement != null)
            {
                if(webTable.WebElement.TagName == "tbody")
                {
                    tableBody = webTable;
                }
                else
                {
                    tableBody = SyncUtilities.FindElement_Parent(webTable.WebElement, By.XPath("./tbody"));                    
                }
                ReadOnlyCollection<IControl> rows = SyncUtilities.FindElements_Parent(tableBody.WebElement, By.TagName("tr"));
                for (int rowIndex = 0; rowIndex < rows.Count; ++rowIndex)
                {
                    IControl row = rows[rowIndex];
                    if (rowIndex >= startRowIndex)
                    {
                        if (HasRowContainsSearchContent(row.WebElement, searchCreteriaItemList))
                        {
                            return row;
                        }
                    }
                }
            }
            return null;
        }

        public static IControl GetRow(IControl webTable, int rowIndex)
        {
            IControl tableBody;
            if (webTable != null && webTable.WebElement != null)
            {
                if (webTable.WebElement.TagName == "tbody")
                {
                    tableBody = webTable;
                }
                else
                {
                    tableBody = SyncUtilities.FindElement_Parent(webTable.WebElement, By.XPath("./tbody"));
                }
                ReadOnlyCollection<IControl> rows = SyncUtilities.FindElements_Parent(tableBody.WebElement, By.XPath("./tr"));
                if(rows.Count > rowIndex)
                {
                    return rows[rowIndex];
                }
            }
            return null;
        }

        public static int GetRowCount(IControl webTable, out ReadOnlyCollection<IControl> rows)
        {
            rows = null;
            if (webTable != null && webTable.WebElement != null)
            {
                rows = GetRows(webTable);
                return rows.Count;
            }
            return 0;
        }

        public static IControl GetColumnHeader(IControl titleRow, String headerText, TableColumnContentType contentType, int occurance)
        {
            int count = 1;
            if (titleRow != null && titleRow.WebElement != null)
            {
                ReadOnlyCollection<IControl> headerCellList = SyncUtilities.FindElements_Parent(titleRow.WebElement, By.TagName("th"));
                foreach (IControl headerCell in headerCellList)
                {
                    if (contentType == TableColumnContentType.Link)
                    {
                        IControl headerCellLink = SyncUtilities.FindElement_Parent(headerCell.WebElement, By.TagName("a"));
                        if (headerCellLink.WebElement.Text.Equals(headerText, StringComparison.InvariantCultureIgnoreCase))
                        {
                            if (count == occurance)
                            {
                                return headerCellLink;
                            }
                            ++count;
                        }
                    }
                    else
                    {
                        if (headerCell.WebElement.Text.Equals(headerText, StringComparison.InvariantCultureIgnoreCase))
                        {
                            if (count == occurance)
                            {
                                return headerCell;
                            }
                            ++count;
                        }
                    }
                }
            }
            return null;
        }

        public static IControl GetColumnHeader(IControl titleRow, String headerText, TableColumnContentType contentType)
        {
            if (titleRow != null && titleRow.WebElement != null)
            {
                ReadOnlyCollection<IControl> headerCellList = SyncUtilities.FindElements_Parent(titleRow.WebElement, By.TagName("th"));
                foreach (IControl headerCell in headerCellList)
                {
                    if (contentType == TableColumnContentType.Link)
                    {
                        IControl headerCellLink = SyncUtilities.FindElement_Parent(headerCell.WebElement, By.TagName("a"));
                        if (headerCellLink.WebElement.Text.Equals(headerText, StringComparison.InvariantCultureIgnoreCase))
                        {
                            return headerCellLink;
                        }
                    }
                    else
                    {
                        if (headerCell.WebElement.Text.Trim().Equals(headerText.Trim(), StringComparison.InvariantCultureIgnoreCase))
                        {
                            return headerCell;
                        }
                    }
                }
            }
            return null;
        }
       
        public static List<String> GetValuesInColumn(IControl webTable, int colIndex)
        {
            List<String> list = new List<String>();
            ReadOnlyCollection<IControl> rows = null;
            GetRowCount(webTable, out rows);
            foreach (IControl row in rows)
            {
                ReadOnlyCollection<IControl> cellList = SyncUtilities.FindElements_Parent(row.WebElement, By.TagName("td"));
                if (colIndex < cellList.Count)
                {
                    IControl cell = cellList[colIndex];
                    list.Add(cell.WebElement.Text);
                }
            }
            return list;
        }

        public static String GetValue(IControl webTable,int rowIndex, int colIndex)
        {
            List<String> values = GetValuesInColumn(webTable, colIndex);
            if(values.Count > rowIndex)
            {
                return values[rowIndex];
            }
            return null;
        }

        public static IControl GetElement(IControl tableRow, String linkText, int columnIndex, TableColumnContentType contentType)
        {
            ReadOnlyCollection<IWebElement> cells = tableRow.WebElement.FindElements(By.XPath("./td"));
            IWebElement cell = null;
            if (cells.Count > columnIndex)
            {
                cell = cells[columnIndex];
            }
            switch (contentType)
            {
                case TableColumnContentType.Image:
                    return SyncUtilities.FindElement_Parent(cell, By.TagName("img"));
                case TableColumnContentType.Link:
                    return SyncUtilities.FindElement_Parent(cell, By.LinkText(linkText));
                case TableColumnContentType.Link_Partial:
                    return SyncUtilities.FindElement_Parent(cell, By.PartialLinkText(linkText));
                case TableColumnContentType.Dropdown:
                    IControl c = SyncUtilities.FindElement_Parent(cell, By.TagName("select"));
                    return new Control(c.WebElement, new SelectElement(c.WebElement));
                case TableColumnContentType.CheckboxAndText:
                case TableColumnContentType.Textbox:
                case TableColumnContentType.Checkbox:
                case TableColumnContentType.RadioButton:
                    return SyncUtilities.FindElement_Parent(cell, By.TagName("input"));
                case TableColumnContentType.Span:
                    return SyncUtilities.FindElement_Parent(cell, By.TagName("span"));
                default:
                    return null;
            }
        }

        public static IControl GetCell(IControl tableRow,int columnIndex)
        {
            ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(tableRow.WebElement, By.TagName("td"));
            if(cells.Count > columnIndex)
            {
                return cells[columnIndex];
            }
            return null;
        }

        public static IControl GetImage(IControl tableCell)
        {
            return SyncUtilities.FindElement_Parent(tableCell.WebElement, By.TagName("img"));
        }

        public static String GetText(IControl tableCell)
        {
            return Control_PropertyUtilities.GetText(tableCell);
        }

        public static IControl GetInputControl(IControl tableCell)
        {
            return SyncUtilities.FindElement_Parent(tableCell.WebElement, By.TagName("input"));
        }

        public static IControl GetInputControl_RadioButton(IControl tableCell)
        {
            return SyncUtilities.FindElement_Parent(tableCell.WebElement, By.CssSelector("input[type=radio]"));
        }

        public static IControl GetInputControl_Textbox(IControl tableCell)
        {
            return SyncUtilities.FindElement_Parent(tableCell.WebElement, By.CssSelector("input[type=text]"));
        }

        public static IControl GetLink(IControl tableCell)
        {
            return SyncUtilities.FindElement_Parent(tableCell.WebElement, By.TagName("a"));
        }

        public static ReadOnlyCollection<IControl> GetRows(IControl webTable)
        {
            IControl tableBody = SyncUtilities.FindElement_Parent(webTable.WebElement, By.TagName("tbody"));
            return SyncUtilities.FindElements_Parent(tableBody.WebElement, By.TagName("tr"));
        }

        public static IControl GetRowByRowIndex(IControl webTable, int rowIndex)
        {
            IControl tableBody = SyncUtilities.FindElement_Parent(webTable.WebElement, By.TagName("tbody"));
            ReadOnlyCollection<IControl> rows = SyncUtilities.FindElements_Parent(tableBody.WebElement, By.TagName("tr"));
            if(rows.Count > rowIndex)
            {
                return rows[rowIndex];
            }
            return null;
        }


        #region FilterRow
        public static IControl GetFilterTextbox(IControl filterRow, int columnIndex)
        {
            IControl filterCell = GetFilterCell(filterRow, columnIndex);
            if (filterCell != null)
            {
                return SyncUtilities.FindVisibleElement_Parent(filterCell.WebElement, By.CssSelector("input[class='k-input'][data-role='autocomplete']"));
            }
            return null;
        }
        public static IControl GetFilterCriteriaIcon(IControl filterRow, int columnIndex)
        {
            IControl filterCell = GetFilterCell(filterRow, columnIndex);
            if (filterCell != null)
            {
                return SyncUtilities.FindVisibleElement_Parent(filterCell.WebElement, By.CssSelector("span[role='listbox']"));
            }
            return null;
        }

        public static bool HasText(IControl siteRow, int columnIndex, String cellText)
        {
            ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(siteRow.WebElement, By.TagName("td"));
            if (cells.Count > columnIndex)
            {
                return HasText(cells[columnIndex].WebElement, cellText);
            }
            return false;
        }

        public static IControl GetClearFilterButton(IControl filterRow, int columnIndex)
        {
            IControl filterCell = GetFilterCell(filterRow, columnIndex);
            if (filterCell != null)
            {
                return SyncUtilities.FindVisibleElement_Parent(filterCell.WebElement, By.CssSelector("button[title='Clear']"));
            }
            return null;
        }
        static IControl GetFilterCell(IControl filterRow, int columnIndex)
        {
            if (filterRow != null && filterRow.WebElement != null)
            {
                ReadOnlyCollection<IControl> filterCellList = SyncUtilities.FindElements_Parent(filterRow.WebElement, By.TagName("th"));
                if (columnIndex < filterCellList.Count)
                {
                    return filterCellList[columnIndex];
                }
            }
            return null;
        }
        #endregion

        #region Private
        static bool HasColumnContainsSearchContent(IWebElement cell, WebTable_SearchCriteriaItem searchCreteriaItem)
        {
            switch (searchCreteriaItem.ColumnContentType)
            {
                case TableColumnContentType.Image:
                    return HasImage(cell, searchCreteriaItem.Value);
                case TableColumnContentType.Link:
                    return HasLink(cell, searchCreteriaItem.Value);
                case TableColumnContentType.CheckboxAndText:
                    return HasCheckboxAndText(cell, searchCreteriaItem.Value);
                case TableColumnContentType.Dropdown:
                    return HasDropdown(cell);
                case TableColumnContentType.Text:
                    return HasText(cell, searchCreteriaItem.Value);
                case TableColumnContentType.Text_Partial:
                    return HasText_Partial(cell, searchCreteriaItem.Value);
                default:
                    return false;
            }
        }
        static bool HasImage(IWebElement cell, string value)
        {
            IControl c = SyncUtilities.FindElement_Parent(cell, By.TagName("img"));
            if (c != null && c.WebElement != null)
            {
                String propertyValue = c.WebElement.GetProperty("src");
                return propertyValue.Contains(value);
            }
            return false;
        }
        static bool HasLink(IWebElement cell, string value)
        {
            IControl c = SyncUtilities.FindElement_Parent(cell, By.LinkText(value));
            return c != null && c.WebElement != null;
        }
        static bool HasCheckboxAndText(IWebElement cell, string value)
        {
            IControl c = SyncUtilities.FindElement_Parent(cell, By.TagName("input"));
            return c != null && c.WebElement != null && value.Equals(cell.Text.Trim());
        }
        static bool HasDropdown(IWebElement cell)
        {
            IControl c = SyncUtilities.FindElement_Parent(cell, By.TagName("select"));
            return c != null && c.WebElement != null;
        }
        static bool HasText(IWebElement cell, string value)
        {
            return cell.Text.Trim().Equals(value.Trim(), StringComparison.InvariantCultureIgnoreCase);
        }

        static bool HasText_Partial(IWebElement cell, string value)
        {
            return cell.Text.Contains(value);
        }

        static bool HasRowContainsSearchContent(IWebElement row, WebTable_SearchCriteriaItemList searchCreteriaItemList)
        {
            ReadOnlyCollection<IWebElement> cells = row.FindElements(By.TagName("td"));
            foreach (WebTable_SearchCriteriaItem searchCreteriaItem in searchCreteriaItemList.List)
            {
                if (cells.Count > searchCreteriaItem.ColumnIndex)
                {
                    IWebElement cell = cells[searchCreteriaItem.ColumnIndex];
                    if (!HasColumnContainsSearchContent(cell, searchCreteriaItem))
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            return true;
        }
        #endregion
    }
}