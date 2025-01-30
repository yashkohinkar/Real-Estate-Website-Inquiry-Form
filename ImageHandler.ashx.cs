using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web;

namespace Property_Hub
{
    /// <summary>
    /// Summary description for ImageHandler
    /// </summary>
    public class ImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["PropertyHub"].ConnectionString;
            string storedProcedure = "GetImageById";
            int imageId;

            if (!int.TryParse(context.Request.QueryString["id"], out imageId))
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Invalid Image ID.");
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(storedProcedure, connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@Id", imageId));

                connection.Open();
                object result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    byte[] imageData = (byte[])result;
                    string imageFormat = GetImageFormat(imageData);
                    context.Response.ContentType = imageFormat;
                    context.Response.BinaryWrite(imageData);
                }
                else
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Image not found.");
                }
            }
        }

        private string GetImageFormat(byte[] imageData)
        {
            if (imageData.Length < 4)
                return "application/octet-stream";

            // Check for JPEG
            if (imageData[0] == 0xFF && imageData[1] == 0xD8)
                return "image/jpeg";

            // Check for PNG
            if (imageData[0] == 0x89 && imageData[1] == 0x50 && imageData[2] == 0x4E && imageData[3] == 0x47)
                return "image/png";

            // Check for GIF
            if (imageData[0] == 0x47 && imageData[1] == 0x49 && imageData[2] == 0x46)
                return "image/gif";

            // Check for BMP
            if (imageData[0] == 0x42 && imageData[1] == 0x4D)
                return "image/bmp";

            return "application/octet-stream";
        }

        public bool IsReusable => false;
    }
}