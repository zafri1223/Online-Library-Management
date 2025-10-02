using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Library_Management_System
{
    public partial class Report : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                // Declare the file path at the start of the method
                string filePath = @"C:\Users\zafri\Desktop\libraryreport\customer\Customer_report.csv";

                string query = "SELECT * FROM member_master_tbl"; 

                // Connect to the database and retrieve data
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            // Create a StreamWriter to write the CSV file
                            using (StreamWriter writer = new StreamWriter(filePath))
                            {
                                // Write the header row
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    writer.Write(reader.GetName(i));
                                    if (i < reader.FieldCount - 1)
                                        writer.Write(","); // Add a comma between columns
                                }
                                writer.WriteLine();

                                // Write the data rows
                                while (reader.Read())
                                {
                                    for (int i = 0; i < reader.FieldCount; i++)
                                    {
                                        string cellValue = reader[i].ToString().Replace(",", ""); // Avoid comma issues
                                        cellValue = cellValue.Replace("\n", " ").Replace("\r", " "); // Replace new lines
                                        if (cellValue.Contains(","))
                                        {
                                            cellValue = "\"" + cellValue + "\""; // Escape commas with quotes
                                        }
                                        writer.Write(cellValue);
                                        if (i < reader.FieldCount - 1)
                                            writer.Write(","); // Add a comma between columns
                                    }
                                    writer.WriteLine(); // Move to the next row
                                }
                            }
                        }
                    }
                }

                // Inform the user that the file has been generated using ClientScript
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Report generated successfully at {filePath}');", true);
            }
            catch (Exception ex)
            {
                // Handle any errors that might occur and safely display them using ClientScript
                string safeMessage = HttpUtility.JavaScriptStringEncode(ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {safeMessage}');", true);
            }



        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                // Declare the file path at the start of the method
                string filePath = @"C:\Users\zafri\Desktop\libraryreport\stockasat\Stock_as_at_report.csv";

                // Query to retrieve data from the database
                string query = "SELECT book_id, book_name, current_stock FROM book_master_tbl"; // Adjust table name or columns as needed


                // Connect to the database and retrieve data
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            // Create a StreamWriter to write the CSV file
                            using (StreamWriter writer = new StreamWriter(filePath))
                            {
                                // Write the header row
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    writer.Write(reader.GetName(i));
                                    if (i < reader.FieldCount - 1)
                                        writer.Write(","); // Add a comma between columns
                                }
                                writer.WriteLine();

                                // Write the data rows
                                while (reader.Read())
                                {
                                    for (int i = 0; i < reader.FieldCount; i++)
                                    {
                                        string cellValue = reader[i].ToString().Replace(",", ""); // Avoid comma issues
                                        cellValue = cellValue.Replace("\n", " ").Replace("\r", " "); // Replace new lines
                                        if (cellValue.Contains(","))
                                        {
                                            cellValue = "\"" + cellValue + "\""; // Escape commas with quotes
                                        }
                                        writer.Write(cellValue);
                                        if (i < reader.FieldCount - 1)
                                            writer.Write(","); // Add a comma between columns
                                    }
                                    writer.WriteLine(); // Move to the next row
                                }
                            }
                        }
                    }
                }

                // Inform the user that the file has been generated using ClientScript
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Report generated successfully at {filePath}');", true);
            }
            catch (Exception ex)
            {
                // Handle any errors that might occur and safely display them using ClientScript
                string safeMessage = HttpUtility.JavaScriptStringEncode(ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {safeMessage}');", true);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                // Declare the file path at the start of the method
                string filePath = @"C:\Users\zafri\Desktop\libraryreport\bookinventory\Book_Inventory_Report.csv";

                // Query to retrieve data from the database
                string query = "SELECT * FROM book_master_tbl"; // Adjust table name or columns as needed


                // Connect to the database and retrieve data
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            // Create a StreamWriter to write the CSV file
                            using (StreamWriter writer = new StreamWriter(filePath))
                            {
                                // Write the header row
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    writer.Write(reader.GetName(i));
                                    if (i < reader.FieldCount - 1)
                                        writer.Write(","); // Add a comma between columns
                                }
                                writer.WriteLine();

                                // Write the data rows
                                while (reader.Read())
                                {
                                    for (int i = 0; i < reader.FieldCount; i++)
                                    {
                                        string cellValue = reader[i].ToString().Replace(",", ""); // Avoid comma issues
                                        cellValue = cellValue.Replace("\n", " ").Replace("\r", " "); // Replace new lines
                                        if (cellValue.Contains(","))
                                        {
                                            cellValue = "\"" + cellValue + "\""; // Escape commas with quotes
                                        }
                                        writer.Write(cellValue);
                                        if (i < reader.FieldCount - 1)
                                            writer.Write(","); // Add a comma between columns
                                    }
                                    writer.WriteLine(); // Move to the next row
                                }
                            }
                        }
                    }
                }

                // Inform the user that the file has been generated using ClientScript
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Report generated successfully at {filePath}');", true);
            }
            catch (Exception ex)
            {
                // Handle any errors that might occur and safely display them using ClientScript
                string safeMessage = HttpUtility.JavaScriptStringEncode(ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {safeMessage}');", true);
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                // Declare the file path at the start of the method
                string filePath = @"C:\Users\zafri\Desktop\libraryreport\publisherreport\Publisher_Report.csv";

                // Query to retrieve data from the database
                string query = "SELECT * FROM publisher_master_tbl"; // Adjust table name or columns as needed


                // Connect to the database and retrieve data
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            // Create a StreamWriter to write the CSV file
                            using (StreamWriter writer = new StreamWriter(filePath))
                            {
                                // Write the header row
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    writer.Write(reader.GetName(i));
                                    if (i < reader.FieldCount - 1)
                                        writer.Write(","); // Add a comma between columns
                                }
                                writer.WriteLine();

                                // Write the data rows
                                while (reader.Read())
                                {
                                    for (int i = 0; i < reader.FieldCount; i++)
                                    {
                                        string cellValue = reader[i].ToString().Replace(",", ""); // Avoid comma issues
                                        cellValue = cellValue.Replace("\n", " ").Replace("\r", " "); // Replace new lines
                                        if (cellValue.Contains(","))
                                        {
                                            cellValue = "\"" + cellValue + "\""; // Escape commas with quotes
                                        }
                                        writer.Write(cellValue);
                                        if (i < reader.FieldCount - 1)
                                            writer.Write(","); // Add a comma between columns
                                    }
                                    writer.WriteLine(); // Move to the next row
                                }
                            }
                        }
                    }
                }

                // Inform the user that the file has been generated using ClientScript
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Report generated successfully at {filePath}');", true);
            }
            catch (Exception ex)
            {
                // Handle any errors that might occur and safely display them using ClientScript
                string safeMessage = HttpUtility.JavaScriptStringEncode(ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {safeMessage}');", true);
            }
        }


    }
}