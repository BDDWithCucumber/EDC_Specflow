using System;
using System.IO;
using TechTalk.SpecFlow;

namespace Reports.Common
{
    public class LogGeneratorBase
    {
        public bool CreateReportsFolderForTestCase()
        {
            try
            {
                if (CreateReportsBaseFolder() && CreateDownloadsFolder())
                {
                    string runFolder = DateTime.Now.ToString();
                    runFolder = runFolder.Replace("/", "-");
                    runFolder = runFolder.Replace(":", " ");

                    FeatureContext.Current["ReportsFolderPath"] = FeatureContext.Current["ReportsFolderPath"] + @"\" + runFolder + @"\";
                    Directory.CreateDirectory(FeatureContext.Current["ReportsFolderPath"].ToString());

                    String tempFolderPath = FeatureContext.Current["ReportsFolderPath"].ToString() + "Temp";
                    FeatureContext.Current["Screenshot_TempFolder"] = tempFolderPath;
                    Directory.CreateDirectory(tempFolderPath);

                    FeatureContext.Current["DownloadsFolderPath"] = FeatureContext.Current["DownloadsFolderPath"] + @"\" + runFolder + @"\";
                    Directory.CreateDirectory(FeatureContext.Current["DownloadsFolderPath"].ToString());

                    FeatureContext.Current.Add("RunFolder", runFolder);

                    return true;
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }

        bool CreateDownloadsFolder()
        {
            try
            {
                String BasePath = GetBasePath();
                BasePath = BasePath + @"\Downloads\";
                if (!Directory.Exists(BasePath))
                {
                    Directory.CreateDirectory(BasePath);
                }
                FeatureContext.Current.Add("DownloadsFolderPath", BasePath + FeatureContext.Current.FeatureInfo.Title);
                if (!Directory.Exists(FeatureContext.Current["DownloadsFolderPath"].ToString()))
                {
                    Directory.CreateDirectory(FeatureContext.Current["DownloadsFolderPath"].ToString());
                }
                return true;
            }
            catch (Exception e)
            {
            }
            return false;
        }

        bool CreateReportsBaseFolder()
        {
            try
            {
                String BasePath = GetBasePath();
                BasePath = BasePath + @"\Executed Test Reports\";
                if (!Directory.Exists(BasePath))
                {
                    Directory.CreateDirectory(BasePath);
                }
                FeatureContext.Current.Add("ReportsFolderName", FeatureContext.Current.FeatureInfo.Title);
                FeatureContext.Current.Add("ReportsFolderPath", BasePath + FeatureContext.Current["ReportsFolderName"]);
                if (!Directory.Exists(FeatureContext.Current["ReportsFolderPath"].ToString()))
                {
                    Directory.CreateDirectory(FeatureContext.Current["ReportsFolderPath"].ToString());
                }
                return true;
            }
            catch (Exception e)
            {
            }
            return false;
        }

        String GetBasePath()
        {
            try
            {
                String basePath = Path.GetDirectoryName(Path.GetDirectoryName(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase)));
                return basePath.Replace("file:\\", "");
            }
            catch (Exception e)
            {

            }
            return String.Empty;
        }
    }
}