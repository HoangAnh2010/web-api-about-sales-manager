using OCC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace OCC.Content
{
    public class ThongKeController : Controller
    {
        
        // GET: ThongKe
        public ActionResult BanChay()
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44360/");
                var getTask = client.GetAsync("api/SanPhams/GetSanPhamBanChay");
                getTask.Wait();
                var result = getTask.Result;
                var data = result.Content.ReadAsAsync<IList<BanChayModel>>().Result;
                return View(data);
            }
            
        }

        public ActionResult TonKho()
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44360/");
                var getTask = client.GetAsync("api/SanPhams/GetSanPhamTonKho");
                getTask.Wait();
                var result = getTask.Result;
                var data = result.Content.ReadAsAsync<IList<TonKhoModel>>().Result;
                return View(data);
            }
        }

        public ActionResult DoanhThu()
        {
            return View();
        }
    }
}