using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OrioleCosmeticClient.Models
{
    public class SanPhamModel
    {
        DataContext dc = new DataContext();
        public List<SanPham> getAllSP()
        {
            DataTable dt = dc.readData("select * from SanPham");
            List<SanPham> li = new List<SanPham>();
            foreach (DataRow dr in dt.Rows)
            {
                SanPham sp = new SanPham();
                sp.masp = dr[0].ToString();
                sp.tensp = dr[1].ToString();
                sp.mota = dr[2].ToString();
                sp.soluong = int.Parse(dr[3].ToString());
                sp.dongia = double.Parse(dr[4].ToString());
                sp.anh = dr[5].ToString();
                sp.maloai = dr[6].ToString();
                li.Add(sp);
            }
            return li;

        }
        public SanPham get1SP(string id)
        {
            DataTable dt = dc.readData("select * from SanPham where MaSP='" + id + "'");
            SanPham sp = new SanPham();
            sp.masp = dt.Rows[0][0].ToString();
            sp.tensp = dt.Rows[0][1].ToString();
            sp.mota = dt.Rows[0][2].ToString();
            sp.soluong = int.Parse(dt.Rows[0][3].ToString());
            sp.dongia = double.Parse(dt.Rows[0][4].ToString());
            sp.anh = dt.Rows[0][5].ToString();
            sp.maloai = dt.Rows[0][6].ToString();
            return sp;
        }
        public List<SanPham> getSPByLSP(string id)
        {
            DataTable dt = dc.readData("select * from SanPham where maloai='" + id + "'");
            List<SanPham> li = new List<SanPham>();
            foreach (DataRow dr in dt.Rows)
            {
                SanPham sp = new SanPham();
                sp.masp = dr[0].ToString();
                sp.tensp = dr[1].ToString();
                sp.mota = dr[2].ToString();
                sp.soluong = int.Parse(dr[3].ToString());
                sp.dongia = double.Parse(dr[4].ToString());
                sp.anh = dr[5].ToString();
                sp.maloai = dr[6].ToString();
                li.Add(sp);
            }
            return li;
        }

    }
}