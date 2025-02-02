
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.FIRAS
{
    public partial class pending : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Load();
        }

        private void Load()
        {
          
            
                string file = Server.MapPath("~/FIRAS/Files/ReservationsBook.txt");

                if (File.Exists(file))
                {
                    string[] req = File.ReadAllLines(file);

                    for (int i = 0; i < req.Length; i++)
                    {
                        string[] r = req[i].Split(',');

                        TableRow row = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = r[0];
                        row.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = r[1];
                        row.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = r[2];
                        row.Cells.Add(cell3);

                        TableCell cell4 = new TableCell();
                        cell4.Text = r[3];
                        row.Cells.Add(cell4);

                        TableCell cell5 = new TableCell();
                        cell5.Text = r[4];
                        row.Cells.Add(cell5);

                        TableCell cell6 = new TableCell();
                        cell6.Text = r[5];
                        row.Cells.Add(cell6);

                        Button btn1 = new Button();
                        btn1.Text = "Confirm";
                        btn1.CommandArgument = r[0];
                        btn1.Click += Confirm_Click;

                        TableCell cell7 = new TableCell();
                        cell7.Controls.Add(btn1);
                        row.Cells.Add(cell7);

                        Button btn2 = new Button();
                        btn2.Text = "Reject";
                        btn2.CommandArgument = r[0];
                        btn2.Click += Reject_Click;

                        TableCell cell8 = new TableCell();
                        cell8.Controls.Add(btn2);
                        row.Cells.Add(cell8);

                        tableId.Rows.Add(row);
                    }
                }
                else
                {
                    TableRow row = new TableRow();

                    TableCell cell1 = new TableCell();
                    cell1.Text = "No Data Found";
                    row.Cells.Add(cell1);

                    TableCell cell2 = new TableCell();
                    cell2.Text = "No Data Found";
                    row.Cells.Add(cell2);

                    TableCell cell3 = new TableCell();
                    cell3.Text = "No Data Found";
                    row.Cells.Add(cell3);

                    TableCell cell4 = new TableCell();
                    cell4.Text = "No Data Found";
                    row.Cells.Add(cell4);

                    TableCell cell5 = new TableCell();
                    cell5.Text = "No Data Found";
                    row.Cells.Add(cell5);

                    tableId.Rows.Add(row);
                }
            
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            // Safe parsing of the CommandArgument (index)
            int index = Convert.ToInt16(btn.CommandArgument);
            

            string file = Server.MapPath("~/FIRAS/Files/ReservationsBook.txt");

            
                string[] pending = File.ReadAllLines(file);

                List<string> ReservationsList = new List<string>();

                for (int i = 0; i < pending.Length; i++)
                {
                    string[] p = pending[i].Split(',');

                    if (index == Convert.ToInt16(p[0]))
                    {
                        // Update the status to "Accepted"
                        pending[i] = $"{p[0]},{p[1]},{p[2]},{p[3]},{p[4]},Accepted";
                    }

                    ReservationsList.Add(pending[i]);
                }

                // Write the updated list back to the file
                File.WriteAllLines(file, ReservationsList);

            // Reload the page content after updating the file
            Response.Redirect("pending.aspx");


        }

        protected void Reject_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int index = Convert.ToInt16(btn.CommandArgument);


            string file = Server.MapPath("~/FIRAS/Files/ReservationsBook.txt");

           
                string[] pending = File.ReadAllLines(file);

                List<string> ReservationsList = new List<string>();

                for (int i = 0; i < pending.Length; i++)
                {
                    string[] p = pending[i].Split(',');

                    if (index == Convert.ToInt16(p[0]))
                    {
                        // Update the status to "Rejected"
                        pending[i] = $"{p[0]},{p[1]},{p[2]},{p[3]},{p[4]},Rejected";
                    }

                    ReservationsList.Add(pending[i]);
                }

                // Write the updated list back to the file
                File.WriteAllLines(file, ReservationsList);

                // Reload the page content after updating the file
                Response.Redirect("pending.aspx");
            
          
        }
    }
}
