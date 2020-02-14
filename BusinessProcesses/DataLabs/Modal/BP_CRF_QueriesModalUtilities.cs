using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Modal;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Modal
{
    public class BP_CRF_QueriesModalUtilities
    {
        public static bool CheckQueriesInQuerisModalInOrder(String titleText, String queriesType, List<String> queries)
        {
            try
            {
                if (queries.Count > 0)
                {
                    List<String> queryTextList = GetQueriesFromQueriesModal(titleText, queriesType);
                    if (queryTextList.Count == queries.Count)
                    {
                        for (int i = 0; i < queries.Count; ++i)
                        {
                            if (!queryTextList[0].Equals(queries[0], StringComparison.InvariantCultureIgnoreCase))
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

        public static bool CheckQueriesInQuerisModal(String titleText, String queriesType, List<String> queries)
        {
            try
            {
                if (queries.Count > 0)
                {
                    List<String> queryTextList = GetQueriesFromQueriesModal(titleText, queriesType);
                    if (queryTextList.Count == queries.Count)
                    {
                        foreach (String query in queryTextList)
                        {
                            if (!queries.Contains(query))
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

        static List<String> GetQueriesFromQueriesModal(String titleText, String queriesType)
        {
            BrowserUtilities.SwitchToFrame();
            List<String> queryTextList = new List<String>();
            try
            {
                if (BP_ModalWindow.IsModalExist_CheckHeaderText(titleText))
                {
                    ReadOnlyCollection<IControl> queryList = DL_ModalWindow_CRF_QueriesResult.GetQueryList(queriesType);
                    foreach (IControl c in queryList)
                    {
                        queryTextList.Add(Control_PropertyUtilities.GetText(c));
                    }
                }                
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return queryTextList;
        }

        public static bool ClickContinue(String titleText)
        {
            BrowserUtilities.SwitchToFrame();
            bool isClicked = false;
            try
            {
                isClicked = Click(titleText, DL_ModalWindow_CRF_QueriesResult.ContinueButton);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }

        public static bool ClickBacktoCRF(String titleText)
        {
            BrowserUtilities.SwitchToFrame();
            bool isClicked = false;
            try
            {
                isClicked = Click(titleText, DL_ModalWindow_CRF_QueriesResult.BackToCRFButton);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }

        static bool Click(String titleText,IControl button)
        {            
            try
            {
                if (BP_ModalWindow.IsModalExist_CheckHeaderText(titleText))
                {
                    return Control_ActionUtilities.ClickModalButton(button);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

    }
}