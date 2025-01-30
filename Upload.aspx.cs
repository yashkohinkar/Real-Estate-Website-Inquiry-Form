using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property_Hub
{
    public partial class Upload : System.Web.UI.Page
    {

        protected void UploadFile(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (FileUpload1.HasFile)
                {
                    try
                    {


                        // Collect form data
                        string title = txtTitle.Text.Trim();
                        string location = txtLocation.Text.Trim();
                        string price = txtPrice.Text.Trim();
                        string description = txtDescription.Text.Trim();
                        int length = FileUpload1.PostedFile.ContentLength;
                        byte[] imageBytes = new byte[length];

                        FileUpload1.PostedFile.InputStream.Read(imageBytes, 0, length);

                        // Save to database using stored procedure
                        string connectionString = ConfigurationManager.ConnectionStrings["PropertyHub"].ConnectionString;
                        using (SqlConnection conn = new SqlConnection(connectionString))
                        {
                            using (SqlCommand cmd = new SqlCommand("sp_InsertProperty", conn))
                            {
                                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                                // Add parameters with explicit types
                                cmd.Parameters.AddWithValue("@Title", title);
                                cmd.Parameters.AddWithValue("@Location", location);
                                cmd.Parameters.AddWithValue("@Price", price);
                                cmd.Parameters.AddWithValue("@Description", description);
                                cmd.Parameters.AddWithValue("@Image", imageBytes);

                                conn.Open();
                                cmd.ExecuteNonQuery();
                            }
                        }

                        // Display success message
                        lblMessage.Text = "Property uploaded successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                        // Clear the form
                        ClearForm();
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Upload failed: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblMessage.Text = "Please select an image to upload.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        private void ClearForm()
        {
            txtTitle.Text = "";
            txtLocation.Text = "";
            txtPrice.Text = "";
            txtDescription.Text = "";
            FileUpload1.Attributes.Clear();
        }
    }
}