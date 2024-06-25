using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.IO;

/// <summary>
/// Summary description for Logger
/// </summary>
public class Logger
{
    public Logger()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void LogError(string ex)
    {
        string path = ConfigurationManager.AppSettings["LogFilePath"];
        try
        {
            if (!File.Exists(path))
                Directory.CreateDirectory(path);
        }
        catch (Exception) { }
        using (StreamWriter file = new StreamWriter(path + "/Log_" + DateTime.Now.ToString("dd_MMM_yyyy") + ".txt", true))
        {
            try
            {
                file.WriteLine(DateTime.Now.ToString() + ": " + ex + "\r\n");
                file.Close();
            }
            catch (Exception)
            {
            }
            finally
            {
                file.Dispose();
            }
        }
    }
}