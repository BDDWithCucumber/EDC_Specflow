using BusinessProcesses.Forms;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.Designer.Data;
using Pages.Designer.Pager;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;


namespace BusinessProcesses.Designer.VerifyStudy
{
    public class BP_DS_CreateFormFromExisitng
    {

        public static bool VerifyTheVerifyButtonAtTop()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_PropertyUtilities.IsControlVisible(CreateFormFromExisting.VerifybuttonTop);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickOnSave()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_PropertyUtilities.IsControlVisible(CreateFormFromExisting.SaveButton);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifyTheVerifyButtonAtBottom()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_PropertyUtilities.IsControlVisible(CreateFormFromExisting.VerifybuttonBottom);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyTheVerbiageComponents(string text)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                text.Contains(Control_PropertyUtilities.GetText(CreateFormFromExisting.VerifyTextComponents));
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyTheVerbiageExistsinTarget(string text)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                text.Contains(Control_PropertyUtilities.GetText(CreateFormFromExisting.VerifyTextExixtsinTarget));
                CreateFormFromExisting.VerifyTextExixtsinTarget.WebElement.GetCssValue("color").Equals("Orange");
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyTheVerbiageUseExisting(string text)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                text.Contains(Control_PropertyUtilities.GetText(CreateFormFromExisting.VerifyTextUseExiting));
                CreateFormFromExisting.VerifyTextUseExiting.WebElement.GetCssValue("color").Equals("orange");
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickOnCancelButton()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_ActionUtilities.Click(CreateFormFromExisting.CancelButton, "Not abletofindcancel button");

                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ColumnHeadingRow(List<CreateFrFromxisiting> columnNames)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                List<string> columnHeadings = new List<string>();
                foreach (CreateFrFromxisiting columnName in columnNames)
                {
                    columnHeadings.Add(columnName.ColumnHeading);
                }
                foreach (CreateFrFromxisiting gridColumnName in columnNames)
                {
                    int indexing = Int32.Parse(gridColumnName.Index);
                   // IControl columnNameLink = WebTableUtilities.GetColumnHeader(CreateFormFromExisting.ColumnHeadingRow, gridColumnName.ColumnHeading, TableColumnContentType.Text);
                    IControl columnNameLink = CreateFormFromExisting.ColumnHeadingRow1(indexing);
                    Control_PropertyUtilities.GetText(columnNameLink).Equals(gridColumnName.ColumnHeading);
                    if (Control_PropertyUtilities.IsControlNull(columnNameLink))
                    {
                       
                        return false;
                    }
                }
                return true;

                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool ColumnHeadingRowNotBeDisplayed(List<CreateFrFromxisiting> columnNames)
        {
            IControl columnNameLink;
            bool a;
            BrowserUtilities.DS_SwitchToFrame();
            try
            {               
                foreach (CreateFrFromxisiting gridColumnName in columnNames)
                {
                    int indexing = Int32.Parse(gridColumnName.Index);                    
                     columnNameLink = CreateFormFromExisting.ColumnHeadingRow1(indexing);                    
                    if (!Control_PropertyUtilities.IsControlNull(columnNameLink))
                    {
                        string text = Control_PropertyUtilities.GetText(columnNameLink);
                         a = text.Equals(gridColumnName.ColumnHeading);                       
                        if (a == true)
                        {                   

                            return false;
                        }
                        
                    }
                }           

                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool FindForm(String form)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                NavigateToFirstPage(DS_PagerControl.FirstPagePopupImage);
                do
                {
                    IControl formRow = FindFormRow(form);
                    if (formRow != null)
                    {
                        Control_PropertyUtilities.IsControlVisible(formRow);
                        return true;
                    }
                }
                while (NavigateToNextPage(DS_PagerControl.NextPagePopupImage));



                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        static IControl FindFormRow(String form)
        {
            WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, form, TableColumnContentType.Link));
            IControl formRow = WebTableUtilities.Table_FindRow(CreateFormFromExisting.FormTableInCreateFormFromExisting, searchList);
            if (formRow != null)
            {
                return formRow;
            }
            return null;
        }
        public static IControl FindQuestionInForm(String form)
        {
            WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
            searchList.AddSearchItem(new WebTable_SearchCriteriaItem(0, form, TableColumnContentType.Link));
            IControl formRow = WebTableUtilities.Table_FindRow(CreateFormFromExisting.FormTableInCreateFormFromExisting, searchList);
            if (formRow != null)
            {
                return formRow;
            }
            return null;
        }


        internal static bool NavigateToFirstPage(IControl pager)
        {
            return ClickPageNavigationButton(DS_PagerControl.GetFirstPageIcon(pager));
        }
        internal static bool NavigateToNextPage(IControl pager)
        {
            return ClickPageNavigationButton(DS_PagerControl.GetlastPageIcon(pager));
        }

        static bool ClickPageNavigationButton(IControl c)
        {
            bool found = false;
            String cssValue = Control_PropertyUtilities.GetAttributeValue(c, "class", out found);
            if (!cssValue.Contains("k-state-disabled"))
            {
                return Control_ActionUtilities.Click(c, String.Empty);
            }
            return false;
        }
        
