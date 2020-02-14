using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Study
{
    public class DL_UploadStudyFilePage
    {
        public static IControl BrowseButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("UploadStudy_txtStudyFile"));
            }
        }

        public static IControl StudyLabelTextbox
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("UploadStudy_txtStudyFileLabel"));
            }
        }

        public static IControl UploadButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("UploadStudy_btnUpload"));
            }
        }

        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("UploadStudy_btnCancel"));
            }
        }
        public static IControl FileBrowseField
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("UploadStudy_txtStudyFile"));
            }
        }
    }
}