using System.Collections.Generic;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs;
using Pages.DataLabs.Data;
using BusinessProcesses.DataLabs.Common;
using Framework;
using Common.WebTable;
using System;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_PatientUtilities
    {
        
        public static bool FillAddPatientCRF(AddPatientData PatientData)
        {
            bool isDataFilled = true;
            if (PatientData.PatientInitials != null)
            {
                if (!BP_CRFUtilities.SetValueInTextBox_FlatQuestion("Screen ID:", PatientData.ScreenID))
                {
                    isDataFilled = false;
                }

                if (!BP_CRFUtilities.SetValueInTextBox_FlatQuestion("Patient Initials:", PatientData.PatientInitials))
                {
                    isDataFilled = false;
                }
                

                if (PatientData.ScreenDate.Equals("<Today>"))
                {
                    PatientData.ScreenDate = DateTime.Today.ToShortDateString();
                }
                if (!BP_CRFUtilities.SetValueInTextBox_FlatQuestion("Screen Date:", PatientData.ScreenDate))
                {
                    isDataFilled = false;
                }
            }
            else
            {
                if (!BP_CRFUtilities.SetValueInTextBox_FlatQuestion("Patient ID:", PatientData.PatientID))
                {
                    isDataFilled = false;
                }

                if (PatientData.Date.Equals("<Today>"))
                {
                    PatientData.Date = DateTime.Today.ToShortDateString();
                }
                if (!BP_CRFUtilities.SetValueInTextBox_FlatQuestion("Date:", PatientData.Date))
                {
                    isDataFilled = false;
                }
            }
            
            return isDataFilled;
        }

        public static void AddPatients(List<AddPatientData> Patients, out List<string> FailedToAdd)
        {
            bool isPatientAdded;
            FailedToAdd = new List<string>();
            List<string> UnfilledData = new List<string>();
            foreach (AddPatientData Patient in Patients)
            {
                isPatientAdded = false;
                if (BP_ActionPaletteUtilities.InvokeActionPaletteLink("Add Patient", DL_PatientsPage.GetPatientActionPaletteID("Site Patient Actions")))
                {
                    if(DL_PatientsPage.AddPatientLabel.WebElement != null)
                    {
                        if(FillAddPatientCRF(Patient))
                        {
                            Control_ActionUtilities.Click(DL_PatientsPage.SaveNCloseBtn_AddPatient, "Unable to click on Save & Close button on Screening CRF while adding a patient.");
                            string PatID;
                            if (Patient.PatientInitials != null)
                            {
                                PatID = Patient.ScreenID + "-" + Patient.PatientInitials;
                            }
                            else
                            {
                                PatID = Patient.PatientID;
                            }
                            if(VerifyPatientInPatientsTable(PatID))
                            {
                                isPatientAdded = true;
                            }
                        }
                    }
                }
                if(!isPatientAdded)
                {
                    FailedToAdd.Add(Patient.ScreenID);
                }
            }
        }

        public static bool VerifyPatientInPatientsTable(string PatientID)
        {
            IControl Row = GetPatientRowFromPatientsTable(PatientID);
            if(Row == null)
            {
                return false;
            }
            return true;
        }

        public static bool VerifyPatientInPatientsTable(string PatientID, string Status)
        {
            IControl Row = GetPatientRowFromPatientsTable(PatientID, Status);
            if(Row == null)
            {
                return false;
            }
            return true;
        }

        public static List<string> VerifyPatientInPatientsTable(List<PatientTableData> PatientData)
        {
            List<string> Failed = new List<string>();
            foreach(PatientTableData Pat in PatientData)
            {
                if(!VerifyPatientInPatientsTable(Pat.PatientID))
                {
                    Failed.Add(Pat.PatientID);
                }
            }
            return Failed;
        }

        public static IControl GetPatientRowFromPatientsTable(string PatientID)
        {
            WebTable_SearchCriteriaItem Item = new WebTable_SearchCriteriaItem(0, PatientID, TableColumnContentType.Link);
            WebTable_SearchCriteriaItemList SearchList = new WebTable_SearchCriteriaItemList();
            SearchList.AddSearchItem(Item);
            return WebTableUtilities.Table_FindRow(DL_PatientsPage.PatientsTable, SearchList);
        }

        public static IControl GetPatientRowFromPatientsTable(string PatientID, string Status)
        {
            WebTable_SearchCriteriaItemList SList = new WebTable_SearchCriteriaItemList();
            WebTable_SearchCriteriaItem PID = new WebTable_SearchCriteriaItem(0, PatientID, TableColumnContentType.Link);
            WebTable_SearchCriteriaItem PStatus = new WebTable_SearchCriteriaItem(1, Status, TableColumnContentType.Text);
            SList.AddSearchItem(PID);
            SList.AddSearchItem(PStatus);
            return WebTableUtilities.Table_FindRow(DL_PatientsPage.PatientsTable, SList);
        }

        public static bool SelectPatientFromPatientsTable(string PatientID)
        {
            bool isPatientSelected = false;
            IControl PatientRow = GetPatientRowFromPatientsTable(PatientID);
            if(PatientID != null)
            {
                IControl Link = WebTableUtilities.GetElement(PatientRow, PatientID, 0, TableColumnContentType.Link);
                if(Link != null)
                {
                    isPatientSelected = Control_ActionUtilities.Click(Link, "Unable to select patient " + PatientID + " as patient link is not clicked.");
                }
            }
            return isPatientSelected;
        }

        public static bool FillEnrollPatientCRF(EnrollPatientData Data)
        {
            bool isDataFilled = true;
            if(Data.EnrollID != string.Empty)
            {
                if (!BP_CRFUtilities.SetValueInTextBox_FlatQuestion("Enroll ID:", Data.EnrollID))
                {
                    isDataFilled = false;
                }
            }

            if(!BP_CRFUtilities.SetValueInTextBox_FlatQuestion("Enrolled Date:", Data.EnrollDate))
            {
                isDataFilled = false;
            }
            if(Data.EntryComplete == "Yes")
            {
                if(!Control_ActionUtilities.Click(DL_CRFPage.EntryCompleteChkBox, "Unable to select Entry Complete checkbox."))
                {
                    isDataFilled = false;
                }
            }
            return isDataFilled;
        }

        public static bool EnrollAPatient(string PatientID, EnrollPatientData PatientData)
        {
            bool isEnrollSuccessful = false;
            if(Control_PropertyUtilities.GetText(DL_PatientsPage.SelectedPatient) != PatientID)
            {
                Control_ActionUtilities.LogException("Verification of Patient on selecting a patient.", "Patient detail is not displayed as " + PatientID + " on the screen.", string.Empty);
                return false;
            }
            string status = Control_PropertyUtilities.GetText(DL_PatientsPage.SelectedPatientStatus);
            if (status != "Screened")
            {
                Control_ActionUtilities.LogException("Verification of Patient status on patient details screen.", "Patient status detail is displayed as " + status + " on the screen.", string.Empty);
                return false;
            }
            if(BP_ActionPaletteUtilities.InvokeActionPaletteLink("Enroll Patient", DL_PatientsPage.GetPatientActionPaletteID("Patient Actions")))
            {
                if(FillEnrollPatientCRF(PatientData))
                {
                    //Control_ActionUtilities.Click(DL_PatientsPage.EntryCompleteChkBox, "Unable to select Entry Complete checkbox.");
                    isEnrollSuccessful = Control_ActionUtilities.SubmitSaveNCloseButton(DL_CRFPage.SaveNCloseButton_CRF, "Unable to Enroll patient.");
                }
            }
            if(isEnrollSuccessful)
            {
                status = Control_PropertyUtilities.GetText(DL_PatientsPage.SelectedPatientStatus);
                if(status != "Enrolled")
                {
                    isEnrollSuccessful = false;
                }
            }
            return isEnrollSuccessful;
        }

        public static bool VerifyDetailsOnPatientDetailsPage(string Patient, string Status, string Protocol, string PrimaryInvestigator)
        {
            bool verification = true;
            if(Patient != string.Empty)
            {
                if(Control_PropertyUtilities.GetText(DL_PatientsPage.SelectedPatient) != Patient)
                {
                    verification = false;
                }
            }
            if (Status != string.Empty)
            {
                if (Control_PropertyUtilities.GetText(DL_PatientsPage.SelectedPatientStatus) != Status)
                {
                    verification = false;
                }
            }
            if (Protocol != string.Empty)
            {
                if (Control_PropertyUtilities.GetText(DL_PatientsPage.SelectedPatientProtocol) != Protocol)
                {
                    verification = false;
                }
            }
            if (PrimaryInvestigator != string.Empty)
            {
                if (Control_PropertyUtilities.GetText(DL_PatientsPage.SelectedPatientPrimaryInvest) != PrimaryInvestigator)
                {
                    verification = false;
                }
            }
            return verification;
        }
    }
}
