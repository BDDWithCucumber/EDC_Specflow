using System;
using System.IO;
using System.IO.Compression;
using System.Threading;

namespace BusinessProcesses.DataLabs.FileExplorer
{
    public class BP_FileUtilites
    {
        public static bool CheckForFullyDownloadedFile(String fullFilePath)
        {
            Thread.Sleep(5000);
            try
            {
                if (File.Exists(fullFilePath))
                {
                    int i = 0;
                    DateTime lastModifiedTime = DateTime.Now;
                    while (i < 25)
                    {
                        DateTime modifiedDateTime = File.GetLastWriteTime(fullFilePath);
                        if (lastModifiedTime.Equals(modifiedDateTime))
                        {
                            return true;
                        }
                        lastModifiedTime = modifiedDateTime;
                        ++i;
                        Thread.Sleep(5000);
                    }
                    return false;
                }
                return false;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool UnzipFolder(string zipFolderFullPath)
        {
            try
            {
                String unzipFolderPath = zipFolderFullPath.Remove(zipFolderFullPath.Length - 4);
                ZipFile.ExtractToDirectory(zipFolderFullPath, unzipFolderPath);
                return true;
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool IsFolderExist(string unzippedFullFolderPath)
        {
            try
            {
                return Directory.Exists(unzippedFullFolderPath);
            }
            catch(Exception e)
            {

            }
            return false;
        }
        public static bool FindAndSaveFile(string FolderPath, string Exportxml,string destinationFileName)
        {
            try
            {
                
                Array FilesList = Directory.GetFiles(FolderPath);
                foreach(string exportfile in FilesList)
                {
                    if (exportfile.Contains(Exportxml))
                    {
                        File.Copy(exportfile, destinationFileName, true);
                        return true;
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
