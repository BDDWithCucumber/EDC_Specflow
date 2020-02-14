using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.Study_Management_Jobs
{
    public class StudyManagemantJobsPage
    {

        public static IControl StudyJobsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ctl00_ctl00_ContentBody_ContentBody_grdJobsPanel > .RadGrid.RadGrid_Designer > .rgMasterTable#ctl00_ctl00_ContentBody_ContentBody_grdJobs_ctl00"));
            }
        }

        public static IControl SelectAll
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdJobs_ctl00_ctl02_ctl01_colSelectSelectCheckBox"));
            }
        }

        public static IControl Delete
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_btnDelete"));
            }
        }

        public static IControl GetStatusLink(IControl cell, string statusText)
        {
            try
            {
                return SyncUtilities.FindVisibleElement_Parent(cell.WebElement, By.LinkText(statusText));
            }
            catch(Exception e)
            {

            }
            return null;
        }

        public static IControl GetProcessLink(IControl proecssCell, string processText)
        {
            try
            {
                return SyncUtilities.FindVisibleElement_Parent(proecssCell.WebElement, By.LinkText(processText));
            }
            catch(Exception e)
            {

            }
            return null;
        }
    }
}