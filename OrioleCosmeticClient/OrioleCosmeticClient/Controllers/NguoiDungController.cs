using Newtonsoft.Json;
using OrioleCosmeticClient.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace OrioleCosmeticClient.Controllers
{
    public class NguoiDungController : Controller
    {
        // GET: NguoiDung
        public ActionResult Index()
        {
            return View();
        }
        // ĐĂNG KÝ PHƯƠNG THỨC POST
        [HttpPost]
        public ActionResult Dangky(NguoiDung nguoidung)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44360/");

                //HTTP POST
                var postTask = client.PostAsJsonAsync<NguoiDung>("api/NguoiDungs", nguoidung);
                postTask.Wait();

                var result = postTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    return RedirectToAction("Dangnhap");
                }
            }

            ModelState.AddModelError(string.Empty, "Server Error. Please contact administrator.");
            return View("Dangky");
        }

        public ActionResult Dangnhap()
        {
            return View();
        }

        public bool Login(string account, string password)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44360/");
                var nd = new NguoiDung()
                {
                    email = account,
                    matkhau = password
                };
                var json = JsonConvert.SerializeObject(nd);
                var data = new StringContent(json, Encoding.UTF8, "application/json");
                //HTTP POST
                var postTask = client.PostAsync($"api/NguoiDungs/login", data);
                postTask.Wait();

                var result = postTask.Result;
                var user_id = result.Content.ReadAsStringAsync().Result;
                Session["user_id"] = user_id;
                return true;
            }
        }

        public bool Authorize()
        {
            if (Session["user_id"] == null)
                return false;
            return true;
        }
        public ActionResult DangXuat()
        {
            Session["use"] = null;
            return RedirectToAction("Index", "Home");

        }

    }
}