using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Property_Hub
{
    public partial class Index : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["PropertyHub"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProperties();
            }
        }

        private void BindProperties()
        {
            try
            {
                DataTable dtProperties = new DataTable();

                using (SqlConnection connection = new SqlConnection(connectionString))
                using (SqlCommand command = new SqlCommand("GetAllProperties", connection))
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    adapter.Fill(dtProperties);
                }

                rptProperties.DataSource = dtProperties;
                rptProperties.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred while fetching properties: " + ex.Message;
            }
        }

        protected void Submitbutton_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtname.Text;
                string phonenumber = txtphonenumber.Text;
                string email = txtemail.Text;
                string budget = txtbudget.Text;
                string location = ddllocation.SelectedValue;
                string amenities = string.Join(",",
                    cbamenities.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Value));
                string possession = string.Join(",",
                    cbpossession.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Value));
                string flattype = ddlflattype.SelectedValue;

                using (SqlConnection connection = new SqlConnection(connectionString))
                using (SqlCommand cmd = new SqlCommand("InsertInquiry", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Phone", phonenumber);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Budget", budget);
                    cmd.Parameters.AddWithValue("@Location", location);
                    cmd.Parameters.AddWithValue("@Amenities", amenities);
                    cmd.Parameters.AddWithValue("@FlatType", flattype);
                    cmd.Parameters.AddWithValue("@Possession", possession);

                    connection.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "Data Submitted Successfully";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}