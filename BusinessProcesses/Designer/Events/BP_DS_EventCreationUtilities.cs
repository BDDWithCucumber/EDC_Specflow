//using Pages.Designer.Data;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace BusinessProcesses.Designer.Events
//{
//    public class BP_DS_EventCreationUtilities
//    {
//        public static bool AddEvent(IEnumerable<EventData> eventData, out List<String> failSiteList)
//        {
//            failSiteList = new List<String>();
//            foreach (EventData event in eventData)
//            {
//                if (!(EnterEventData(event)))
//                {
//                    return false;

//                }
//            }
//            return true;
//        }

//    public static bool EnterEventData(StudyData study)
//    {
//        BP_DS_StudyCreationUtilities.SetStudyData(DS_StudyProperties.StudyTable, study);
//        return true;
//    }
//}
//}
