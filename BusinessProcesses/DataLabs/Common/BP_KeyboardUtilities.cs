using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BusinessProcesses.DataLabs.Common
{
    public class BP_KeyboardUtilities
    {
        public static bool PressPageUpKey()
        {
            try
            {
                SendKeys.SendWait("{PGUP}");
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool PressPageDownKey()
        {
            try
            {
                SendKeys.SendWait("{PGDN}");
            }
            catch (Exception e)
            {

            }
            return false;
        }
    }
}