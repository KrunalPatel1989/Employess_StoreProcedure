using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace Employess_StoreProcedure
{
    public partial class Employee : System.Web.UI.Page
    {
        private string empconnectionstring = ConfigurationManager.ConnectionStrings["Employeedb"].ConnectionString;
        private SqlCommand _sqlCommand;
        private SqlDataAdapter _sqlDataAdapter;
        DataSet _dtSet;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                empbind();
            }
        }
        public void empconnection()
        {
        }
        public void empbind()
        {
            SqlConnection cn=new SqlConnection(empconnectionstring);
            cn.Open();
            _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = cn;
            _sqlCommand.CommandText = "sp_empview";
            _sqlCommand.CommandType = CommandType.StoredProcedure;
            _sqlCommand.Parameters.AddWithValue("@Event", "Select");
            _sqlDataAdapter = new SqlDataAdapter(_sqlCommand);
            _dtSet = new DataSet();
            _sqlDataAdapter.Fill(_dtSet);
            grvEmployee.DataSource = _dtSet;
            grvEmployee.DataBind();
            cn.Close();
            _sqlCommand.Dispose();

            /*empcmd.CommandText = "sp_empview";
            empcmd.CommandType = CommandType.StoredProcedure;
            empcmd.Parameters.AddWithValue("@Event", "Select");
            empad = new SqlDataAdapter(empcmd);
            ds = new DataSet();
            empad.Fill(ds); 
            grvEmployee.DataSource = ds;
            grvEmployee.DataBind();*/
        }
        protected void btnAddEmployee_Click(object sender, EventArgs e)
        {

           SqlConnection cn=new SqlConnection(empconnectionstring);
            cn.Open();
            _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = cn;
            _sqlCommand.CommandText = "sp_empview";
            _sqlCommand.CommandType= CommandType.StoredProcedure;
            _sqlCommand.Parameters.AddWithValue("@Event", "Add");
            _sqlCommand.Parameters.AddWithValue("@FirstName", Convert.ToString(txtFirstName.Text.Trim()));
            _sqlCommand.Parameters.AddWithValue("@LastName", Convert.ToString(txtLastName.Text.Trim()));
            _sqlCommand.Parameters.AddWithValue("@PhoneNumber", Convert.ToString(txtPhoneNumber.Text.Trim()));
            _sqlCommand.Parameters.AddWithValue("@EmailAddress", Convert.ToString(txtEmailAddress.Text.Trim()));
            _sqlCommand.Parameters.AddWithValue("@Salary", Convert.ToString(txtSalary.Text.Trim()));
             _sqlCommand.ExecuteNonQuery();
            empbind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(empconnectionstring);
            cn.Open();
            _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = cn;
            _sqlCommand.CommandText = "sp_empview";
            _sqlCommand.CommandType = CommandType.StoredProcedure;
            _sqlCommand.Parameters.AddWithValue("@Event", "Update");
            _sqlCommand.Parameters.AddWithValue("@FirstName", Convert.ToString(txtFirstName.Text.Trim()));
            _sqlCommand.Parameters.AddWithValue("@LastName", Convert.ToString(txtLastName.Text.Trim()));
            _sqlCommand.Parameters.AddWithValue("@PhoneNumber", Convert.ToString(txtPhoneNumber.Text.Trim()));
            _sqlCommand.Parameters.AddWithValue("@EmailAddress", Convert.ToString(txtEmailAddress.Text.Trim()));
            _sqlCommand.Parameters.AddWithValue("@Salary", Convert.ToDecimal(txtSalary.Text));
            _sqlCommand.Parameters.AddWithValue("@EmpId", Convert.ToDecimal(Session["id"]));

            int result = Convert.ToInt32(_sqlCommand.ExecuteNonQuery());
            empbind();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

        }
        protected void grvEmployee_RowEditing(object sender, GridViewEditEventArgs e)
        {
            SqlConnection cn = new SqlConnection(empconnectionstring);
            cn.Open();
            _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = cn;

            int RowIndex = e.NewEditIndex;
            Label empid = (Label)grvEmployee.Rows[RowIndex].FindControl("lblEmpId");
            Session["id"] = empid.Text;
            txtFirstName.Text = ((Label)grvEmployee.Rows[RowIndex].FindControl("lblFirstName")).Text.ToString();
            txtLastName.Text = ((Label)grvEmployee.Rows[RowIndex].FindControl("lblLastName")).Text.ToString();
            txtPhoneNumber.Text = ((Label)grvEmployee.Rows[RowIndex].FindControl("lblPhoneNumber")).Text.ToString();
            txtEmailAddress.Text = ((Label)grvEmployee.Rows[RowIndex].FindControl("lblEmailAddress")).Text.ToString();
            txtSalary.Text = ((Label)grvEmployee.Rows[RowIndex].FindControl("lblSalary")).Text.ToString();

        }
        protected void grvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection cn = new SqlConnection(empconnectionstring);
            cn.Open();
            _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = cn;

            Label id = (Label)grvEmployee.Rows[e.RowIndex].FindControl("lblEmpId");
            _sqlCommand.CommandText = "sp_empview";
            _sqlCommand.Parameters.AddWithValue("@Event", "Delete");
            _sqlCommand.Parameters.AddWithValue("@EmpId", Convert.ToInt32(id.Text));
            _sqlCommand.CommandType = CommandType.StoredProcedure;
            int result = Convert.ToInt32(_sqlCommand.ExecuteNonQuery());
            empbind();
        }
        protected void grvEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        protected void grvEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }
    }
}