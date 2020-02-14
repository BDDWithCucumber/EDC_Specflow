using System.Collections.Generic;

namespace Common.WebTable
{
    public class WebTable_SearchCriteriaItemList
    {
        public List<WebTable_SearchCriteriaItem> List { get; set; }

        public WebTable_SearchCriteriaItemList()
        {
            this.List = new List<WebTable_SearchCriteriaItem>();
        }

        public void AddSearchItem(WebTable_SearchCriteriaItem searchItem)
        {
            this.List.Add(searchItem);
        }
    }
}
