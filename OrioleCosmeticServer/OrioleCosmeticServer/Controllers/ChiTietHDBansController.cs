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
    public class ChiTietHDBansController : ApiController
    {
        private WebAPIzEntities1 db = new WebAPIzEntities1();

        // GET: api/ChiTietHDBans
        public IQueryable<ChiTietHDBan> GetChiTietHDBans()
        {
            return db.ChiTietHDBans;
        }

        // GET: api/ChiTietHDBans/5
        [ResponseType(typeof(ChiTietHDBan))]
        public IHttpActionResult GetChiTietHDBan(string id)
        {
            ChiTietHDBan chiTietHDBan = db.ChiTietHDBans.Find(id);
            if (chiTietHDBan == null)
            {
                return NotFound();
            }

            return Ok(chiTietHDBan);
        }

        // PUT: api/ChiTietHDBans/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutChiTietHDBan(string id, ChiTietHDBan chiTietHDBan)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != chiTietHDBan.mahd)
            {
                return BadRequest();
            }

            db.Entry(chiTietHDBan).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ChiTietHDBanExists(id))
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

        // POST: api/ChiTietHDBans
        [ResponseType(typeof(ChiTietHDBan))]
        public IHttpActionResult PostChiTietHDBan(ChiTietHDBan chiTietHDBan)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ChiTietHDBans.Add(chiTietHDBan);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ChiTietHDBanExists(chiTietHDBan.mahd))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = chiTietHDBan.mahd }, chiTietHDBan);
        }

        // DELETE: api/ChiTietHDBans/5
        [ResponseType(typeof(ChiTietHDBan))]
        public IHttpActionResult DeleteChiTietHDBan(string id)
        {
            ChiTietHDBan chiTietHDBan = db.ChiTietHDBans.Find(id);
            if (chiTietHDBan == null)
            {
                return NotFound();
            }

            db.ChiTietHDBans.Remove(chiTietHDBan);
            db.SaveChanges();

            return Ok(chiTietHDBan);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ChiTietHDBanExists(string id)
        {
            return db.ChiTietHDBans.Count(e => e.mahd == id) > 0;
        }
    }
}