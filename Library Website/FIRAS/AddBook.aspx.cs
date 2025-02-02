using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_Website.FIRAS
{
    public partial class AddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void addBookBtn_Click(object sender, EventArgs e)
        {
            string file = Server.MapPath("~/FIRAS/Files/Books.txt");


            if ( string.IsNullOrEmpty(Title.Text) || string.IsNullOrEmpty(Author.Text)
                    || string.IsNullOrEmpty(Category.Text) || Status.SelectedValue == "0")
            {

                messegeId.Visible = true;
                messegeId.InnerText = "Please Fill out All TextBoxs";
            }
            else
            {
                if (File.Exists(file))
                {
                    string[]books = File.ReadAllLines(file);
                    string[] book = books[books.Length - 1].Split(',');
                    int x = Convert.ToInt16(book[0]) + 1;
                    string id = x.ToString();
                    using (StreamWriter sw = new StreamWriter(file,true))
                    {
                        sw.WriteLine($"{id},{Title.Text},{Author.Text},{Category.Text},{Status.Text}");
                    }

                }
                else
                {

                    using (StreamWriter sw = File.CreateText(file))
                    {
                        sw.WriteLine($"{1},{Title.Text},{Author.Text},{Category.Text},{Status.Text}");
                    }
                }
                messegeId.Visible = true;
                messegeId.InnerText = "Book Added Successfuly";
            }
        }
    }
}