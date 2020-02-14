using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;

namespace EDC_Automation.Helpers
{
    class ConfigurationHelper
    {

        const String LabsAppUrlSettingName = "DataLabsURL";
        const String UserNameSettingName = "UserName";
        const String PasswordSettingName = "Password";
        const String WFUserNameSettingName = "WFUserName";
        const String WFPasswordNameSettingName = "WFPassword";
        const String User1SettingName = "User1";
        const String Password1SettingName = "Password1";
        const String DataManager_UserNameSettingName = "DataManager_UserName";
        const String DataManager_PasswordSettingName = "DataManager_Password";
        const String BrowserTypeSettingName = "BrowserType";
        const String TestAdminSettingName = "TestAdmin";
        const String DataLabsURLSettingName = "DataLabsURL";
        const String DesignerURLSettingName = "DesignerURL";
        const String WebFocusURLSettingName = "WebFocusUrl";
        const String DesignerEnabledSettingName = "Designer";
        const String WebFocusEnabledSettingName = "WebFocus";
        const String MaxWaitSettingName = "MaxWaitInSeconds";
        const String ApplicationSettingName = "Application";
        const String AppVersionSettingName = "AppVersion";
        const String DatabaseSettingName = "DatabaseName";
        const String DatabaseServerSettingName = "DatabaseServerName";
        const String DatabaseUserSettingName = "DatabaseUserName";
        const String DatabasePwdSettingName = "DatabaseUserPwd";
        const String WebServiceEndPointSettingName = "WebServiceEndPoint";
        const String DLInstanceNameSettingName = "DLInstanceName";
        const String DSDatabaseSettingName = "DSDatabaseName";
        const String DSDatabaseServerSettingName = "DSDatabaseServerName";
        const String DSDatabaseUserSettingName = "DSDatabaseUserName";
        const String DSDatabasePwdSettingName = "DSDatabaseUserPwd";
        const String DSWebServiceEndPointSettingName = "DSWebServiceEndPoint";
        const String DSInstanceNameSettingName = "DSInstanceName";
        const String DLODMEndPointURL = "ODMEndpointURL";

        public static String UserName => GetValue(UserNameSettingName);
        public static String Password => GetValue(PasswordSettingName);
        public static String WFUserName => GetValue(WFUserNameSettingName);
        public static String WFPassword => GetValue(WFPasswordNameSettingName);
        public static String DataManager_UserName => GetValue(DataManager_UserNameSettingName);
        public static String DataManager_Password => GetValue(DataManager_PasswordSettingName);
        public static String BrowserType => GetValue(BrowserTypeSettingName);
        public static String TestAdmin => GetValue(TestAdminSettingName);
        public static String DataLabsURL => GetValue(DataLabsURLSettingName);
        public static String WebFocusURL => GetValue(WebFocusURLSettingName);
        public static String Application => GetValue(ApplicationSettingName);
        public static String AppVersion => GetValue(AppVersionSettingName);
        public static String User1 => GetValue(User1SettingName);
        public static String Password1 => GetValue(Password1SettingName);
        public static String DatabaseName => GetValue(DatabaseSettingName);
        public static String DatabaseServerName => GetValue(DatabaseServerSettingName);
        public static String DatabaseUserName => GetValue(DatabaseUserSettingName);
        public static String DatabaseUserPwd => GetValue(DatabasePwdSettingName);
        public static String WebServiceEndPoint => GetValue(WebServiceEndPointSettingName);
        public static String DLInstanceName => GetValue(DLInstanceNameSettingName);
        public static String DSDatabaseName => GetValue(DSDatabaseSettingName);
        public static String DSDatabaseServerName => GetValue(DSDatabaseServerSettingName);
        public static String DSDatabaseUserName => GetValue(DSDatabaseUserSettingName);
        public static String DSDatabaseUserPwd => GetValue(DSDatabasePwdSettingName);
        public static String DSWebServiceEndPoint => GetValue(DSWebServiceEndPointSettingName);
        public static String DSInstanceName => GetValue(DSInstanceNameSettingName);

        public static String ODMEndpointURL => GetValue(DLODMEndPointURL);
        public static String DesignerUrl => GetValue(DesignerURLSettingName);
        public static bool IsDesignerEnabled => !String.IsNullOrEmpty(GetValue(DesignerEnabledSettingName)) && GetValue(DesignerEnabledSettingName).Equals("Yes", StringComparison.InvariantCultureIgnoreCase);
        public static bool IsWebFocusEnabled => !String.IsNullOrEmpty(GetValue(WebFocusEnabledSettingName)) && GetValue(WebFocusEnabledSettingName).Equals("Yes", StringComparison.InvariantCultureIgnoreCase);

        static Dictionary<String, String> Dictionary { get; set; }

        static ConfigurationHelper()
        {
            Dictionary = new Dictionary<String, String>();
            Init();
        }

        static void Init()
        {
            try
            {
                String filePath1 = @"C:\Automation.txt";
                String filePath2 = @"C:\Automation\Automation.txt";
                String filePath = String.Empty;

                if (File.Exists(filePath1))
                {
                    filePath = filePath1;
                }
                else if (File.Exists(filePath2))
                {
                    filePath = filePath2;
                }

                if (!String.IsNullOrEmpty(filePath) && File.Exists(filePath))
                {
                    StreamReader reader = new StreamReader(filePath);
                    using (reader)
                    {
                        while (!reader.EndOfStream)
                        {
                            String line = reader.ReadLine();
                            AddEntry(line);
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }
        }

        static void AddEntry(String line)
        {
            if (!String.IsNullOrEmpty(line))
            {
                String[] sArray = line.Split('=');
                if (sArray.Length == 2)
                {
                    String value1 = sArray[0].Trim();
                    String value2 = sArray[1].Trim();
                    if (!String.IsNullOrEmpty(value1) && !String.IsNullOrEmpty(value2) && !Dictionary.ContainsKey(value1))
                    {
                        Dictionary.Add(sArray[0], sArray[1]);
                    }
                }
            }
        }

        public static String GetValue(String key)
        {
            if (Dictionary.Count > 0 && Dictionary.ContainsKey(key))
            {
                return Dictionary[key];
            }
            return ConfigurationManager.AppSettings[key];
        }
    }
}