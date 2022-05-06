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
    public class HoaDonBansController : Controller
    {
        private WebAPIzEntities1 db = new WebAPIzEntities1();

        // GET: HoaDonBans
        public ActionResult Index()
        {
            return View(db.HoaDonBans.ToList());
        }

        // GET: HoaDonBans/Details/5
        public ActionResult Details(string id)
        {
            HoaDonBan hd = null;

            using (var client = new HttpClient())
            {
                //HTTP GET
                var responseTask = client.GetAsync("https://localhost:44360/api/HoaDonBans/" + id);
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<HoaDonBan>();
                    readTask.Wait();

                    hd = readTask.Result;
                }
                else
                {
                    hd = null;

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }
            return View(hd);
        }

        // GET: HoaDonBans/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: HoaDonBans/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "mahd,ngaydat,hoten,sdt,diachinhanhang,tongtientt")] HoaDonBan hoaDonBan)
        {
            if (ModelState.IsValid)
            {
                db.HoaDonBans.Add(hoaDonBan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(hoaDonBan);
        }

        // GET: HoaDonBans/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDonBan hoaDonBan = db.HoaDonBans.Find(id);
            if (hoaDonBan == null)
            {
                return HttpNotFound();
            }
            return View(hoaDonBan);
        }

        // POST: HoaDonBans/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "mahd,ngaydat,hoten,sdt,diachinhanhang,tongtientt")] HoaDonBan hoaDonBan)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoaDonBan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(hoaDonBan);
        }

        // GET: HoaDonBans/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDonBan hoaDonBan = db.HoaDonBans.Find(id);
            if (hoaDonBan == null)
            {
                return HttpNotFound();
            }
            return View(hoaDonBan);
        }

        // POST: HoaDonBans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            HoaDonBan hoaDonBan = db.HoaDonBans.Find(id);
            db.HoaDonBans.Remove(hoaDonBan);
            db.SaveChanges();
            return RedirectToAction("Index");
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
