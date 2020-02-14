using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.Designer.ManageSponsors
{
    public class DS_ManageSponsors
    {
        public static IControl SponsorName { get { return SyncUtilities.FindVisibleElement(By.Name("ctl00$ContentBody$grdSponsor$ctl00$ctl02$ctl04$txtClientCode")); } }
        public static IControl SponsorLabel { get { return SyncUtilities.FindVisibleElement(By.Name("ctl00$ContentBody$grdSponsor$ctl00$ctl02$ctl04$txtClientName")); } }
        public static IControl SponsorSaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_grdSponsor_ctl00_ctl02_ctl04_btnSave")); } }
    }
}
