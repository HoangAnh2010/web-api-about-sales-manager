using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using OrioleCosmeticServer.Models;

namespace OrioleCosmeticServer.Controllers
{
    public class HoaDonBansController : ApiController
    {
        private WebAPIzEntities1 db = new WebAPIzEntities1();

        // GET: api/HoaDonBans
        public IQueryable<HoaDonBan> GetHoaDonBans()
        {
            return db.HoaDonBans;
        }

        // GET: api/HoaDonBans/c
        [ResponseType(typeof(HoaDonBan))]
        public IHttpActionResult GetHoaDonBan(string id)
        {
            HoaDonBan hoaDonBan = db.HoaDonBans.Find(id);
            if (hoaDonBan == null)
            {
                return NotFound();
            }

            return Ok(hoaDonBan);
        }

        // PUT: api/HoaDonBans/5
        [ResponseType(typeof(void))]
        [Route("api/HoaDonBans/PutHoaDonBan")]
        public IHttpActionResult PutHoaDonBan(string id, HoaDonBan hoaDonBan)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hoaDonBan.mahd)
            {
                return BadRequest();
            }

            db.Entry(hoaDonBan).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HoaDonBanExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/HoaDonBans
        [ResponseType(typeof(HoaDonBan))]
        [Route("api/HoaDonBans/PostHoaDonBan")]
        public IHttpActionResult PostHoaDonBan(HoaDonBan hoaDonBan)
        {
            try
            {
                HoaDonBan hd = new HoaDonBan();
                hd.mahd = Guid.NewGuid().ToString();
                hd.hoten = hoaDonBan.hoten;
                hd.sdt = hoaDonBan.sdt;
                hd.ngaydat = DateTime.Now;
                hd.diachinhanhang = hoaDonBan.diachinhanhang;
                hd.tongtientt = hoaDonBan.tongtientt;

                foreach (ChiTietHDBan b in hoaDonBan.chiTietHDBans)
                {
                    ChiTietHDBan ct = new ChiTietHDBan();
                    ct.mahd = hd.mahd;
                    ct.masp = b.masp;
                    ct.soluong = b.soluong;
                    ct.thanhtien = b.thanhtien;
                    SanPham sanPham = db.SanPhams.FirstOrDefault(x => x.masp == b.masp);
                    sanPham.soluong -= b.soluong;
                    db.ChiTietHDBans.Add(ct);
                    
                }

                db.HoaDonBans.Add(hd);
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (HoaDonBanExists(hoaDonBan.mahd))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return Ok(hoaDonBan);
        }

        // DELETE: api/HoaDonBans/5
        [ResponseType(typeof(HoaDonBan))]
        public IHttpActionResult DeleteHoaDonBan(string id)
        {
            HoaDonBan hoaDonBan = db.HoaDonBans.Find(id);
            if (hoaDonBan == null)
            {
                return NotFound();
            }

            db.HoaDonBans.Remove(hoaDonBan);
            db.SaveChanges();

            return Ok(hoaDonBan);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HoaDonBanExists(string id)
        {
            return db.HoaDonBans.Count(e => e.mahd == id) > 0;
        }
    }
}