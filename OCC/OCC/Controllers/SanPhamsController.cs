using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using OCC.Models;

namespace OCC.Controllers
{
    public class SanPhamsController : Controller
    {
        private WebAPIzEntities1 db = new WebAPIzEntities1();

        // GET: SanPhams
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
                else 
                {                    

                    listsp = Enumerable.Empty<SanPham>();

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }

            return View(listsp);
        }

        // GET: SanPhams/Details/5
        public ActionResult Details(string id)
        {
            SanPham s = null;

            using (var client = new HttpClient())
            {
                //HTTP GET
                var responseTask = client.GetAsync("https://localhost:44360/api/SanPhams/GetSanPham?id=" + id);
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<SanPham>();
                    readTask.Wait();

                    s = readTask.Result;
                }
                else 
                {
                    s = null;

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }
            return View(s);
        }

        // GET: SanPhams/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "masp,tensp,mota,soluong,dongia,anh,maloai")] SanPham sanPham)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44360/");

                //HTTP POST
                var postTask = client.PostAsJsonAsync<SanPham>("api/SanPhams/PostSanPham", sanPham);
                postTask.Wait();

                var result = postTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
            }

            return View(sanPham);
        }

        // GET: SanPhams/Edit/5
        public ActionResult Edit(string id)
        {
            SanPham s = null;   

            using (var client = new HttpClient())
            {
                //HTTP GET
                var responseTask = client.GetAsync("https://localhost:44360/api/SanPhams/GetSanPham?id=" + id);
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

        // POST: SanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "masp,tensp,mota,soluong,dongia,anh,maloai")] SanPham sanPham)
        {
            using (var client = new HttpClient())
            {

                //HTTP PUT
                var putTask = client.PutAsJsonAsync<SanPham>("https://localhost:44360/api/SanPhams/PutSanPham?id=" + sanPham.masp,sanPham);
                putTask.Wait();

                var result = putTask.Result;
                if (result.IsSuccessStatusCode)
                {

                    return RedirectToAction("Index");
                }
            }
            return View(sanPham);
        }

        // GET: SanPhams/Delete/5
        public ActionResult Delete(string id)
        {
            using (var client = new HttpClient())
            {

                //HTTP DELETE
                var deleteTask = client.DeleteAsync("https://localhost:44360/api/SanPhams/DeleteSanPham?id=" + id); 


                deleteTask.Wait();

                var result = deleteTask.Result;
                if (result.IsSuccessStatusCode)
                {

                    return RedirectToAction("Index");
                }

            }

            return RedirectToAction("Index");
        }

        // POST: SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            db.SanPhams.Remove(sanPham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult TimKiem(string tensp)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44360/");
                var getTask = client.GetAsync("api/SanPhams/GetSanPhamTheoTen?tensp=" + tensp);
                getTask.Wait();
                var result = getTask.Result;
                var data = result.Content.ReadAsAsync<SanPham>();
                return View(data);
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
