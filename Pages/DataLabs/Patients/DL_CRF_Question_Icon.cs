using Common.Enums;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Patients
{
    public class DL_CRF_Question_Icon : DL_CRF_QuestionBase
    {
        public static IControl GetIcon_QNumber_QPrompt(String questionNumber, String questionPrompt, String iconName)
        {
            try
            {
                IControl questionHost = GetQuestionHost(questionNumber, questionPrompt);
                if (questionHost != null && questionHost.WebElement != null)
                {
                    return GetIcon(questionHost, iconName);
                }
            }
            catch (Exception e)
            {
            }
            return null;
        }

        public static IControl GetIcon_FlatQuestion(String questionPrompt, String iconName, string flagType=null)
        {
            try
            {
                IControl questionHost = GetFlatQuestionHost(questionPrompt);
                if (questionHost != null && questionHost.WebElement != null)
                {
                    return GetIcon(questionHost, iconName, flagType);
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static IControl GetIcon_TableQuestion(String tableName, String questionPrompt, String iconName, string flagType=null)
        {
            try
            {
                IControl questionHost = GetTableQuestionHost(tableName, questionPrompt);
                if (questionHost != null && questionHost.WebElement != null)
                {
                    return GetIcon(questionHost, iconName, flagType);
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        static IControl GetIcon(IControl questionHost, String iconName, string flagType = null)
        {
            if (questionHost != null)
            {
                ReadOnlyCollection<IControl> imageControlList = SyncUtilities.FindVisibleElements_Parent(questionHost.WebElement, By.TagName("img"));
                foreach (IControl image in imageControlList)
                {
                    if (IsImageSourceMatched(iconName, image, flagType))
                    {
                        if (Control_PropertyUtilities.IsControlVisible(image))
                        {
                            return image;
                        }
                    }
                }
            }
            return null;
        }

        static bool IsImageSourceMatched(String iconName, IControl image, String flagType=null)
        {
            bool found = false;
            String imageSource = Control_PropertyUtilities.GetAttributeValue(image, "src", out found);
            if (!found)
            {
                return false;
            }
            else if (flagType != null)
            {
                if (flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_unset.gif") && flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag3");
                }
                else if (flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_required_unset.gif") && flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag3");
                }
                else if (flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_set.gif") && flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag3");
                }
                else if (flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_required_set.gif") && flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag3");
                }
                else if (flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_changed.gif") && flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag3");
                }
                else if (flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_required_changed.gif") && flagType.Equals("SD-Verify", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag3");
                }
                else if (flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_unset.gif") && flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag2");
                }
                else if (flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_required_unset.gif") && flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag2");
                }
                else if (flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_set.gif") && flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag2");
                }
                else if (flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_required_set.gif") && flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag2");
                }
                else if (flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_changed.gif") && flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag2");
                }
                else if (flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_required_changed.gif") && flagType.Equals("M-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag2");
                }
                else if (flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_unset.gif") && flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag1");
                }
                else if (flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_required_unset.gif") && flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag1");
                }
                else if (flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_set.gif") && flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag1");
                }
                else if (flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_required_set.gif") && flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag1");
                }
                else if (flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_changed.gif") && flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag1");
                }
                else if (flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("flag_required_changed.gif") && flagType.Equals("D-Review", StringComparison.InvariantCultureIgnoreCase))
                {
                    bool idFound = false;
                    String id = Control_PropertyUtilities.GetAttributeValue(image, "id", out idFound);
                    return idFound && id.Contains("Flag1");
                }
            }
            else if (iconName.Equals("icon_createdcf.png", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("icon_createdcf.png"))
            {
                return true;
            }
            else if (iconName.Equals("arrow6_dn.png", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("arrow6_dn.png"))
            {
                return true;
            }
            else if (iconName.Equals("icon_mna_disabled.png", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("icon_mna_disabled.png"))
            {
                return true;
            }
            else if (iconName.Equals("icon_mna.png", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("icon_mna.png"))
            {
                return true;
            }
            else if (iconName.Equals("icon_thumper.gif", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("icon_thumper.gif"))
            {
                return true;
            }
            else if (iconName.Equals("icon_noConnection.gif", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("icon_noConnection.gif"))
            {
                return true;
            }
            else if (iconName.Equals("range_invalid.gif", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("range_invalid.gif"))
            {
                return true;
            }
            else if (iconName.Equals("illegible.gif", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("illegible.gif"))
            {
                return true;
            }
            else if (iconName.Equals("changeHistory.gif", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("changeHistory.gif"))
            {
                return true;
            }
            else if (iconName.Equals("comment_provisional.gif", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("comment_provisional.gif"))
            {
                return true;
            }
            else if (iconName.Equals("comment.gif", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("comment.gif"))
            {
                return true;
            }
            else if (iconName.Equals("DCF.gif", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("DCF.gif"))
            {
                return true;
            }
            else if (iconName.Equals("Mismatch.gif", StringComparison.InvariantCultureIgnoreCase) && imageSource.Contains("Mismatch.gif"))
            {
                return true;
            }
            return false;
        }

    }
}