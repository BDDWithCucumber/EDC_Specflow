using Framework;
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients;
using System;
using System.Collections.Generic;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_PatientCasebookUtilities
    {
        public static bool VerifyPatientCasebook(String eventName, List<PatientCasebookData> dataList)
        {
            try
            {
                foreach (PatientCasebookData data in dataList)
                {
                    IControl crfCell = null;
                    IControl formRow = BP_Patient_EventFormUtilities.GetFormRow(eventName, data.CRF, out crfCell);
                    if (!Control_PropertyUtilities.IsControlNull(formRow) &&
                        !Control_PropertyUtilities.IsControlNull(crfCell))
                    {
                        if (!String.IsNullOrEmpty(data.FormStatus))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 0);
                            if (!VerifyImage(cell, data.FormStatus))
                            { return false; }
                        }
                        if (!String.IsNullOrEmpty(data.DCF))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 1);
                            if (!VerifyImage(cell, data.DCF))
                            { return false; }
                        }
                        if (!String.IsNullOrEmpty(data.SDVerify))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 2);
                            if (!VerifyImage(cell, data.SDVerify))
                            { return false; }
                        }
                        if (!String.IsNullOrEmpty(data.MReview))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 3);
                            if (!VerifyImage(cell, data.MReview))
                            { return false; }
                        }
                        if (!String.IsNullOrEmpty(data.DReview))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 4);
                            if (!VerifyImage(cell, data.DReview))
                            { return false; }
                        }
                        if (!String.IsNullOrEmpty(data.Signed))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 5);
                            if (!VerifyImage(cell, data.Signed))
                            { return false; }
                        }
                        if (!String.IsNullOrEmpty(data.Frozen))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 6);
                            if (!VerifyImage(cell, data.Frozen))
                            { return false; }
                        }
                        if (!String.IsNullOrEmpty(data.Locked))
                        {
                            IControl cell = WebTableUtilities.GetCell(formRow, 7);
                            if (!VerifyImage(cell, data.Locked))
                            { return false; }
                        }
                    }
                }
                return true;
            }
            catch (Exception e)
            {
            }
            return false;
        }

        private static bool VerifyImage(IControl cell, string expected)
        {
            try
            {
                if (!Control_PropertyUtilities.IsControlNull(cell))
                {
                    IControl image = DL_Patient_EventFormsPage.GetImageInPatientCasebookCell(cell);
                    if (!Control_PropertyUtilities.IsControlNull(image))
                    {
                        bool found = false;
                        String srcProperty = Control_PropertyUtilities.GetAttributeValue(image, "src", out found);
                        if (found)
                        {
                            if (expected.Equals("On", StringComparison.InvariantCultureIgnoreCase))
                            {
                                return srcProperty.EndsWith("/yes.gif", StringComparison.InvariantCultureIgnoreCase);
                            }
                            else if (expected.Equals("Off", StringComparison.InvariantCultureIgnoreCase))
                            {
                                return srcProperty.EndsWith("/no.gif", StringComparison.InvariantCultureIgnoreCase);
                            }
                            else if (expected.Equals("Some", StringComparison.InvariantCultureIgnoreCase))
                            {
                                return srcProperty.EndsWith("/some.gif", StringComparison.InvariantCultureIgnoreCase);
                            }
                            else if (expected.Equals("Ready", StringComparison.InvariantCultureIgnoreCase))
                            {
                                return srcProperty.EndsWith("/no_ready.gif", StringComparison.InvariantCultureIgnoreCase);
                            }
                            else if (expected.Equals("Signed", StringComparison.InvariantCultureIgnoreCase))
                            {
                                return srcProperty.EndsWith("/yes.gif", StringComparison.InvariantCultureIgnoreCase);
                            }
                            else if (expected.Equals("Rejected", StringComparison.InvariantCultureIgnoreCase))
                            {
                                return srcProperty.EndsWith("/no_rejected.gif", StringComparison.InvariantCultureIgnoreCase);
                            }
                            else if(expected.Equals("Changed", StringComparison.InvariantCultureIgnoreCase))
                            {
                                return srcProperty.EndsWith("/changed.gif", StringComparison.InvariantCultureIgnoreCase);
                            }
                            else if (expected.Equals("PartialSubmit", StringComparison.InvariantCultureIgnoreCase))
                            {
                                return srcProperty.EndsWith("/doc_partialsubmit.gif", StringComparison.InvariantCultureIgnoreCase);
                            }
                            else if (expected.Equals("Submit", StringComparison.InvariantCultureIgnoreCase))
                            {
                                return srcProperty.EndsWith("/doc_s.gif", StringComparison.InvariantCultureIgnoreCase);
                            }
                            else if (expected.Equals("NotSaved", StringComparison.InvariantCultureIgnoreCase))
                            {
                                return srcProperty.EndsWith("/doc_notstarted.gif", StringComparison.InvariantCultureIgnoreCase);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }
    }
}