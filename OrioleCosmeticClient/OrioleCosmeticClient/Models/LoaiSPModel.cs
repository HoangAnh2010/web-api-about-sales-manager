using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OrioleCosmeticClient.Models
{
    public class LoaiSPModel
    {
        DataContext dc = new DataContext();
        public List<LoaiSP> getAllLSP()
        {
            DataTable dt = dc.readData("select * from LoaiSP");
            List<LoaiSP> li = new List<LoaiSP>();
            foreach (DataRow dr in dt.Rows)
            {
                LoaiSP lsp = new LoaiSP();
                lsp.maloai = dr[0].ToString();
                lsp.tenloai = dr[1].ToString();
                li.Add(lsp);
            }
            return li;
        }

    }
}