﻿using Quan_Li_Nha_Hang.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Quan_Li_Nha_Hang.DAO
{
    public class BillDAO
    {
        private static BillDAO instance;

        public static BillDAO Instance
        {
            get
            {
                if (instance == null) instance = new BillDAO();
                return instance;

            }
            private set
            {
                instance = value;
            }
        }
        private BillDAO() { }

        public int GetUncheckBillIByTableID(int id)
        {
            DataTable data = DataProvider.Instance1.ExecuteQuery("select * from Hoa_Don where ID_Ban = " + id + "and Trang_Thai_Thanh_Toan = 0");
            if(data.Rows.Count > 0)
            {
                Bill bill = new Bill(data.Rows[0]);
                return bill.Id;
            }
            return -1;
        }
    }
}
