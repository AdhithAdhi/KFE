using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace KFE.MyClass
{
    public static class Mail
    {
        static string mail = "info@kfefresh.com";
        static string password = "kf3@Fr3sh";

        public static void Sent(string recipiantMail,string subject,string body)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(mail,"KfeFresh");
            message.To.Add(recipiantMail);
            message.Subject = subject;
            message.Body = body;
            message.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.UseDefaultCredentials = false;
            smtp.EnableSsl = false;
            smtp.Credentials = new System.Net.NetworkCredential(mail, password);
            smtp.Send(message);
        } 
    }
}