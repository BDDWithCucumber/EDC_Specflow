using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.WebFocus
{
   public class wf_Page_Frame
    {
        public static IControl frame {get{return SyncUtilities.FindVisibleElement(By.XPath("//iframe[@class='ibx-iframe-frame']"));}}
        public static IControl frameHeader{ get{return SyncUtilities.FindVisibleElement(By.XPath("//span[@id='launchPageTitleTxtID']")); }}
        //public static IControl SubtitlePanel { get { return SyncUtilities.FindVisibleElement(By.ClassName("sectionHeader")); } }
        public static IControl country_dropdown { get { return SyncUtilities.FindVisibleElement(By.Id("countryFltr")); } }
        public static IControl CountrySelect_dropdown { get { return new Control(country_dropdown.WebElement, new SelectElement(country_dropdown.WebElement)); } }
        public static IControl site_dropdown { get { return SyncUtilities.FindVisibleElement(By.Id("siteFltr")); } }
        public static IControl SiteSelect_dropdown { get { return new Control(site_dropdown.WebElement, new SelectElement(site_dropdown.WebElement)); } }
        public static IControl patient_dropdown { get { return SyncUtilities.FindVisibleElement(By.Id("patientFltr")); } }
        public static IControl PatientSelect_dropdown { get { return new Control(patient_dropdown.WebElement, new SelectElement(patient_dropdown.WebElement)); } }
        public static IControl mintuesPerCRF { get { return SyncUtilities.FindVisibleElement(By.Id("minutesPerCRFFltr")); } }
        public static IControl IncludeInvestigator { get { return SyncUtilities.FindVisibleElement(By.Id("radio4")); } }
        public static IControl radio_Yes { get { return SyncUtilities.FindVisibleElement(By.Id("radio4_0")); } }
        public static IControl radio_No { get { return SyncUtilities.FindVisibleElement(By.Id("radio4_1")); } }
        public static IControl radio_HTML { get { return SyncUtilities.FindVisibleElement(By.Id("output_0")); } }
        public static IControl radio_Excel { get { return SyncUtilities.FindVisibleElement(By.Id("output_2")); } }
        public static IControl view_button
        {
            get { return SyncUtilities.FindVisibleElement(By.Id("form1Submit")); }
        }
    }
}
