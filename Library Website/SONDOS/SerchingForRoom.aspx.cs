using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Library_Website.SONDOS
{
    public partial class SerchingForRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

            protected void btnSearch_Click(object sender, EventArgs e)
            {
                string file = Server.MapPath("~/App_Data/Rooms.txt");

                if (File.Exists(file))
                {
                    string[] roomsData = File.ReadAllLines(file);

                    foreach (string room in roomsData)
                    {
                        string[] roomData = room.Split(',');

                        switch (roomData[1])
                        {
                            case "Single":
                                singleLabel.Text = roomData[3];
                                singleLabel.Visible = true;
                                singleBook.Visible = roomData[3] != "Booked";
                                break;

                            case "Double":
                                doubleLabel.Text = roomData[3];
                                doubleLabel.Visible = true;
                                doubleRoom.Visible = roomData[3] != "Booked";

                            break;

                            case "Meeting":
                                meetingLabel.Text = roomData[3];
                                meetingLabel.Visible = true;
                                meetingRoom.Visible= roomData[3] != "Booked";
                                break;

                            case "Studying":
                                studyingLabel.Text = roomData[3];
                                studyingLabel.Visible = true;
                                studyingRoom.Visible= roomData[3] != "Booked";
                                break;
                        }
                    }
                }
                else
                {
                    singleLabel.Text = "Room data not found.";
                    singleLabel.Visible = true;
                }
            }



            protected void singleBook_Click(object sender, EventArgs e)
            {
                string roomID = "1";
                string fileLogin = Server.MapPath("~/App_Data/loginUser.txt");
                string fileReservations = Server.MapPath("~/App_Data/roomReserv.txt");



                string username = "";
                if (File.Exists(fileLogin))
                {
                    string[] userData = File.ReadAllLines(fileLogin);
                    if (userData.Length > 0)
                    {
                        string[] userDetails = userData[0].Split(',');
                        if (userDetails.Length > 1)
                        {
                            username = userDetails[1]; 
                        }
                    }
                }



                int newReservationID = 1; 
                if (File.Exists(fileReservations))
                {
                    string[] reservations = File.ReadAllLines(fileReservations);
                    if (reservations.Length > 0)
                    {
                    
                        string lastLine = reservations.Last();
                        string[] lastReservationData = lastLine.Split(',');

                        if (int.TryParse(lastReservationData[0], out int lastID))
                        {
                            newReservationID = lastID + 1;
                        }
                    }
                }

                    DateTime startTime = DateTime.Now; 
                    DateTime endTime = startTime.AddHours(2); 
                    string status = "Pending"; 

          
                    string reservationData = $"{newReservationID},{username},{roomID},{startTime},{endTime},{status}";

                    File.AppendAllText(fileReservations, reservationData + Environment.NewLine);




            }

        protected void doubleRoom_Click(object sender, EventArgs e)
            {
            string roomID = "2";
            string fileLogin = Server.MapPath("~/App_Data/loginUser.txt");
            string fileReservations = Server.MapPath("~/App_Data/roomReserv.txt");



            // قراءة username  من ملف تسجيل الدخول
            string username = "";
            if (File.Exists(fileLogin))
            {
                string[] userData = File.ReadAllLines(fileLogin);
                if (userData.Length > 0)
                {
                    string[] userDetails = userData[0].Split(',');
                    if (userDetails.Length > 1)
                    {
                        username = userDetails[1];
                    }
                }
            }



            int newReservationID = 1;
            if (File.Exists(fileReservations))
            {
                string[] reservations = File.ReadAllLines(fileReservations);
                if (reservations.Length > 0)
                {

                    string lastLine = reservations.Last();
                    string[] lastReservationData = lastLine.Split(',');

                    if (int.TryParse(lastReservationData[0], out int lastID))
                    {
                        newReservationID = lastID + 1;
                    }
                }
            }

            DateTime startTime = DateTime.Now;
            DateTime endTime = startTime.AddHours(2);
            string status = "Pending";


            string reservationData = $"{newReservationID},{username},{roomID},{startTime},{endTime},{status}";

            File.AppendAllText(fileReservations, reservationData + Environment.NewLine);

        }

        protected void meetingRoom_Click(object sender, EventArgs e)
            {
            string roomID = "3";
            string fileLogin = Server.MapPath("~/App_Data/loginUser.txt");
            string fileReservations = Server.MapPath("~/App_Data/roomReserv.txt");



            string username = "";
            if (File.Exists(fileLogin))
            {
                string[] userData = File.ReadAllLines(fileLogin);
                if (userData.Length > 0)
                {
                    string[] userDetails = userData[0].Split(',');
                    if (userDetails.Length > 1)
                    {
                        username = userDetails[1];
                    }
                }
            }



            int newReservationID = 1;
            if (File.Exists(fileReservations))
            {
                string[] reservations = File.ReadAllLines(fileReservations);
                if (reservations.Length > 0)
                {

                    string lastLine = reservations.Last();
                    string[] lastReservationData = lastLine.Split(',');

                    if (int.TryParse(lastReservationData[0], out int lastID))
                    {
                        newReservationID = lastID + 1;
                    }
                }
            }

            DateTime startTime = DateTime.Now;
            DateTime endTime = startTime.AddHours(2);
            string status = "Pending";


            string reservationData = $"{newReservationID},{username},{roomID},{startTime},{endTime},{status}";

            File.AppendAllText(fileReservations, reservationData + Environment.NewLine);


        }

        protected void studyingRoom_Click(object sender, EventArgs e)
            {
            string roomID = "4";
            string fileLogin = Server.MapPath("~/App_Data/loginUser.txt");
            string fileReservations = Server.MapPath("~/App_Data/roomReserv.txt");



            string username = "";
            if (File.Exists(fileLogin))
            {
                string[] userData = File.ReadAllLines(fileLogin);
                if (userData.Length > 0)
                {
                    string[] userDetails = userData[0].Split(',');
                    if (userDetails.Length > 1)
                    {
                        username = userDetails[1];
                    }
                }
            }



            int newReservationID = 1;
            if (File.Exists(fileReservations))
            {
                string[] reservations = File.ReadAllLines(fileReservations);
                if (reservations.Length > 0)
                {

                    string lastLine = reservations.Last();
                    string[] lastReservationData = lastLine.Split(',');

                    if (int.TryParse(lastReservationData[0], out int lastID))
                    {
                        newReservationID = lastID + 1;
                    }
                }
            }

            DateTime startTime = DateTime.Now;
            DateTime endTime = startTime.AddHours(2);
            string status = "Pending";


            string reservationData = $"{newReservationID},{username},{roomID},{startTime},{endTime},{status}";

            File.AppendAllText(fileReservations, reservationData + Environment.NewLine);


        }
    }
    }


