using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.FIRAS.Files
{
    public partial class ShowBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Load();
        }


        private void Load()
        {
            string file = Server.MapPath("~/FIRAS/Files/Books.txt");

            string[] books = File.ReadAllLines(file);
            //for (int i = 0; i < books.Length; i++)
            for (int i = 0; i < books.Length; i++)
                {
                string[] book = books[i].Split(',');

                TableRow row = new TableRow();

                TableCell cell1 = new TableCell();
                cell1.Text = book[0];
                row.Cells.Add(cell1);

                TableCell cell2 = new TableCell();
                cell2.Text = book[1];
                row.Cells.Add(cell2);

                TableCell cell3 = new TableCell();
                cell3.Text = book[2];
                row.Cells.Add(cell3);

                TableCell cell4 = new TableCell();
                cell4.Text = book[3];
                row.Cells.Add(cell4);

                TableCell cell5 = new TableCell();
                cell5.Text = book[4];
                row.Cells.Add(cell5);

                Button btn = new Button();

                btn.Text = "Remove";
                btn.CommandArgument = book[0];
                btn.Click += RemoveButton_Click;

                TableCell cell6 = new TableCell();
                cell6.Controls.Add(btn);
                row.Cells.Add(cell6); ;


                Button btn2 = new Button();

                btn2.Text = "Edit";
                btn2.CommandArgument = book[0];
                btn2.Click += EditButton_Click;

                TableCell cell7 = new TableCell();
                cell7.Controls.Add(btn2);
                row.Cells.Add(cell7); ;


                tableId.Rows.Add(row);
            }

        }

        protected void EditButton_Click(object sender, EventArgs e)
        {

            CardDiv.Style["display"] = "block";


            Button btn = (Button)sender;

            int index = Int16.Parse(btn.CommandArgument);

            string file = Server.MapPath("~/FIRAS/Files/Books.txt");
            string[] books = File.ReadAllLines(file);


            List<string> booksList = new List<string>();

            for (int i = 0; i < books.Length; i++)
            {
                string[] book = books[i].Split(',');
                if (Convert.ToInt16(book[0]) == index)
                {
                    Title.Text = book[1];
                    Author.Text = book[2];
                    Category.Text = book[3];
                    dropDownStatus.SelectedValue = (book[4] == "Available") ? "1" : "2";

                    confirmBtn.CommandArgument = book[0];
                }
            }
           
        }

        protected void RemoveButton_Click(object sender, EventArgs e)
        {

            
            Button btn = (Button)sender;

            int index = Convert.ToInt16(btn.CommandArgument);

            string file = Server.MapPath("~/FIRAS/Files/Books.txt");
            string[] books = File.ReadAllLines(file);

            List<string> booksList = new List<string>();
            for (int i = 0; i < books.Length; i++)
            {
                string[] book = books[i].Split(',');
                if (Convert.ToInt16(book[0]) != index)
                    booksList.Add(books[i]);
            }

            File.WriteAllLines(file, booksList);

            Response.Redirect("ShowBooks.aspx");
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            CardDiv.Style["display"] = "none";
        }
        protected void confirmBtn_Click(object sender, EventArgs e)
        {
            Button btnConfirm = (Button)sender;
            int index = Convert.ToInt16( btnConfirm.CommandArgument);

            string file = Server.MapPath("~/FIRAS/Files/Books.txt");

            string[]books = File.ReadAllLines(file);

            List<string> booksList = new List<string>();

            for(int i=0; i < books.Length; i++)
            {
                string []book = books[i].Split(',');

                if(index == Convert.ToInt16(book[0]))
                {

                    book[1] = Title.Text;
                    book[2] = Author.Text;
                    book[3] = Category.Text;
                    book[4] =( dropDownStatus.SelectedValue == "1")? "Available" : (dropDownStatus.SelectedValue == "2")? "Reserved"
                        : "0";
                    if (book[4] != "0")
                    {
                        books[i] = $"{book[0]},{Title.Text},{Author.Text},{Category.Text},{book[4]}";

                    }
                }
            }

            File.WriteAllLines(file, books);
            Response.Redirect("ShowBooks.aspx");

        }

    }
}