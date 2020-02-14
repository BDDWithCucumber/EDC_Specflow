using BusinessProcesses.Designer.ModalDialogs;
using Framework.Actions;
using Pages.Designer.Common;
using Pages.Designer.ModelDialog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.Designer.Common
{
    public class DS_BP_NotificationUtilities
    {
        public static bool VerifyNotification(String notificationText)
        {
            try
            {
                //if (BP_DS_Labs_StudySaveConfirmationDialog.ISDialogExist("Confirmation", "Lab Dictionary mappings will be removed"))
                //{
                //    return Control_ActionUtilities.Click(DS_Labs_StudySaveConfirmationDialog.ContinueButton, "Unable to click continue button");
                //}
                String actualText = Control_PropertyUtilities.GetText(DS_CommonObjects.NotificationPopup);
                if (actualText.Contains(notificationText))
                {
                    return true;
                }
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool VerifyNotificationForDict(String notificationText)
        {
            try
            {
                String actualText = Control_PropertyUtilities.GetText(DS_CommonObjects.DictNotificationPopup);
                 if(actualText.Equals(notificationText))
                         {
                             return true;
                         }
            }
            catch (Exception e)
            {

            }
            return false;
        }
       
    }
}
