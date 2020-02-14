using System;

namespace Common.WebTable
{
    public class WebTable_SearchCriteriaItem
    {
        public int ColumnIndex { get; }
        public String Value { get; }
        public TableColumnContentType ColumnContentType { get; }
        public WebTable_SearchCriteriaItem(int columnIndex, String value, TableColumnContentType columnContentType)
        {
            this.ColumnIndex = columnIndex;
            this.Value = value;
            this.ColumnContentType = columnContentType;
        }
    }
}
