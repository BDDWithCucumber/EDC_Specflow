using System.Collections.Generic;
using TechTalk.SpecFlow;

namespace Reports.OELog
{
    public class TableList
    {
        List<Table> List { get; set; }

        public void AddTable(Table table)
        {
            if (this.List == null)
            {
                this.List = new List<Table>();
            }
            this.List.Add(table);
        }

        public List<Table> GetTableList()
        {
            return this.List;
        }
    }
}