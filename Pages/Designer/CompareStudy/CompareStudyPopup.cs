using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.CompareStudyPopup
{
    public class CompareStudyPopup
    {
        public static IControl TwoStudies
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("RadStudyCompare_1"));
            }
        }

        public static IControl SameStudy
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("RadStudyCompare_0"));
            }
        }

        public static IControl NextButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwzNext.btnPrimary"));
            }
        }

        public static IControl CompareButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rwzFinish"));
            }
        }

        public static IControl SourceAndTargetTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_grdJobs > .rgMasterTable"));
            }
        }

        public static IControl StudyListTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_grdStudy > .rgMasterTable"));
            }
        }

        public static IControl SourceStudyTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_grdJobs_ctl00.rgMasterTable > tbody"));
            }
        }

        public static IControl TargetStudyTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_grdTargetStudyJobs_ctl00.rgMasterTable > tbody"));
            }
        }

        public static IControl SelectSourceRadioButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rgMasterTable > tbody >tr:nth-of-type(1) > td:nth-of-type(1) > input"));
            }
        }

        public static IControl SelectTargetRadioButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rgMasterTable > tbody >tr:nth-of-type(2) > td:nth-of-type(1) > input"));
            }
        }

        public static IControl TwoDiffStudiesRadioButton { get { return SyncUtilities.FindVisibleElement(By.Id("RadStudyCompare_1")); } }

        public static IControl SameStudyRadioButton { get { return SyncUtilities.FindVisibleElement(By.Id("RadStudyCompare_0")); } }

    }
}
