﻿using System;
using System.IO;
using System.Web.UI.WebControls;
namespace Library_Website.SARA
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string filePath = Server.MapPath("registration.txt");
                if (File.Exists(filePath))
                {
                    string[] lines = File.ReadAllLines(filePath);
                    string[] loggedInUser = File.ReadAllLines(Server.MapPath("emailForLogin.txt"));
                    foreach (string line in lines)
                    {
                        string[] data = line.Split(',');

                        if (data[3] == loggedInUser[0])  // تأكد من وجود جميع الحقول
                        {
                            userN.Text = data[0].Trim();
                            fName.Text = data[0].Trim();
                            uName.Text = data[1].Trim();
                            tel.Text = data[2].Trim();
                            email.Text = data[3].Trim();

                            break;
                        }
                    }
                }
                else
                {
                    lblMessage.Text = "File not found.";
                }

                bookTab_Click();
            }
        }

        protected void bookTab_Click()
        {

            string [] bookHistoryFile = File.ReadAllLines(Server.MapPath("BookHistory.txt"));
            string bookResFile = Server.MapPath("ReservationsBook.txt");
            string loggedUser = File.ReadAllText(Server.MapPath("emailForLogin.txt"));
            string[] books = File.ReadAllLines(Server.MapPath("Books.txt"));
            var bookName="";
            //Current Books
            string[] currentBookings = File.ReadAllLines(bookResFile);

            for(int i=0; i < currentBookings.Length; i++)
            {
                string[] bookReq = currentBookings[i].Split(',');
                if (bookReq[1] == loggedUser.Trim())
                {
                    foreach(string book in books)
                    {
                        string[] bookData = book.Split(',');
                        if (bookReq[2] == bookData[0])
                        {
                            bookName = bookData[1];
                            break;
                        }
                    }

                    TableRow tableRow = new TableRow();
                    TableCell cell1 = new TableCell();
                    TableCell cell2 = new TableCell();
                    TableCell cell3 = new TableCell();
                    cell1.Text = bookName;
                    cell2.Text = bookReq[3];
                    cell3.Text = bookReq[5];

                    tableRow.Cells.Add(cell1);
                    tableRow.Cells.Add(cell2);
                    tableRow.Cells.Add(cell3);

                    currentBookingsTable.Rows.Add(tableRow);
                }
            }

            //History Book
            for (int i = 0; i < bookHistoryFile.Length; i++)
            {
                string[] historyData = bookHistoryFile[i].Split(',');
                if (historyData[1] == loggedUser.Trim())
                {
                    foreach (string book in books)
                    {
                        string[] bookData = book.Split(',');
                        if (historyData[0] == bookData[0])
                        {
                            bookName = bookData[1];
                            break;
                        }
                    }

                    TableRow tableRow = new TableRow();
                    TableCell cell1 = new TableCell();
                    TableCell cell2 = new TableCell();
                    TableCell cell3 = new TableCell();
                    cell1.Text = bookName;
                    cell2.Text = historyData[2];
                    cell3.Text = historyData[4];

                    tableRow.Cells.Add(cell1);
                    tableRow.Cells.Add(cell2);
                    tableRow.Cells.Add(cell3);

                    previousBookingsTable.Rows.Add(tableRow);
                }
            }


            //Current Room
            string[] allRooms = File.ReadAllLines(Server.MapPath("Rooms.txt"));
            string[] resRooms = File.ReadAllLines(Server.MapPath("ReservationsRoom.txt"));
            string[] historyRooms = File.ReadAllLines(Server.MapPath("RoomHistory.txt"));
            var roomType = "";

            for (int i = 0; i < resRooms.Length; i++)
            {
                string[] roomReq = resRooms[i].Split(',');
                if (roomReq[1] == loggedUser.Trim())
                {
                    foreach (string room in allRooms)
                    {
                        string[] roomData = room.Split(',');
                        if (roomReq[2] == roomData[0])
                        {
                            roomType = roomData[1];
                            break;
                        }
                    }

                    TableRow tableRow = new TableRow();
                    TableCell cell1 = new TableCell();
                    TableCell cell2 = new TableCell();
                    TableCell cell3 = new TableCell();
                    cell1.Text = roomType;
                    cell2.Text = roomReq[3];
                    cell3.Text = roomReq[5];

                    tableRow.Cells.Add(cell1);
                    tableRow.Cells.Add(cell2);
                    tableRow.Cells.Add(cell3);

                    currentRooms.Rows.Add(tableRow);
                }
            }

            //History Room
            for (int i = 0; i < historyRooms.Length; i++)
            {
                string[] historyData = historyRooms[i].Split(',');
                if (historyData[1] == loggedUser.Trim())
                {
                    foreach (string room in allRooms)
                    {
                        string[] roomData = room.Split(',');
                        if (historyData[0] == roomData[0])
                        {
                            roomType = roomData[1];
                            break;
                        }
                    }

                    TableRow tableRow = new TableRow();
                    TableCell cell1 = new TableCell();
                    TableCell cell2 = new TableCell();
                    TableCell cell3 = new TableCell();
                    cell1.Text = roomType;
                    cell2.Text = historyData[2];

                    tableRow.Cells.Add(cell1);
                    tableRow.Cells.Add(cell2);

                    previousRooms.Rows.Add(tableRow);
                }
            }
        }
    }
}