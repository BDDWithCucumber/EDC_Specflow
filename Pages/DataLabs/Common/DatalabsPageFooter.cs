using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Common
{
    public class DatalabsPageFooter
    {
        public static IControl DL_VersionSpan
        {
            get
            {
                IControl footer = GetFooter_Left();
                ReadOnlyCollection<IControl> controls = SyncUtilities.FindVisibleElements_Parent(footer.WebElement, By.TagName("span"));
                if(controls.Count > 0)
                {
                    return controls[0];
                }
                return null;
            }
        }

        public static IControl DL_CopyRightSpan
        {
            get
            {
                IControl footer = GetFooter_Left();
                ReadOnlyCollection<IControl> controls = SyncUtilities.FindVisibleElements_Parent(footer.WebElement, By.TagName("span"));
                if (controls.Count > 1)
                {
                    return controls[1];
                }
                return null;
            }
        }

        public static IControl ServerTime { get { return GetFooter_Right(); } }

        static IControl GetFooter_Left()
        {
            return SyncUtilities.FindVisibleElement(By.CssSelector("body > form > #footer > #footer2 > .left"));
        }

        static IControl GetFooter_Right()
        {
            return SyncUtilities.FindVisibleElement(By.CssSelector("body > form > #footer > #footer2 > .right"));
        }
    }
}