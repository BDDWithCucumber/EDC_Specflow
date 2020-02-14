using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Main.CRF;
using System;
using System.Collections.ObjectModel;
using Pages.DataLabs.Data;
using System.Collections.Generic;
using Reports.DebugLog;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Main.CRF
{
    public class BP_CRF_PDEP_EventsPageUtilities
    {
        public static bool OpenForm(String eventName, String formName)
        {
            try
            {
                IControl formCell = null;
                IControl formRow = GetFormRow(eventName, formName, out formCell);
                if (!Control_PropertyUtilities.IsControlNull(formCell))
                {
                    IControl formLink = DL_CRF_PDEP_EventsPage.GetFormLink(formCell);
                    return Control_ActionUtilities.Click(formLink, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static IControl GetFormRow(String eventName, String formName, out IControl formCell)
        {
            formCell = null;
            String identifier = String.Empty;
            try
            {
                if (ExpandEvent(eventName, out identifier) && !String.IsNullOrEmpty(identifier))
                {
                    ReadOnlyCollection<IControl> rows = DL_CRF_PDEP_EventsPage.GetRowsEventRows(identifier);
                    foreach (IControl row in rows)
                    {
                        if (Control_PropertyUtilities.IsControlVisible(row))
                        {
                            formCell = WebTableUtilities.GetCell(row, 2);
                            String formText = Control_PropertyUtilities.GetText(formCell);
                            if (formName.Equals(formText, StringComparison.InvariantCultureIgnoreCase))
                            {
                                return row;
                            }
                        }
                    }
                }

            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }

        public static bool ExpandEvent(String eventName, out String identifier)
        {
            identifier = String.Empty;
            try
            {
                ReadOnlyCollection<IControl> rows = WebTableUtilities.GetRows(DL_CRF_PDEP_EventsPage.EventsTable);
                foreach (IControl row in rows)
                {
                    if (Control_PropertyUtilities.IsControlVisible(row))
                    {
                        IControl cell = WebTableUtilities.GetCell(row, 0);
                        if (Control_PropertyUtilities.GetText(cell).Equals(eventName, StringComparison.InvariantCultureIgnoreCase))
                        {
                            IControl expandCollapseImage = WebTableUtilities.GetElement(row, String.Empty, 0, TableColumnContentType.Image);
                            bool found = false;
                            String imageSource = Control_PropertyUtilities.GetAttributeValue(expandCollapseImage, "src", out found);
                            if (found)
                            {
                                identifier = Control_PropertyUtilities.GetAttributeValue(row, "identifier", out found);
                                if (imageSource.Contains("menu_expand.gif"))
                                {
                                    return Control_ActionUtilities.Click(expandCollapseImage, String.Empty);
                                }
                                return imageSource.Contains("menu_collapse.gif");
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyFormStautsIcon(String eventName, String formName, String icon)
        {
            try
            {
                IControl formCell = null;
                IControl formRow = GetFormRow(eventName, formName, out formCell);
                IControl formIcon = DL_CRF_PDEP_EventsPage.GetIcon(formCell);

                if (icon.Equals("Mismatch"))
                {
                    bool found = false;
                    String src = Control_PropertyUtilities.GetAttributeValue(formIcon, "src", out found);
                    if (found)
                    {
                        return src.Contains("PDE_mismatch");
                    }
                }
                if (icon.Equals("Submitted"))
                {
                    bool found = false;
                    String src = Control_PropertyUtilities.GetAttributeValue(formIcon, "src", out found);
                    if (found)
                    {
                        return src.Contains("Doc_S");
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyFormIcons(String eventName, String formName, List<PDEP_FormIconsData> dataList)
        {
            try
            {
                foreach (PDEP_FormIconsData data in dataList)
                {
                    IControl formCell = null;
                    IControl formRow = GetFormRow(eventName, formName, out formCell);
                    if (!Control_PropertyUtilities.IsControlNull(formRow))
                    {
                        if (!String.IsNullOrEmpty(data.Received))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 3);
                            if (!IsIconAvailable(cell, data.Received))
                            {
                                return false;
                            }
                        }
                        if (!String.IsNullOrEmpty(data.FirstPass))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 4);
                            if (!IsIconAvailable(cell, data.FirstPass))
                            {
                                return false;
                            }
                        }
                        if (!String.IsNullOrEmpty(data.SecondPass))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 5);
                            if (!IsIconAvailable(cell, data.SecondPass))
                            {
                                return false;
                            }
                        }
                        return true;
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool IsIconAvailable(IControl cell, String imageName)
        {
            IControl image = WebTableUtilities.GetImage(cell);
            bool found = false;
            String src = Control_PropertyUtilities.GetAttributeValue(image, "src", out found);
            if (found)
            {
                return src.ToUpper().Contains(imageName.ToUpper());
            }
            return false;
        }

        public static bool VerifyFormRestrictionMessage(List<PDEP_FormAccesssRestrictionMessageData> dataList)
        {
            try
            {
                foreach (PDEP_FormAccesssRestrictionMessageData data in dataList)
                {
                    if (String.IsNullOrEmpty(data.Event) || String.IsNullOrEmpty(data.Form) || String.IsNullOrEmpty(data.RestrictionMessage))
                    {
                        return false;
                    }

                    IControl formCell = null;
                    IControl formRow = GetFormRow(data.Event, data.Form, out formCell);
                    if (!Control_PropertyUtilities.IsControlNull(formCell))
                    {
                        IControl formLink = DL_CRF_PDEP_EventsPage.GetFormLink(formCell);
                        bool found = false;
                        String value = Control_PropertyUtilities.GetAttributeValue(formLink, "rel", out found);
                        if (!found || !value.Equals(data.RestrictionMessage, StringComparison.InvariantCultureIgnoreCase))
                        {
                            return false;
                        }
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
    }
}