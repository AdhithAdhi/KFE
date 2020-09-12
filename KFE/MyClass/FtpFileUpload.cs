using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

namespace KFE.MyClass
{
    public class FtpFileUpload
    {
        string username = "AdminFtp";
        string password = "kf3@Fr3sh";

        public void FTPUpload(FileUpload FileUpload1,string Location, string fileName)
        {
            Stream stream;
            //FTP Server URL.
            string ftp = "ftp://kfefresh.com/";

            //FTP Folder name. Leave blank if you want to upload to root folder.
            string ftpFolder = "static.kfefresh.com/Images/"+ Location+"/";



            stream = FileUpload1.PostedFile.InputStream;

            try
            {
                //Create FTP Request.
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftp + ftpFolder + fileName);
                request.Method = WebRequestMethods.Ftp.UploadFile;

                //Enter FTP Server credentials.
                request.Credentials = new NetworkCredential(username, password);
                request.ContentLength = stream.Length;
                request.UsePassive = true;
                request.UseBinary = true;
                //request.ServicePoint.ConnectionLimit = fileBytes.Length;
                //request.EnableSsl = true;

                using (Stream requestStream = request.GetRequestStream())
                {
                    stream.Seek(0, SeekOrigin.Begin);
                    stream.CopyTo(requestStream);
                }

                FtpWebResponse response = (FtpWebResponse)request.GetResponse();

                response.Close();
            }
            catch (WebException ex)
            {
                throw new Exception((ex.Response as FtpWebResponse).StatusDescription);
            }
        }
        public string DeleteFile(string Location,string fileName)
        { 
            //FTP Server URL.
            string ftp = "ftp://kfefresh.com/";

            //FTP Folder name. Leave blank if you want to upload to root folder.
            string ftpFolder = "static.kfefresh.com/Images/" + Location + "/";
            FtpWebRequest request = (FtpWebRequest)WebRequest.Create(ftp + ftpFolder + fileName);
            request.Method = WebRequestMethods.Ftp.DeleteFile;
            request.Credentials = new NetworkCredential(username, password);

            using (FtpWebResponse response = (FtpWebResponse)request.GetResponse())
            {
                return response.StatusDescription;
            }
        }
    }
}