         public static bool VerifyDuplicateDomainData(IEnumerable<CreateFormfromExistingTable> createformfromexisting)
        {
            BrowserUtilities.DS_SwitchToFrame();
            int i = 5;

            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                {          
                        
                   
                    GetBackGroundColor(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                    GetBackGroundColor(rows[i], cffe.Include1, 1, TableColumnContentType.Textbox);
                    //Control_PropertyUtilities.VerifyAttributeValue(element, "color", "orange");
                    //element.WebElement.GetAttribute("color").Equals("orange");


                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyNonDuplicateDomainData(IEnumerable<CreateFormfromExistingTable> createformfromexisting, string field)
        {
            BrowserUtilities.DS_SwitchToFrame();
            int i = 5;

            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                {
                    if(field.Equals("Domain"))
                    {
                        IControl element = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                        string value1 = element.WebElement.GetAttribute("color");
                        if (value1 == null)
                        {

                        }

                    }
                    if (field.Equals("FlatQuestion"))
                    {
                        i = 6;
                        IControl element = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                        string value1 = element.WebElement.GetAttribute("color");
                        if (value1 == null)
                        {

                        }
                    }
                    if (field.Equals("TableQuestion"))
                    {
                        i = 8;
                        IControl element = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                        string value1 = element.WebElement.GetAttribute("color");
                        if (value1 == null)
                        {

                        }
                    }
                    if (field.Equals("AutoBuildTableQuestion"))
                    {
                        i = 12;
                        IControl element = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                        string value1 = element.WebElement.GetAttribute("color");
                        if (value1 == null)
                        {

                        }
                    }

                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyDuplicateDomainItem(IEnumerable<CreateFormfromExistingTable> createformfromexisting)
        {
            BrowserUtilities.DS_SwitchToFrame();
            int i = 5;

            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                {                    
                    //GetTableDataForInclude1RowControlDisabled(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                    //GetTableDataForInclude1RowControlUnchecked(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                    GetBackGroundColor(rows[i], cffe.Include1, 1, TableColumnContentType.Textbox);
                    
                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyNonDuplicateDomainItem(IEnumerable<CreateFormfromExistingTable> createformfromexisting, string field)
        {
            BrowserUtilities.DS_SwitchToFrame();
            int i = 5;

            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                {
                    
                    if(field.Equals("FlatQuestion"))
                    {
                        i = 6;
                        IControl element1 = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                        String value = element1.WebElement.GetAttribute("color");                        
                        if (value == null)
                        {

                        }
                    }
                    if (field.Equals("TableQuestion"))
                    {
                        i = 9;
                        IControl element1 = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                        String value = element1.WebElement.GetAttribute("color");
                        if (value == null)
                        {

                        }
                    }
                    if (field.Equals("AutoBuildTableQuestion"))
                    {
                        i = 11;
                        IControl element1 = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                        String value = element1.WebElement.GetAttribute("color");
                        if (value == null)
                        {

                        }
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetFormFields(IEnumerable<CreateFormfromExistingTable> createformfromexisting)
        {
            BrowserUtilities.DS_SwitchToFrame();
            int i = 0;

            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                {
                    IControl targetElement = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                    Control_ActionUtilities.Textbox_SetText(targetElement, cffe.Target1, "NotAbleToSetTheTargetElement");
                    ++i;

                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
         public static bool SetDomainFields(IEnumerable<CreateFormfromExistingTable> createformfromexisting)
        {
            BrowserUtilities.DS_SwitchToFrame();
            int i = 5;

            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                {
                    IControl targetElement = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                    Control_ActionUtilities.Textbox_SetText(targetElement, cffe.Target1, "NotAbleToSetTheTargetElement");

                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetDomainItemFields(IEnumerable<CreateFormfromExistingTable> createformfromexistings, string field)
        {
            BrowserUtilities.DS_SwitchToFrame();
            //int i = 6;

            try
            {
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(2, createformfromexisting.Source1, TableColumnContentType.Textbox));
                    IControl tableRow = WebTableUtilities.Table_FindRow(CreateFormFromExisting.FormTableInCreateFormFromExisting, list);
                    if (Control_PropertyUtilities.IsControlNull(tableRow))
                    {
                        Control_ActionUtilities.Textbox_SetText(tableRow, createformfromexisting.Target1, "NotAbleToSetTheTargetElement");
                        
                    }
                }              


                //ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                //foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                //{ if(field.Equals("FlatQuestion"))
                //    {
                //        IControl targetElement = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                //        Control_ActionUtilities.Textbox_SetText(targetElement, cffe.Target1, "NotAbleToSetTheTargetElement");
                //    }
                //    if (field.Equals("TableQuestion"))
                //    {
                //        i = 9;
                //        IControl targetElement = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                //        Control_ActionUtilities.Textbox_SetText(targetElement, cffe.Target1, "NotAbleToSetTheTargetElement");
                //    }
                //    if (field.Equals("AutoBuildTableQuestion"))
                //    {
                //        i = 11;
                //        IControl targetElement = WebTableUtilities.GetElement(rows[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                //        Control_ActionUtilities.Textbox_SetText(targetElement, cffe.Target1, "NotAbleToSetTheTargetElement");
                //    }

                //}
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyTableData(IEnumerable<CreateFormfromExistingTable> createformfromexisting)
        {

            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                int i = 0;
                ReadOnlyCollection<IControl> rows1 = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                {


                    if (cffe.ColumnHeader1 != "")
                    {

                        IControl element = WebTableUtilities.GetElement(rows1[i], cffe.ColumnHeader1, 0, TableColumnContentType.Span);
                        String elevalue = element.WebElement.Text.Trim();
                        bool a = elevalue.Equals(cffe.ColumnHeader1);

                    }
                    if (cffe.Include1 != "")
                    {
                        if (cffe.Include1.Equals("checked"))
                        {
                            IControl element1 = WebTableUtilities.GetElement(rows1[i], cffe.Include1, 1, TableColumnContentType.Span);
                            element1.WebElement.GetAttribute("checked").Equals("true");
                            //bool a1 = elevalue1.Equals(cffe.Include1);

                        }

                    }
                    if (cffe.Source1 != "")
                    {
                        IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Source1, 2, TableColumnContentType.Span);
                        String elevalue = element.WebElement.Text;
                        bool a = elevalue.Equals(cffe.Source1);

                    }
                    if (cffe.Target1 != "")
                    {
                        if (i.Equals(5))
                        {
                            IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Target1, 3, TableColumnContentType.Span);
                            String elevalue = element.WebElement.GetAttribute("value");
                            bool a = elevalue.Equals(cffe.Target1);

                        }
                        else if (!i.Equals(5))
                        {
                            IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                            String elevalue = element.WebElement.GetAttribute("value");
                            bool a = elevalue.Equals(cffe.Target1);

                        }


                    }
                    if (cffe.ColumnHeader2 != "")
                    {
                        IControl element = WebTableUtilities.GetElement(rows1[i], cffe.ColumnHeader2, 4, TableColumnContentType.Span);
                        String elevalue = element.WebElement.Text;
                        bool a = elevalue.Equals(cffe.ColumnHeader1);

                    }
                    if (cffe.Include2 != "")
                    {
                        IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Include2, 5, TableColumnContentType.Span);
                        element.WebElement.GetAttribute("checked").Equals("true");


                    }
                    if (cffe.Source2 != "")
                    {
                        IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Source2, 6, TableColumnContentType.Textbox);
                        String elevalue = element.WebElement.Text;
                        bool a = elevalue.Equals(cffe.ColumnHeader1);

                    }
                    if (cffe.Target2 != "")
                    {
                        if (i.Equals(5))
                        {
                            IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Target2, 3, TableColumnContentType.Span);
                            String elevalue = element.WebElement.GetAttribute("value");
                            bool a = elevalue.Equals(cffe.Target1);

                        }
                        else if (!i.Equals(5))
                        {
                            IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Target2, 3, TableColumnContentType.Textbox);
                            String elevalue = element.WebElement.GetAttribute("value");
                            bool a = elevalue.Equals(cffe.Target1);

                        }
                    }
                    ++i;
                }

                Control_PropertyUtilities.IsControlVisible(CreateFormFromExisting.VerifybuttonTop);
                BrowserUtilities.SwitchToWindow();
                return true;
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool GetTableDataForInclude1RowControlDisabled(IControl i, string linkText, int columnindex, TableColumnContentType tableColumnContentType)
        {
            IControl element1 = WebTableUtilities.GetElement(i, linkText, columnindex, tableColumnContentType);
            return Control_PropertyUtilities.IsControlDisabled(element1);         
            
            
        }
        static bool GetTableDataForInclude1RowControlEnabled(IControl i, string linkText, int columnindex, TableColumnContentType tableColumnContentType)
        {
            IControl element1 = WebTableUtilities.GetElement(i, linkText, columnindex, tableColumnContentType);
            return Control_PropertyUtilities.IsEnabled(element1);
        }
        static bool GetTableDataForInclude1RowSelectCheckbox(IControl i, string linkText, int columnindex, TableColumnContentType tableColumnContentType)
        {
            IControl element1 = WebTableUtilities.GetElement(i, linkText, columnindex, tableColumnContentType);
            return Control_ActionUtilities.CheckCheckbox(element1);
        }
        
        static bool GetTableDataForInclude1RowControlUnchecked(IControl i, string linkText, int columnindex, TableColumnContentType tableColumnContentType)
        {
            IControl element1 = WebTableUtilities.GetElement(i, linkText, columnindex, tableColumnContentType);
            return Control_PropertyUtilities.VerifyAttributeValue(element1, "unchecked", "true" );           

        }
        static bool GetTableDataForInclude1RowControlchecked(IControl i, string linkText, int columnindex, TableColumnContentType tableColumnContentType)
        {
            IControl element1 = WebTableUtilities.GetElement(i, linkText, columnindex, tableColumnContentType);
            return Control_PropertyUtilities.VerifyAttributeValue(element1, "checked", "true");

        }

        static bool GetBackGroundColor(IControl i, string linkText, int columnindex, TableColumnContentType tableColumnContentType)
        {
            IControl element1 = WebTableUtilities.GetElement(i, linkText, columnindex, tableColumnContentType);
            return Control_PropertyUtilities.VerifyAttributeValue(element1, "color", "orange");

        }        
        static bool GetTableDataForSource1Row(IControl i, string linkText, int columnindex, TableColumnContentType tableColumnContentType)
        {
            IControl element1 = WebTableUtilities.GetElement(i, linkText, columnindex, tableColumnContentType);
            bool b = element1.WebElement.GetAttribute("value").Equals(linkText);           
            return b;

        }
        static bool GetTableDataForTarget1Row(IControl i, string linkText, int columnindex, TableColumnContentType tableColumnContentType)
        {
            IControl element1 = WebTableUtilities.GetElement(i, linkText, columnindex, tableColumnContentType);
            bool b = element1.WebElement.Text.Equals(linkText);
            bool a = element1.WebElement.GetAttribute("color").Equals("orange");
            return (a && b);
        }

        static bool GetTableDataForColumnHeader1Row(IControl i, string linkText, int columnindex, TableColumnContentType tableColumnContentType)
        {
            IControl element1 = WebTableUtilities.GetElement(i, linkText, columnindex, tableColumnContentType);
            bool b = element1.WebElement.Text.Equals(linkText);
            return b;
        }

        static bool GetTableDataForColumnHeader2Row(IControl i, string linkText, int columnindex, TableColumnContentType tableColumnContentType)
        {
            IControl element1 = WebTableUtilities.GetElement(i, linkText, columnindex, tableColumnContentType);
            bool b = element1.WebElement.Text.Equals(linkText);
            return b;
        }



        //public static bool VerifyCheckboxstatus(IEnumerable<CreateFormfromExistingTable> createformfromexisting)
        //{
        //    BrowserUtilities.DS_SwitchToFrame();
        //    int i = 6;

        //    try
        //    {
        //        ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
        //        foreach (CreateFormfromExistingTable cffe in createformfromexisting)
        //        {
        //            GetTableDataForInclude1RowControlDisabled(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
        //            GetTableDataForInclude1RowControlUnchecked(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
        //        }
        //        BrowserUtilities.SwitchToWindow();
        //        return true;
        //    }
        //    catch (Exception e)
        //    {
        //        new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
        //    }
        //    return false;
        //}
        public static bool VerifyCheckboxEnabled(IEnumerable<CreateFormfromExistingTable> createformfromexistings, string field)
        {
            BrowserUtilities.DS_SwitchToFrame();
            //int i = 6;

            try
            {
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(2, createformfromexisting.Target3, TableColumnContentType.Span));
                    IControl tableRow = WebTableUtilities.Table_FindRow(CreateFormFromExisting.FormTableInCreateFormFromExisting, list);
                    if (Control_PropertyUtilities.IsControlNull(tableRow))
                    {
                        GetTableDataForInclude1RowControlEnabled(tableRow, createformfromexisting.Include1, 1, TableColumnContentType.Checkbox);
                    }
                }
                //ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                //foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                //{
                //    //GetTableDataForInclude1RowControlDisabled(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    if (field.Equals("FlatQuestion"))
                //    {
                //        GetTableDataForInclude1RowControlEnabled(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //    if (field.Equals("TableQuestion"))
                //    {
                //        i = 9;
                //        GetTableDataForInclude1RowControlEnabled(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //    if (field.Equals("AutoBuildTableQuestion"))
                //    {
                //        i = 11;
                //        GetTableDataForInclude1RowControlEnabled(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //}
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SelectCheckbox(IEnumerable<CreateFormfromExistingTable> createformfromexistings, string field)
        {
            BrowserUtilities.DS_SwitchToFrame();
           // int i = 6;

            try
            {
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(2, createformfromexisting.Target3, TableColumnContentType.Text));
                    IControl tableRow = WebTableUtilities.Table_FindRow(CreateFormFromExisting.FormTableInCreateFormFromExisting, list);
                    if (Control_PropertyUtilities.IsControlNull(tableRow))
                    {
                        GetTableDataForInclude1RowSelectCheckbox(tableRow, createformfromexisting.Include1, 1, TableColumnContentType.Checkbox);

                    }
                }
                //ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                //foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                //{
                //    //GetTableDataForInclude1RowControlDisabled(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    if (field.Equals("FlatQuestion"))
                //    {
                //        GetTableDataForInclude1RowSelectCheckbox(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //    if (field.Equals("TableQuestion"))
                //    {
                //        i = 9;
                //        GetTableDataForInclude1RowSelectCheckbox(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //    if (field.Equals("AutoBuildTableQuestion"))
                //    {
                //        i = 11;
                //        GetTableDataForInclude1RowSelectCheckbox(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //}
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifyCodelistBox(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            // int i = 6;

            try
            {
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(2, createformfromexisting.Target3, TableColumnContentType.Text));
                    IControl tableRow = WebTableUtilities.Table_FindRow(CreateFormFromExisting.FormTableInCreateFormFromExisting, list);
                    ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    if (Control_PropertyUtilities.IsControlNull(tableRow))
                    {
                        GetTableDataForInclude1RowSelectCheckbox(rows[row], createformfromexisting.Include1, 1, TableColumnContentType.Checkbox);

                    }
                }
                //ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                //foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                //{
                //    //GetTableDataForInclude1RowControlDisabled(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    if (field.Equals("FlatQuestion"))
                //    {
                //        GetTableDataForInclude1RowSelectCheckbox(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //    if (field.Equals("TableQuestion"))
                //    {
                //        i = 9;
                //        GetTableDataForInclude1RowSelectCheckbox(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //    if (field.Equals("AutoBuildTableQuestion"))
                //    {
                //        i = 11;
                //        GetTableDataForInclude1RowSelectCheckbox(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //}
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool RenameTheDomainItem1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            // int i = 6;

            try
            {
                bool setText = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {                  
                    
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;                    
                    IControl control = CreateFormFromExisting.DomainIteminrow(row);
                    if (!control.Equals(null))
                    {
                         bool a = Control_ActionUtilities.Textbox_SetText(control, createformfromexisting.TargetRenameForDomain, "Not Able to rename the Domain Item");
                        if(a == false)
                        {
                            setText = false;
                        }
                    }
                       
                }               
                BrowserUtilities.SwitchToWindow();
                return setText;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifyLabel(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();     

            try
            {
                bool setText = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    //IControl row1 = WebTableUtilities.GetRowByRowIndex(CreateFormFromExisting.FormTableInCreateFormFromExisting, Convert.ToInt32(createformfromexisting.Row));
                    //IControl c = WebTableUtilities.GetElement(row1,"",10, TableColumnContentType.Span);
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;             
                   
                    IControl control = CreateFormFromExisting.Labelinrow(row);
                    if (!control.Equals(null))
                    {
                        //bool a = Control_ActionUtilities.Click(control, "Not able to find the control");
                        bool a = Control_PropertyUtilities.GetText(control).Equals(createformfromexisting.Label);
                        if (a == false)
                        {
                            setText = false;
                        }
                    }

                }
                BrowserUtilities.SwitchToWindow();
                return setText;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool LabelDoesnotExist(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();

            try
            {
                bool setText = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    //IControl row1 = WebTableUtilities.GetRowByRowIndex(CreateFormFromExisting.FormTableInCreateFormFromExisting, Convert.ToInt32(createformfromexisting.Row));
                    //IControl c = WebTableUtilities.GetElement(row1,"",10, TableColumnContentType.Span);
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;

                    IControl control = CreateFormFromExisting.Labelinrow(row);
                    if (!control.Equals(null))
                    {                       
                       setText = false;                        
                    }

                }
                BrowserUtilities.SwitchToWindow();
                return setText;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool RenameTheFormDetails(IEnumerable<CreateFormfromExistingTable> createformfromexistings, string FormDetails)
        {
            BrowserUtilities.DS_SwitchToFrame();
            // int i = 6;

            try
            {
                bool setText = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {

                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.DomainIteminrow(row);
                    if (!control.Equals(null))
                    {
                        if(FormDetails == "FormName")
                        {
                            bool a = Control_ActionUtilities.Textbox_SetText(control, createformfromexisting.ReNameFormName, "Not Able to rename the Domain Item");
                            if (a == false)
                            {
                                setText = false;
                            }

                        }
                        if (FormDetails == "FormLabel")
                        {
                            bool a = Control_ActionUtilities.Textbox_SetText(control, createformfromexisting.ReNameFormLabel, "Not Able to rename the Domain Item");
                            if (a == false)
                            {
                                setText = false;
                            }

                        }
                        if (FormDetails == "TableName")
                        {
                            bool a = Control_ActionUtilities.Textbox_SetText(control, createformfromexisting.RenameTableName, "Not Able to rename the Domain Item");
                            if (a == false)
                            {
                                setText = false;
                            }

                        }
                        if (FormDetails == "AutobuildTableName")
                        {
                            bool a = Control_ActionUtilities.Textbox_SetText(control, createformfromexisting.RenameAutobuild, "Not Able to rename the Domain Item");
                            if (a == false)
                            {
                                setText = false;
                            }

                        }


                    }

                }
                BrowserUtilities.SwitchToWindow();
                return setText;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ExpandTheDomain(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();           

            try
            {
                bool click = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {

                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.ExpandDomain(row);
                    if (!control.Equals(null))
                    {
                       click = Control_ActionUtilities.Click(control, "Not able to find the link");
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return click;
            
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyDuplicateDomainItem(IEnumerable<CreateFormfromExistingTable> createformfromexistings, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            // int i = 6;

            try
            {
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(3, createformfromexisting.Source1, TableColumnContentType.Span));
                    IControl tableRow = WebTableUtilities.Table_FindRow(CreateFormFromExisting.FormTableInCreateFormFromExisting, list);
                    if (Control_PropertyUtilities.IsControlNull(tableRow))
                    {
                        GetTableDataForInclude1RowSelectCheckbox(tableRow, createformfromexisting.Target1, 1, TableColumnContentType.Span);

                    }
                }
                //ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                //foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                //{
                //    //GetTableDataForInclude1RowControlDisabled(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    if (field.Equals("FlatQuestion"))
                //    {
                //        GetTableDataForInclude1RowSelectCheckbox(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //    if (field.Equals("TableQuestion"))
                //    {
                //        i = 9;
                //        GetTableDataForInclude1RowSelectCheckbox(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //    if (field.Equals("AutoBuildTableQuestion"))
                //    {
                //        i = 11;
                //        GetTableDataForInclude1RowSelectCheckbox(rows[i], cffe.Include1, 1, TableColumnContentType.Checkbox);
                //    }
                //}
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickonDomainArrowIcon()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_ActionUtilities.Click(CreateFormFromExisting.DomainArrowButton, "Not able to Click the control");
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SaveButtonAtTop()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_PropertyUtilities.IsControlDisabled(CreateFormFromExisting.SaveButtonAtTopOfPopupWindow);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SaveButtonAtBottom()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_ActionUtilities.Click(CreateFormFromExisting.SaveButtonAtTheBottomOfThePopupWindow, "Not able to Click the control");
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SaveButtonAtTopInEbaledState()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_PropertyUtilities.IsEnabled(CreateFormFromExisting.SaveButtonAtTopOfPopupWindow);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SaveButtonAtBottomInEnabledState()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_PropertyUtilities.IsEnabled(CreateFormFromExisting.SaveButtonAtTheBottomOfThePopupWindow);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyTheDomainData(IEnumerable<CreateFormfromExistingTable> createformfromexisting)
        {
            BrowserUtilities.DS_SwitchToFrame();
            int i = 11;

            try
            {
                ReadOnlyCollection<IControl> rows1 = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                foreach (CreateFormfromExistingTable cffe in createformfromexisting)
                {

                    if (cffe.Include1.Equals("checked"))
                    {
                        IControl element1 = WebTableUtilities.GetElement(rows1[i], cffe.Include1, 1, TableColumnContentType.Span);
                        element1.WebElement.GetAttribute("checked").Equals("true");
                        //bool a1 = elevalue1.Equals(cffe.Include1);

                    }

                    if (cffe.ColumnHeader1 != "")
                    {

                        IControl element = WebTableUtilities.GetElement(rows1[i], cffe.ColumnHeader1, 0, TableColumnContentType.Span);
                        String elevalue = element.WebElement.Text.Trim();
                        bool a = elevalue.Equals(cffe.ColumnHeader1);

                    }
                    if (cffe.Include1 != "")
                    {
                        if (cffe.Include1.Equals("checked"))
                        {
                            IControl element1 = WebTableUtilities.GetElement(rows1[i], cffe.Include1, 1, TableColumnContentType.Span);
                            element1.WebElement.GetAttribute("checked").Equals("true");
                            //bool a1 = elevalue1.Equals(cffe.Include1);

                        }

                    }
                    if (cffe.Source1 != "")
                    {
                        IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Source1, 2, TableColumnContentType.Span);
                        String elevalue = element.WebElement.Text;
                        bool a = elevalue.Equals(cffe.Source1);

                    }
                    if (cffe.Target1 != "")
                    {                       
                        
                            IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Target1, 3, TableColumnContentType.Textbox);
                            String elevalue = element.WebElement.GetAttribute("value");
                            bool a = elevalue.Equals(cffe.Target1);

                     }
                    
                    if (cffe.ColumnHeader2 != "")
                    {
                        IControl element = WebTableUtilities.GetElement(rows1[i], cffe.ColumnHeader2, 4, TableColumnContentType.Span);
                        String elevalue = element.WebElement.Text;
                        bool a = elevalue.Equals(cffe.ColumnHeader1);

                    }
                    if (cffe.Include2 != "")
                    {
                        IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Include2, 5, TableColumnContentType.Span);
                        element.WebElement.GetAttribute("checked").Equals("true");


                    }
                    if (cffe.Source2 != "")
                    {
                        IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Source2, 6, TableColumnContentType.Textbox);
                        String elevalue = element.WebElement.Text;
                        bool a = elevalue.Equals(cffe.ColumnHeader1);

                    }
                    if (cffe.Target2 != "")
                    {                       
                        
                            IControl element = WebTableUtilities.GetElement(rows1[i], cffe.Target2, 3, TableColumnContentType.Textbox);
                            String elevalue = element.WebElement.GetAttribute("value");
                            bool a = elevalue.Equals(cffe.Target1);

                        
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
         public static bool ClickOnVerify()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_ActionUtilities.Click(CreateFormFromExisting.VerifybuttonTop, "Not able to Click the control");
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickOnVerifyInPopUp()
        {
            
            try
            {
                Control_ActionUtilities.Click(CreateFormFromExisting.VerifybuttonTop, "Not able to Click the control");
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            
        }


        public static bool ClickOnSaveInPopUp()
        {

            try
            {
                Control_ActionUtilities.Click(CreateFormFromExisting.SavebuttonTop, "Not able to Click the control");
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }

        }


        public static bool VerifyTheErrorMessage(string ErrorMsg, string field)
        { int i;       
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                if(field.Equals("Form Name:"))
                {
                    string value = WebTableUtilities.GetValue(CreateFormFromExisting.FormTableInCreateFormFromExisting, 0, 3);
                    value.Equals(Control_PropertyUtilities.GetText(CreateFormFromExisting.FormNameErrorMessage));
                }
                if (field.Equals("Form Label:"))
                {
                    string LabelErrorMsg = WebTableUtilities.GetValue(CreateFormFromExisting.FormTableInCreateFormFromExisting, 1, 3);
                     LabelErrorMsg.Equals(Control_PropertyUtilities.GetText(CreateFormFromExisting.FormLabelErrorMessage));
                }
                if (field.Equals("Table Name:"))
                {
                    string TableErrorMsg = WebTableUtilities.GetValue(CreateFormFromExisting.FormTableInCreateFormFromExisting, 2, 3);
                     TableErrorMsg.Equals(Control_PropertyUtilities.GetText(CreateFormFromExisting.TableErrorMessage));
                }
                if (field.Equals("AutoBuildTable"))
                {
                    string AutoBuildErrorMsg = WebTableUtilities.GetValue(CreateFormFromExisting.FormTableInCreateFormFromExisting, 3, 3);
                     AutoBuildErrorMsg.Equals(Control_PropertyUtilities.GetText(CreateFormFromExisting.TableErrorMessage));
                }                                    

                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ErrorMsgShouldDisappear(string ErrorMsg, string field)
        {
            int i=0;
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                if (field.Equals("Form Name:"))
                {
                    IControl Element = WebTableUtilities.GetElement(rows[0], ErrorMsg, 3, TableColumnContentType.Span);
                    Control_PropertyUtilities.IsControlNull(Element);
                }                   
                
                if (field.Equals("Form Label:"))
                {
                    IControl Element = WebTableUtilities.GetElement(rows[1], ErrorMsg, 3, TableColumnContentType.Span);
                    Control_PropertyUtilities.IsControlNull(Element);                    
                }
                if (field.Equals("Table Name:"))
                {
                    IControl Element = WebTableUtilities.GetElement(rows[2], ErrorMsg, 3, TableColumnContentType.Span);
                    Control_PropertyUtilities.IsControlNull(Element);                    
                }
                if (field.Equals("AutoBuildTable"))
                {
                    IControl Element = WebTableUtilities.GetElement(rows[3], ErrorMsg, 3, TableColumnContentType.Span);
                    Control_PropertyUtilities.IsControlNull(Element);                    
                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyCheckBoxStatusForTheDomainItems(List<CreateFormfromExistingTable> Createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ReadOnlyCollection<IControl> controls = CreateFormFromExisting.GetDomainIncudeCheckboxes();
                if(!controls.Equals(null))
                {
                    foreach (IControl control in controls)
                    {
                        control.WebElement.GetAttribute("checked").Equals("true");
                        Control_PropertyUtilities.IsEnabled(control);
                    }

                }                
                controls.Count.Equals(Createformfromexistings.Count);

                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool RenameTheDomainItem(String RenameDomainItem, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl control = CreateFormFromExisting.DomainIteminrow(row);
                if (!control.Equals(null))
                {                    
                    Control_ActionUtilities.Textbox_SetText(control, RenameDomainItem, "Not Able to rename the Domain Item");
                    Control_PropertyUtilities.IsEnabled(control);                

                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
       
        public static bool ClickOnTheLinkInPopupWindow(String LinkName)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl control = CreateFormFromExisting.FormLink(LinkName);
                if (!control.Equals(null))
                {
                    Control_ActionUtilities.Click(control, "Link not available");
                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool RenameTheCodeList(String CodeList, String RenamedCodeList, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl control = CreateFormFromExisting.CodelistInRow(row);
                if (!control.Equals(null))
                {
                    Control_ActionUtilities.Textbox_SetText(control, RenamedCodeList, "Not Able to rename the Domain Item");
                    Control_PropertyUtilities.IsEnabled(control);

                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool RenameTheCodeList1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool setText = true;           
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    //ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row-1;
                    //IControl ele = WebTableUtilities.GetElement(rows[row], createformfromexisting.TargetForCodelist, 7, TableColumnContentType.CheckboxAndText);
                    IControl control = CreateFormFromExisting.CodelistInRow(row);
                    if (!control.Equals(null))
                    {
                        setText = Control_ActionUtilities.Textbox_SetText(control, createformfromexisting.TargetRenameForCodelist, "Not able to set text");
                        if (setText == false)
                        {
                            setText = false;
                        }

                    }           
                       
                    
                }
                BrowserUtilities.SwitchToWindow();
                return setText;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifytheCheckBoxStatusAfterRenamingTheDomainItem(String DomainItem, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl control = CreateFormFromExisting.IncludeCheckboxOfDomainIteminrow(row);                
                if (!control.Equals(null))
                {

                    control.WebElement.GetAttribute("checked").Equals("true");
                    Control_PropertyUtilities.IsEnabled(control);

                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifytheCheckBoxStatusAfterRenamingTheDomainItem1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool enabled = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {

                    ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.IncludeCheckboxOfDomainIteminrow(row);                    
                    enabled = Control_PropertyUtilities.IsEnabled(control);
                    control.WebElement.GetAttribute("checked").Equals("true");
                }
                BrowserUtilities.SwitchToWindow();
                return enabled;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifytheCheckBoxStatusAfterRenamingTheCodeList(String CodeList,int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl control = CreateFormFromExisting.IncludeCheckboxOfCodelistInRow(row);
                if (!control.Equals(null))
                {

                    control.WebElement.GetAttribute("checked").Equals("true");
                    Control_PropertyUtilities.IsEnabled(control);

                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifytheCheckBoxStatusAfterRenamingTheCodeList1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool enabled = false;
                bool selected = false;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    //ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = --row;
                    //IControl ele = WebTableUtilities.GetElement(rows[row], createformfromexisting.TargetForCodelist, 5, TableColumnContentType.CheckboxAndText);
                    IControl control = CreateFormFromExisting.IncludeCheckboxOfCodelistInRow(row);

                    if (!control.Equals(null))
                    {
                        selected = control.WebElement.Selected;
                        enabled = control.WebElement.Enabled;
                        if (createformfromexisting.IncludeForCodelist.Equals("enabled"))
                        {
                            selected.Equals("true");
                            enabled.Equals("true");
                        }

                    }
                }
                    BrowserUtilities.SwitchToWindow();
                return enabled;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyTheCodelist(String CodeList, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                string txt = null;
                IControl control = CreateFormFromExisting.CodelistInRow(row);
                if (!control.Equals(null))
                {                     
                    txt = control.WebElement.GetAttribute("value");

                }
                BrowserUtilities.SwitchToWindow();
                return txt.Equals(CodeList);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifyTheCodelist1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool text = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    //ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row-1;
                    IControl control = CreateFormFromExisting.CodelistInRow(row);
                    //IControl ele = WebTableUtilities.GetElement(rows[row], createformfromexisting.TargetForCodelist, 8, TableColumnContentType.CheckboxAndText);

                    if (!control.Equals(null))
                    {
                        string codelistName = control.WebElement.GetAttribute("value");                        
                        text = codelistName.Equals(createformfromexisting.TargetForCodelist);
                        if(text == false)
                        {
                            text = false;
                        }
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return text;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifytheCheckBoxStatusAfterUncheckingTheDomainItem(String CodeList, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl control = CreateFormFromExisting.IncludeCheckboxOfCodelistInRow(row);
                if (!control.Equals(null))
                {                    
                    Control_PropertyUtilities.IsControlDisabled(control);
                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
         public static bool VerifytheCheckBoxStatusAfterUncheckingTheDomainItem1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool disabled = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.IncludeCheckboxOfCodelistInRow(row);
                    if (!control.Equals(null))
                    {
                        disabled = Control_PropertyUtilities.IsControlDisabled(control);
                        if(disabled == false)
                        {
                            disabled = false;
                        }
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return disabled;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyTheIncludeCheckBoxOfCodelistName(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool enabled = false;
                bool selected = false;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    //ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row-1;
                    IControl control = CreateFormFromExisting.IncludeCheckboxOfCodelistInRow(row);
                    //IControl ele = WebTableUtilities.GetElement(rows[row], createformfromexisting.TargetForCodelist, 5, TableColumnContentType.CheckboxAndText);

                    if (!control.Equals(null))
                    {                         
                        selected=control.WebElement.Selected;
                        enabled = control.WebElement.Enabled;
                        if(createformfromexisting.IncludeForCodelist.Equals("disabled"))
                        {
                            selected.Equals("false");
                            enabled.Equals("false");
                        }
                                               
                    }
                }
                BrowserUtilities.SwitchToWindow();
               
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifyTheIncludeCheckBoxOfDomainItem(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool enabled = false;
                bool selected = false;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {                    
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.IncludeCheckboxOfDomainIteminrow(row);                

                    if (!control.Equals(null))
                    {
                        selected = control.WebElement.Selected;
                        enabled = control.WebElement.Enabled;
                        if (createformfromexisting.IncludeForDomainItem.Equals("disabled"))
                        {
                            selected.Equals("false");
                            enabled.Equals("false");
                        }

                    }
                }
                BrowserUtilities.SwitchToWindow();

                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifytheDomainItemTextBox(String DomainItem, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl control = CreateFormFromExisting.DomainIteminrow(row);
                if (!control.Equals(null))
                {
                    Control_PropertyUtilities.IsControlDisabled(control);
                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifytheDomainItemTextBox1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool disabled = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.DomainIteminrow(row);
                    if (!control.Equals(null))
                    {
                        disabled = Control_PropertyUtilities.IsControlDisabled(control);
                        if(disabled == false)
                        {
                            disabled = false;
                        }
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return disabled;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }        
        public static bool VerifytheEnabledDomainItemTextBox(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool enabled = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.DomainIteminrow(row);
                    if (!control.Equals(null))
                    {
                        enabled = Control_PropertyUtilities.IsEnabled(control);
                        if (enabled == false)
                        {
                            enabled = false;
                        }
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return enabled;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }      
       


        public static bool VerifytheCodeListTextBox(String CodeList, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl control = CreateFormFromExisting.CodelistInRow(row);
                if (!control.Equals(null))
                {
                    Control_PropertyUtilities.IsControlDisabled(control);
                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifytheCodeListTextBox1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool disabled = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.CodelistInRow(row);
                    if (!control.Equals(null))
                    {
                        disabled = Control_PropertyUtilities.IsControlDisabled(control);
                        if(disabled == false)
                        {
                            disabled = false;
                        }
                        
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return disabled;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool UncheckTheDomainItemCheckbox(String DomainItem, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                IControl control = CreateFormFromExisting.IncludeCheckboxOfDomainIteminrow(row);
                if (!control.Equals(null))
                {
                    Control_ActionUtilities.UncheckCheckbox(control);               

                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool CheckTheDomainItemCheckbox(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool check = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {

                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.IncludeCheckboxOfDomainIteminrow(row);
                    if (!control.Equals(null))
                    {
                        check = Control_ActionUtilities.CheckCheckbox(control);
                        if(check == false)
                        {
                            check = false;
                        }

                    }
                }
                BrowserUtilities.SwitchToWindow();
                return check;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool UncheckTheDomainItemCheckbox1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool uncheck = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.IncludeCheckboxOfDomainIteminrow(row);
                    if (!control.Equals(null))
                    {
                        uncheck = Control_ActionUtilities.UncheckCheckbox(control);
                        if(uncheck == false)
                        {
                            uncheck = false;
                        }

                    }
                }
                BrowserUtilities.SwitchToWindow();
                return uncheck;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }        
        public static bool UncheckTheCodelistItemCheckbox1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool uncheck = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.IncludeCheckboxOfCodelistInRow(row);
                    if (!control.Equals(null))
                    {
                        uncheck = Control_ActionUtilities.UncheckCheckbox(control);
                        if (uncheck == false)
                        {
                            uncheck = false;
                        }

                    }
                }
                BrowserUtilities.SwitchToWindow();
                return uncheck;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifytheOrangeBackGroundColorForDomainItem(String DomainItem, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool color = false;
                IControl control = CreateFormFromExisting.DomainIteminrow(row);
                if (!control.Equals(null))
                {

                    color = control.WebElement.GetCssValue("background-color").Equals("rgba(217, 231, 250, 1)");                   

                }
                BrowserUtilities.SwitchToWindow();
                return color;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
         public static bool VerifytheOrangeBackGroundColorForDomainItem1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool color = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {                    
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.DomainIteminrow(row);
                    if (!control.Equals(null))
                    {
                        color = control.WebElement.GetCssValue("background-color").Equals("rgba(217, 231, 250, 1)");
                        if(color == false)
                        {
                            color = false;
                        }

                    }
                }
                BrowserUtilities.SwitchToWindow();
                return color;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }        
        
        public static bool VerifytheOrangeBackGroundColorForTheCodelist(String CodeList,int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool color = false;
                IControl control = CreateFormFromExisting.CodelistInRow(row);
                if (!control.Equals(null))
                {

                    color = control.WebElement.GetCssValue("background-color").Equals("rgba(217, 231, 250, 1)");

                }
                BrowserUtilities.SwitchToWindow();
                return color;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifytheOrangeBackGroundColorForTheCodelist1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool color = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.CodelistInRow(row);
                    if (!control.Equals(null))
                    {

                        color = control.WebElement.GetCssValue("background-color").Equals("rgba(217, 231, 250, 1)");
                        if(color == false)
                        {
                            color = false;
                        }
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return color;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifytheOrangeBackGroundColorForTheDomainItem1(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool color = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;                    
                    IControl control = CreateFormFromExisting.DomainIteminrow(row);
                    if (!control.Equals(null))
                    {
                        string color1 = control.WebElement.GetCssValue("background-color");
                        color = control.WebElement.GetCssValue("background-color").Equals("rgba(255, 165, 0, 1)");
                        if (color == false)
                        {
                            color = false;
                        }
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return color;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }        
         public static bool VerifytheOrangeBackGroundColorForTheCodeList(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool color = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    IControl control = CreateFormFromExisting.CodelistInRow(row);
                    if (!control.Equals(null))
                    {
                        string color1 = control.WebElement.GetCssValue("background-color");
                        color = control.WebElement.GetCssValue("background-color").Equals("rgba(255, 165, 0, 1)");
                        if (color == false)
                        {
                            color = false;
                        }
                    }
                }
                BrowserUtilities.SwitchToWindow();
                return color;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyTheTextBoxOfCodelistName(IEnumerable<CreateFormfromExistingTable> createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                bool enabled = true;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {                   
                    ///ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(CreateFormFromExisting.FormTableInCreateFormFromExisting);
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row-1;
                    IControl control = CreateFormFromExisting.CodelistInRow(row);
                   // IControl ele = WebTableUtilities.GetElement(rows[row], createformfromexisting.TargetForCodelist, 8, TableColumnContentType.Span);
                    
                        enabled = Control_PropertyUtilities.IsEnabled(control);
                        if(enabled == false)
                        {
                            enabled = false;
                        }                                      
                }                
                BrowserUtilities.SwitchToWindow();
                return enabled;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyCheckBoxStatusForTheDomainItemsUnchecked(List<CreateFormfromExistingTable> Createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ReadOnlyCollection<IControl> controls = CreateFormFromExisting.GetDomainIncudeCheckboxes();                
                if(!controls.Equals(null))
                {
                    foreach (IControl control in controls)
                    {
                        Control_PropertyUtilities.IsControlDisabled(control);
                        

                    }                   

                }
                controls.Count.Equals(Createformfromexistings.Count());

                BrowserUtilities.SwitchToWindow();

                //foreach (CreateFormfromExistingTable createformfromexisting in Createformfromexistings)
                //{

                //    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                //    list.AddSearchItem(new WebTable_SearchCriteriaItem(3, createformfromexisting.Source1, TableColumnContentType.Span));
                //    IControl tableRow = WebTableUtilities.Table_FindRow(CreateFormFromExisting.FormTableInCreateFormFromExisting, list);
                //    if (!Control_PropertyUtilities.IsControlNull(tableRow))
                //    {
                //        GetTableDataForInclude1RowControlUnchecked(tableRow, createformfromexisting.Include1, 1, TableColumnContentType.Checkbox);
                //        GetTableDataForInclude1RowControlDisabled(tableRow, createformfromexisting.Include1, 1, TableColumnContentType.Checkbox);
                //        // return false;
                //    }

                //}

                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
         public static bool VerifyCheckBoxStatusForDisabledCodelists(List<CreateFormfromExistingTable> Createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ReadOnlyCollection<IControl> controls = CreateFormFromExisting.GetCodelistIncudeCheckboxes();
                List<string> dropdownvalues = new List<string>();
                // dropdownvalues.Add(selectValue);
                foreach (IControl control in controls)
                {
                    //control.WebElement.GetAttribute("unchecked").Equals("true");
                    Control_PropertyUtilities.IsControlDisabled(control);
                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyCheckBoxStatusForCodelists(List<CreateFormfromExistingTable> Createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ReadOnlyCollection<IControl> controls = CreateFormFromExisting.GetCodelistIncudeCheckboxes();
                if(!controls.Equals(null))
                {
                    foreach (IControl control in controls)
                    {
                        control.WebElement.GetAttribute("checked").Equals("true");
                        Control_PropertyUtilities.IsEnabled(control);
                    }

                }
                controls.Count.Equals(Createformfromexistings.Count);
                
                

                //foreach (CreateFormfromExistingTable createformfromexisting in Createformfromexistings)
                //{

                //    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                //    list.AddSearchItem(new WebTable_SearchCriteriaItem(3, createformfromexisting.Source2, TableColumnContentType.Textbox));
                //    IControl tableRow = WebTableUtilities.Table_FindRow(CreateFormFromExisting.FormTableInCreateFormFromExisting, list);
                //    if (!Control_PropertyUtilities.IsControlNull(tableRow))
                //    {
                //        GetTableDataForInclude1RowSelectCheckbox(tableRow, createformfromexisting.Include2, 1, TableColumnContentType.Checkbox);
                //        GetTableDataForInclude1RowControlEnabled(tableRow, createformfromexisting.Include2, 1, TableColumnContentType.Checkbox);
                //        // return false;
                //    }                    
                //}
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyCheckBoxStatusForCodelistsUnchecked(List<CreateFormfromExistingTable> Createformfromexistings)
        {
            try
            {
                foreach (CreateFormfromExistingTable createformfromexisting in Createformfromexistings)
                {

                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(3, createformfromexisting.Source2, TableColumnContentType.Span));
                    IControl tableRow = WebTableUtilities.Table_FindRow(CreateFormFromExisting.FormTableInCreateFormFromExisting, list);
                    if (!Control_PropertyUtilities.IsControlNull(tableRow))
                    {
                        GetTableDataForInclude1RowControlUnchecked(tableRow, createformfromexisting.Include2, 1, TableColumnContentType.Checkbox);
                        GetTableDataForInclude1RowControlDisabled(tableRow, createformfromexisting.Include2, 1, TableColumnContentType.Checkbox);
                        // return false;
                    }
                }

                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyOrangeBackGroundColor(List<CreateFormfromExistingTable> Createformfromexistings, string field)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ReadOnlyCollection<IControl> controls = CreateFormFromExisting.GetDomainBackGroundColor();
                List<string> backgroundcolor = new List<string>();            
                if(!controls.Equals(null))
                {
                    foreach (IControl control in controls)
                    {                       
                        string color = control.WebElement.GetCssValue("background-color");
                        
                        if(color.Equals("rgba(255, 165, 0, 1)"))
                        {
                            backgroundcolor.Add(color);
                        }                     
                    
                    }
                    
                }               
                BrowserUtilities.SwitchToWindow();
                return Createformfromexistings.Count().Equals(backgroundcolor.Count());
               

                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyOrangeBackGroundColorForCodelist(List<CreateFormfromExistingTable> Createformfromexistings)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ReadOnlyCollection<IControl> controls = CreateFormFromExisting.GetCodelistBackGroundColor();
                List<string> backgroundcolor = new List<string>();
                if (!controls.Equals(null))
                {
                    foreach (IControl control in controls)
                    {
                        string color = control.WebElement.GetCssValue("background-color");

                        if (color.Equals("rgba(255, 165, 0, 1)"))
                        {
                            backgroundcolor.Add(color);
                        }

                    }

                }
                BrowserUtilities.SwitchToWindow();
                return Createformfromexistings.Count().Equals(backgroundcolor.Count());                
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifyTheErrorMessageforTheDomainItem(String ErrorMsg, int row)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                string getText = null;
               IControl control = CreateFormFromExisting.ErrorMessageInRow(row);                
                if (!control.Equals(null))
                {
                    getText=Control_PropertyUtilities.GetText(control);

                }
                BrowserUtilities.SwitchToWindow();
                return getText.Equals(ErrorMsg);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyTheErrorMessageforTheDomainItem1(IEnumerable<CreateFormfromExistingTable> createformfromexistings, string ErrorMsg)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                string getText = null;
                foreach (CreateFormfromExistingTable createformfromexisting in createformfromexistings)
                {
                    int row = Convert.ToInt32(createformfromexisting.Row);
                    row = row - 1;
                    
                    IControl control = CreateFormFromExisting.ErrorMessageInRow(row);
                    if (!control.Equals(null))
                    {
                        getText = Control_PropertyUtilities.GetText(control);
                        if(getText == null)
                        {
                            return (!getText.Equals(ErrorMsg));
                        }

                    }
                }
                BrowserUtilities.SwitchToWindow();
                return getText.Equals(ErrorMsg);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool NavigateToPage(int PageNo)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                string getText = null;
                IControl control = CreateFormFromExisting.PageNumber(PageNo);
                if (!control.Equals(null))
                {
                    Control_ActionUtilities.Click(control, "Page not found");

                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool ClickOnTheLink(string Link)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                string getText = null;
                IControl control = CreateFormFromExisting.LinkInPopup(Link);                
                if (!control.Equals(null))
                {
                    
                    Control_ActionUtilities.Click(control, "Page not found");
                    

                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ExpandAllChevronsInPage()
        {
            bool a = CreateFormFromExisting.ExpandAllchevrons();
                return a;
        }
    }
    }
