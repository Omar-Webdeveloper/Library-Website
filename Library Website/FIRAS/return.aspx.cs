using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Library_Website.FIRAS
{
    public partial class _return : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string file = Server.MapPath("~/FIRAS/Files/ReservationsBook.txt");

            string []data = File.ReadAllLines(file);

            List<string> list = new List<string>();

            if (File.Exists(file))
            {
                for (int i = 0; i < data.Length; i++)
                {
                    string []s = data[i].Split(',');

                    if (s[7] == "Accepted")
                    {
                        TableRow row = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = s[0];
                        row.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = s[1];
                        row.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = s[3];
                        row.Cells.Add(cell3);

                        TableCell cell4 = new TableCell();
                        cell4.Text = s[4];
                        row.Cells.Add(cell4);

                        TableCell cell5 = new TableCell();
                        cell5.Text = s[5];
                        row.Cells.Add(cell5);

                        TableCell cell6 = new TableCell();
                        cell6.Text = s[6];
                        row.Cells.Add(cell6);

                        TableCell cell7 = new TableCell();
                        cell7.Text = s[7];
                        row.Cells.Add(cell7);

                        Button btn = new Button();
                        btn.Text = "Returned";
                        btn.CommandArgument = s[0];
                        btn.Click += Returned_btn_Clicked;

                        TableCell cell8 = new TableCell();
                        cell8.Controls.Add(btn);
                        row.Cells.Add(cell8);

                        tableId.Controls.Add(row);


                    }
                }
            }
        }

        protected void Returned_btn_Clicked(object sender, EventArgs e)
        {
            string fileBookHistoryPath = Server.MapPath("~/FIRAS/Files/BookHistory.txt");
            string fileReservationsBookPath = Server.MapPath("~/FIRAS/Files/ReservationsBook.txt");

            string[] BookHistory= File.ReadAllLines(fileBookHistoryPath);
            string[] ReservationsBook = File.ReadAllLines(fileReservationsBookPath);

            Button btn =  (Button)sender;

            string index = btn.CommandArgument;
            List<string> list = new List<string>();
            if (File.Exists(fileBookHistoryPath))
            {
                for (int i = 0; i < ReservationsBook.Length; i++)
                {
                    string[] rowINReservationsBook = ReservationsBook[i].Split(',');

                    if (rowINReservationsBook[0] != index)
                    {
                        list.Add(ReservationsBook[i]);
                    }
                    else
                    {
                        using (StreamWriter sw = new StreamWriter(fileBookHistoryPath,true))
                        {
                            
                            string y = $"{rowINReservationsBook[0]},{rowINReservationsBook[1]},{rowINReservationsBook[3]}," +
                                $"{rowINReservationsBook[4]},{rowINReservationsBook[5]},{rowINReservationsBook[6]}" +
                                $",{rowINReservationsBook[7]}";

                            sw.WriteLine(y);
                        }

                          
                    }
                    
                        
                }
                File.WriteAllLines(fileReservationsBookPath, list);
                Response.Redirect("return.aspx");
            }

        }
    }
}