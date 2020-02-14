using Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Framework.Actions
{
    public static class Control_PropertyUtilities
    {
        public static String GetText(IControl control)
        {
            return control.WebElement.Text.Trim();
        }

        public static String GetAttributeValue(IControl control, String attribute, out bool found)
        {
            found = true;
            String retValue = control.WebElement.GetAttribute(attribute);
            found = retValue != null;
            return retValue;
        }

        public static bool IsControlVisible(IControl control)
        {
            if (!IsControlNull(control))
            {
                String cssDisplayValue = control.WebElement.GetCssValue("display");
                return !cssDisplayValue.Equals("none", StringComparison.InvariantCultureIgnoreCase);
            }
            return false;
        }

        public static bool IsControlNull(IControl control)
        {
            if (control == null)
            {
                return true;
            }
            if (control.WebElement == null)
            {
                return true;
            }
            return false;
        }

        public static bool IsControlDisabled(IControl control)
        {
            if (control != null && control.WebElement != null)
            {
                if (control.SelectElement != null)
                {
                    if (control.SelectElement.Options[0] != null)
                    {
                        return !control.SelectElement.Options[0].Enabled;
                    }
                }
                return !control.WebElement.Enabled;
            }
            return false;
        }

        public static bool VerifyAttributeValue(IControl c, String attribute, String value)
        {
            if (c != null && c.WebElement != null)
            {
                bool found = false;
                String appValue = GetAttributeValue(c, attribute, out found);
                if (found)
                {
                    return appValue.Equals(value, StringComparison.InvariantCultureIgnoreCase);
                }
            }
            return false;
        }
        public static bool VerifyAttributeValueContains(IControl c, String attribute, String value)
        {
            if (c != null && c.WebElement != null)
            {
                bool found = false;
                String appValue = GetAttributeValue(c, attribute, out found);
                if (found)
                {
                    return appValue.Contains(value);
                }
            }
            return false;
        }
        public static bool CompareCSSValue(IControl c, String cssProperty,String cssValue)
        {
            if(c!= null && c.WebElement!= null)
            {
                String appCSSValue = c.WebElement.GetCssValue(cssProperty);
                return appCSSValue.Equals(cssValue);
            }
            return false;
        }
        
        public static bool compareMessage(IControl c, String message)
        {
            if (c.WebElement.Text.Equals(message))
            {
                return true;
            }
            return false;
            
        }
            

        public static bool IsEnabled(IControl control)
        {
            if (!Control_PropertyUtilities.IsControlNull(control))
            {
                return control.WebElement.Enabled;
            }
            return false;
        }

        public static bool IsSelected(IControl control)
        {
            if (!Control_PropertyUtilities.IsControlNull(control))
            {
                return control.WebElement.Selected;
            }
            return false; 
        }


        public static bool IsControlDisplayed(IControl control)
        {
            if (control.WebElement.Displayed)
            {
                return true;
            }
            return false;
        }

    }
}