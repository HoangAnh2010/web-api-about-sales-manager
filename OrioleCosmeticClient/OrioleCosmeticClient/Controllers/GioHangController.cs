using OrioleCosmeticClient.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace OrioleCosmeticClient.Controllers
{
    public class GioHangController : Controller
    {
        // GET: GioHang
        SanPhamModel dbsp = new SanPhamModel();

        public ActionResult Index()
        {
            return View();
        }
        public JsonResult MuaHang(string id)
        {
            //khi gio hang chua co sp
            List<GioHang> gh = null;
            double tongtien = 0;
            int soluong = 0;
            SanPham s = null;

            using (var client = new HttpClient())
            {
                //HTTP GET
                var responseTask = client.GetAsync("https://localhost:44360/api/SanPhams/GetSanPham?id=" + id.ToString());
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<SanPham>();
                    readTask.Wait();

                    s = readTask.Result;
                }
                else //web api sent error response 
                {
                    //log response status here..

                    s = null;

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }
            if (Session["giohang"] == null) //chua co sp 
            {
                //them moi sp
                GioHang a = new GioHang();

                //dua tt sp vao gio hang
                a.ID = s.masp;
                a.Tensp = s.tensp;
                a.Anh = s.anh;
                a.SL = 1; //mac dinh
                a.Gia = s.dongia;
                gh = new List<GioHang>();
                gh.Add(a); //them sp a vao gio hang
                Session["giohang"] = gh;
            }

            //khi gio hang da co sp: sp da co -> tang so luong, sp chua co -> them vao
            else
            {
                //dua dl co san trong bien session vao gio hang
                gh = Session["giohang"] as List<GioHang>;
                //ktra sp co trung nhau khong
                var test = gh.Find(x => x.ID == id);
                if (test == null) //khong trung nhau --> them moi
                {
                    GioHang a = new GioHang();
                    //var s = dbsp.get1SP(id);
                    a.ID = s.masp;
                    a.Tensp = s.tensp;
                    a.Anh = s.anh;
                    a.SL = 1; //mac dinh
                    a.Gia = s.dongia;
                    gh.Add(a);
                }
                else
                {
                    //sp trung nhau --> tang so luong
                    test.SL = test.SL + 1;
                }
                //save bien session
                Session["giohang"] = gh;
            }
            //tinh tien va so luong cac sp co trong gio hang
            foreach (GioHang x in gh)
            {
                tongtien += (x.SL * x.Gia);
            }
            //soluong
            soluong = gh.Sum(x => x.SL);
            return Json(new { giohang = gh, tongtien = tongtien, soluong = soluong }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult loadGioHang()
        {
            List<GioHang> gh = null;
            double tongtien = 0;
            int soluong = 0;
            if (Session["giohang"] != null)
            {
                gh = Session["giohang"] as List<GioHang>;
            }
            if (gh != null)
            {
                foreach (GioHang x in gh)
                {
                    tongtien += x.SL * x.Gia;
                }
                soluong = gh.Sum(s => s.SL);
            }
            return Json(new { giohang = gh, tongtien = tongtien, soluong = soluong }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult tang1sp(string id)
        {
            List<GioHang> gh = Session["giohang"] as List<GioHang>;
            var sp = dbsp.get1SP(id);
            var test = gh.Find(s => s.ID == id);
            if (test.SL < sp.soluong)
            {
                test.SL = test.SL + 1;
            }
            Session["giohang"] = gh;
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult giam1sp(string id)
        {
            List<GioHang> gh = null;
            gh = Session["giohang"] as List<GioHang>;
            var test = gh.Find(s => s.ID == id);
            if (test.SL > 1)
            {
                test.SL = test.SL - 1;
            }
            else
            {
                gh.Remove(test); //neu sl=0 thi xoa sp khoi gio hang
            }
            Session["giohang"] = gh;
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult xoa1sp(string id)
        {
            List<GioHang> gh = Session["giohang"] as List<GioHang>;
            var test = gh.Find(s => s.ID == id);
            if (test != null)
            {
                gh.Remove(test);
            }
            Session["giohang"] = gh;
            return Json(new { success = true }, JsonRequestBehavior.AllowGet);
        }
        //action hien thi trang thanh toan
        public ViewResult ShoppingCart()
        {
            double tongtien = 0;
            int soluong = 0;
            List<GioHang> gh = null;
            if (Session["giohang"] != null)
            {
                gh = Session["giohang"] as List<GioHang>;
                foreach (GioHang a in gh)
                {
                    tongtien += a.SL * a.Gia;
                }
                soluong = gh.Sum(s => s.SL);
            }
            ViewBag.totalprice = tongtien;
            ViewBag.count = soluong;
            return View(gh);
        }

    }
}