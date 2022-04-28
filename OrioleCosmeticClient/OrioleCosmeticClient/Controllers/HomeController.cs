using OrioleCosmeticClient.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace OrioleCosmeticClient.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            IEnumerable<SanPham> listsp = null;

            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44360/");
                //HTTP GET
                var responseTask = client.GetAsync("api/SanPhams");
                
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<IList<SanPham>>();
                    readTask.Wait();

                    listsp = readTask.Result;
                }
                else //web api sent error response 
                {
                    //log response status here..

                    listsp = Enumerable.Empty<SanPham>();

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }
            return View(listsp);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}