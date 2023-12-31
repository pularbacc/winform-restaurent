﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quan_Li_Nha_Hang.DAO
{
    public class DataProvider
    {
        private static DataProvider instance;
        public static DataProvider Instance {
            get { if (instance == null) instance = new DataProvider(); return instance; }
            set { instance = value; }
        }

        private DataProvider() { }

        private string connectionSTR = "Data Source=DESKTOP-MCRHKK6\\SQLEXPRESS;Initial Catalog=Quan_Li_Nha_Hang;Integrated Security=True";

        public DataTable ExecuteQuery(string query, object[] parameter = null)
        {
            DataTable table = new DataTable();
            using (SqlConnection connect = new SqlConnection(connectionSTR))
            {
                connect.Open();
                SqlCommand command = new SqlCommand(query, connect);
                SqlDataAdapter adapter = new SqlDataAdapter(command);

                if (parameter != null)
                {
                    int i = 0;
                    string[] list = query.Split(' ');
                    foreach (string item in list)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }
                connect.Close();
                adapter.Fill(table);
            }
            return table;
        }
        public int ExecuteNonQuery(string query, object[] parameter = null)
        {
            int data = 0;

            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();

                connection.Close();
            }

            return data;
        }

        public object ExecuteScalar(string query, object[] parameter = null)
        {
            object data = 0;

            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();

                connection.Close();
            }

            return data;
        }
    }
}
