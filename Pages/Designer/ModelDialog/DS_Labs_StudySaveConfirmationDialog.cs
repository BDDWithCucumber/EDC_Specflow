using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.ModelDialog
{

    //This dialog appears when study is imported and saved without LabDictionary which is in Designer instance - Confirmation
    public class DS_Labs_StudySaveConfirmationDialog : DS_Labs_ModalBase
    {
        public static IControl ContinueButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("btnOK"));
            }
        }

        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("btnCancel"));
            }
        }
    }

    //This dialog appears when MapLabDictionary is saved without selecting single LabTest or LabUnit - Error
    //This dialog appears when MapLabDictionary is saved without selecting single LabTest - Error
    //This dialog appears when MapLabDictionary is saved without selecting single LabUnit - Error
    //This dialog appears when mapping are duplicate for LabTests and LabUnits
    //This dialog appears when mapping are duplicate for LabTests
    //This dialog appears when mapping are duplicate for LabUnits
    public class DS_Labs_MapLabDictionaryErrorDialog : DS_Labs_ModalBase
    {
        public static IControl OkButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.ClassName("rwPopupButton"));
            }
        }
    }

    //This continue button appears when "Display in Reference Range as "Yes" but not mapped to any Code Value (Code Description)."
    public class DS_Labs_MapLabDictionary_RRCheckboxWarningDialog : DS_Labs_ModalBase
    {
        public static IControl ContinueButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.LinkText("Continue"));
            }
        }
    }
    
    //This dialog appears when EditSelected is cliked without selecting any row checkbox
    public class DS_Labs_MapLabDictionary_EditSelectedErrorDialog : DS_Labs_ModalBase
    {
        public static IControl OkButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("btnOK"));
            }
        }
    }

    //This dialog appears when tests/units are saved with duplicate mappings
    public class DS_Labs_MapLabDictionary_Update_DuplicateMappingsDialog : DS_Labs_MapLabDictionary_EditSelectedErrorDialog
    {

    }

    //This dialog appears when LabTests/Units are saved without any mappings
    public class DS_Labs_MapLabDictionary_Update_NomappingsDialog : DS_Labs_MapLabDictionary_EditSelectedErrorDialog
    {

    }

    //This dialog appears when RR chckbox is selected and no mapping is done for single row/multi row
    public class DS_Labs_MapLabDictionay_Update_RRChekboxWarningDialog : DS_Labs_StudySaveConfirmationDialog
    {

    }

    public class DS_Labs_MapLabDictionry_DictionayChageDialog : DS_Labs_StudySaveConfirmationDialog
    {

    }

    public class DS_Study_TargetAppDialog : DS_Labs_StudySaveConfirmationDialog
    {

    }
}