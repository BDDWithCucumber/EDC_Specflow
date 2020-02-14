using Interfaces;
using OpenQA.Selenium;
using System;
using Utilities;

namespace Pages.DataLabs.Study
{
    public class DL_PublishStudyFlagsPage
    {
        public static IControl ReasonTextbox
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_txtReason"));
            }
        }
        public static IControl ContinueButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_btnPublish"));
            }
        }
        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_btnCancel"));
            }
        }

        public static IControl GetRadioButton(String radioButtonText, String flagOrSignatureText)
        {
            if (flagOrSignatureText.Equals("Change SD-Verify Flags?") && radioButtonText.Equals("Yes", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_rdoSDVerifyYes"));
            }
            else if (flagOrSignatureText.Equals("Change SD-Verify Flags?") && radioButtonText.Equals("No", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_rdoSDVerifyNo"));
            }
            else if (flagOrSignatureText.Equals("Change D-Review Flags?") && radioButtonText.Equals("Yes", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_rdoDReviewYes"));
            }
            else if (flagOrSignatureText.Equals("Change D-Review Flags?") && radioButtonText.Equals("No", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_rdoDReviewNo"));
            }
            else if (flagOrSignatureText.Equals("Change M-Review Flags?") && radioButtonText.Equals("Yes", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_rdoMReviewYes"));
            }
            else if (flagOrSignatureText.Equals("Change M-Review Flags?") && radioButtonText.Equals("No", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_rdoMReviewNo"));
            }
            else if (flagOrSignatureText.Equals("Change Signatures?") && radioButtonText.Equals("Yes", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_rdoSignaturesYes"));
            }
            else if (flagOrSignatureText.Equals("Change Signatures?") && radioButtonText.Equals("No", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("Study_ProtocolPublishFlags_rdoSignaturesNo"));
            }
            return null;
        }
    }
}