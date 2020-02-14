using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.Designer;
using Pages.Designer.Data;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.CompareStudy
{
    public class CompareStudyUtilities
    {
        public static bool ExpandLabDictMappings()
        {
            try
            {
                bool found;
                IControl expandCollapseAllIcon = SyncUtilities.FindVisibleElement(By.Id("img_LabDictionary_SC"));
                String src = Control_PropertyUtilities.GetAttributeValue(expandCollapseAllIcon, "src", out found);
                if (found)
                {
                    if (src.Contains("expand"))
                    {
                        Control_ActionUtilities.Click(expandCollapseAllIcon, String.Empty);
                        LabTestMappings();
                        return true;
                    }
                    else
                    {
                        LabTestMappings();
                        return true;
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool LabTestMappings()
        {
            try
            {
                bool found;
                IControl expandCollapseAllIcon = SyncUtilities.FindVisibleElement(By.Id("img_LabDictionary_0_S"));
                String src = Control_PropertyUtilities.GetAttributeValue(expandCollapseAllIcon, "src", out found);
                if (found)
                {
                    if (src.Contains("expand"))
                    {
                        return Control_ActionUtilities.Click(expandCollapseAllIcon, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool ExpandAttributeMappings()
        {
            try
            {
                bool found;
                IControl expandCollapseAllIcon = SyncUtilities.FindVisibleElement(By.Id("img_LabAttributeReference_SC"));
                String src = Control_PropertyUtilities.GetAttributeValue(expandCollapseAllIcon, "src", out found);
                if (found)
                {
                    if (src.Contains("expand"))
                    {
                        Control_ActionUtilities.Click(expandCollapseAllIcon, String.Empty);
                        ExpandAttributeMappingGender();
                        return true;
                    }
                    else
                    {
                        ExpandAttributeMappingGender();
                        return true;
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool ExpandAttributeMappingGender()
        {
            try
            {
                bool found;
                IControl expandCollapseAllIcon = SyncUtilities.FindVisibleElement(By.Id("img_LabAttributeReference_0_S"));
                String src = Control_PropertyUtilities.GetAttributeValue(expandCollapseAllIcon, "src", out found);
                if (found)
                {
                    if (src.Contains("expand"))
                    {
                        Control_ActionUtilities.Click(expandCollapseAllIcon, String.Empty);
                        CodelistMappingsInAttributeMappings();
                        return true;
                    }
                    else
                    {
                        CodelistMappingsInAttributeMappings();
                        return true;
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool CodelistMappingsInAttributeMappings()
        {
            try
            {
                bool found;
                IControl expandCollapseAllIcon = SyncUtilities.FindVisibleElement(By.Id("img_LabAttributeReference_0_CodeListMappingsReference_0_S"));
                String src = Control_PropertyUtilities.GetAttributeValue(expandCollapseAllIcon, "src", out found);
                if (found)
                {
                    if (src.Contains("expand"))
                    {
                        return Control_ActionUtilities.Click(expandCollapseAllIcon, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool TargetStudy()
        {
            try
            {
                IControl CodelistTable = SyncUtilities.FindVisibleElement(By.Id("LabAttributeReference_0_CodeListMappingsReference_0_CodelistMapping_TT"));
                ReadOnlyCollection<IControl> rows = null;
                if (WebTableUtilities.GetRowCount(CodelistTable, out rows) > 0)
                {
                    foreach (IControl row in rows)
                    {
                        bool found;
                        IControl celldata = WebTableUtilities.GetCell(row, 1);
                        String attribureValue = Control_PropertyUtilities.GetAttributeValue(celldata, "class", out found);
                        if (found)
                        {
                            if (attribureValue.Contains("modified-cell"))
                            {
                                Control_PropertyUtilities.CompareCSSValue(celldata, "background-color", "#fcdc75");
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }
            return true;
        }

        public static bool SourceTargetStudy(List<StudyCompareReportData> sourcetargetData)
        {
            try
            {
                foreach(StudyCompareReportData sourcetargetitem in sourcetargetData)
                {
                    IControl TargetCodelistTable = SyncUtilities.FindVisibleElement(By.Id("LabAttributeReference_0_CodeListMappingsReference_0_CodelistMapping_TT"));
                    IControl SourceCodelistTable = SyncUtilities.FindVisibleElement(By.Id("LabAttributeReference_0_CodeListMappingsReference_0_CodelistMapping_ST"));
                    ReadOnlyCollection<IControl> srows = null;
                    ReadOnlyCollection<IControl> trows = null;
                    if (WebTableUtilities.GetRowCount(SourceCodelistTable, out srows) > 0 && WebTableUtilities.GetRowCount(TargetCodelistTable, out trows) > 0)
                    {
                        for(int rowIndex=0; rowIndex < srows.Count; rowIndex++)
                        {
                            bool sfound = false;
                            //WebTable_SearchCriteriaItemList searchList = new WebTable_SearchCriteriaItemList();
                            //searchList.AddSearchItem(new WebTable_SearchCriteriaItem(1, sourcetargetitem.SourceStudy, TableColumnContentType.Text));
                            //IControl row = WebTableUtilities.Table_FindRow(SourceCodelistTable, searchList, 1);
                            IControl sourcecelldata = WebTableUtilities.GetCell(srows[rowIndex], 1);
                            String sourceattribureValue = Control_PropertyUtilities.GetAttributeValue(sourcecelldata, "class", out sfound);
                            if (sfound)
                            {
                                ReadOnlyCollection<IControl> targetTablerows = SyncUtilities.FindVisibleElements_Parent(TargetCodelistTable.WebElement, By.TagName("tr"));
                                if (sourceattribureValue.Equals("modified"))
                                {
                                    bool tfound;
                                    IControl targetcelldata = WebTableUtilities.GetCell(targetTablerows[rowIndex], 1);
                                    String targetattribureValue = Control_PropertyUtilities.GetAttributeValue(targetcelldata, "class", out tfound);
                                    if (targetattribureValue.Contains("modified-cell"))
                                    {
                                        Control_PropertyUtilities.CompareCSSValue(targetcelldata, "background-color", "#fcdc75");
                                    }
                                }
                                else if (sourceattribureValue.Equals("deleted"))
                                {
                                    bool tfound;
                                    IControl targetcelldata = WebTableUtilities.GetCell(targetTablerows[rowIndex], 1);
                                    String targetattribureValue = Control_PropertyUtilities.GetAttributeValue(targetcelldata, "class", out tfound);
                                    if (targetattribureValue.Equals("removedCell"))
                                    {
                                        Control_PropertyUtilities.CompareCSSValue(sourcecelldata, "background-color", "#fcdc75");
                                    }
                                }
                            }
                            else if(!sfound)
                            {
                                ReadOnlyCollection<IControl> targetTablerows = SyncUtilities.FindVisibleElements_Parent(TargetCodelistTable.WebElement, By.TagName("tr"));
                                if (sourceattribureValue.Contains("removedCell"))
                                {
                                    bool tfound;
                                    IControl targetcelldata = WebTableUtilities.GetCell(targetTablerows[rowIndex], 1);
                                    String targetattribureValue = Control_PropertyUtilities.GetAttributeValue(targetcelldata, "class", out tfound);
                                    if (targetattribureValue.Contains("added"))
                                    {
                                        Control_PropertyUtilities.CompareCSSValue(targetcelldata, "background-color", "#fcdc75");
                                    }
                                }
                            }
                            else if (!sfound)
                            {
                                ReadOnlyCollection<IControl> targetTablerows = SyncUtilities.FindVisibleElements_Parent(TargetCodelistTable.WebElement, By.TagName("tr"));
                                if (sourceattribureValue.Contains("deleted"))
                                {
                                    bool tfound;
                                    IControl targetcelldata = WebTableUtilities.GetCell(targetTablerows[rowIndex], 1);
                                    String targetattribureValue = Control_PropertyUtilities.GetAttributeValue(targetcelldata, "class", out tfound);
                                    if (targetattribureValue.Contains("removedCell"))
                                    {
                                        Control_PropertyUtilities.CompareCSSValue(targetcelldata, "background-color", "#fcdc75");
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }
         return false;
        }

        public static bool LabMappings()
        {
            try
            {
                bool found;
                IControl expandCollapseAllIcon = SyncUtilities.FindVisibleElement(By.Id("img_SubDataShape_SC"));
                String src = Control_PropertyUtilities.GetAttributeValue(expandCollapseAllIcon, "src", out found);
                if (found)
                {
                    if (src.Contains("expand"))
                    {
                        Control_ActionUtilities.Click(expandCollapseAllIcon, String.Empty);
                        LabMappingsDomain();
                        return true;
                    }
                    else
                    {
                        LabMappingsDomain();
                        return true;
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool LabMappingsDomain()
        {
            try
            {
                bool found;
                IControl expandCollapseAllIcon = SyncUtilities.FindVisibleElement(By.Id("img_SubDataShape_0_S"));
                String src = Control_PropertyUtilities.GetAttributeValue(expandCollapseAllIcon, "src", out found);
                if (found)
                {
                    if (src.Contains("expand"))
                    {
                        return Control_ActionUtilities.Click(expandCollapseAllIcon, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }
    }
}
