using OrioleCosmeticClient.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace OrioleCosmeticClient.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: SanPham
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ChiTietSP(string id)
        {
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
            return View(s);
        }
        public ActionResult SPtheoLoai(string id)
        {
            List<SanPham> s = null;

            using (var client = new HttpClient())
            {
                //HTTP GET
                var responseTask = client.GetAsync("https://localhost:44360/api/SanPhams/GetSanPhamTheoMaLoai?id=" + id.ToString());
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<List<SanPham>>();
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
            return View(s);
        }

    }
}