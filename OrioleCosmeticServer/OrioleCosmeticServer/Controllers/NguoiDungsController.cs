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
    public class NguoiDungsController : ApiController
    {
        private WebAPIzEntities1 db = new WebAPIzEntities1();

        // GET: api/NguoiDungs
        public IQueryable<NguoiDung> GetNguoiDungs()
        {
            return db.NguoiDungs;
        }

        // GET: api/NguoiDungs/5
        //Lấy về thông tin của người dùng theo mã
        [ResponseType(typeof(NguoiDung))]
        [Route("api/NguoiDungs/GetNguoiDung/{id}")]
        public IHttpActionResult GetNguoiDung(string id)
        {
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return NotFound();
            }

            return Ok(nguoiDung);
        }

        // PUT: api/NguoiDungs/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutNguoiDung(string id, NguoiDung nguoiDung)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != nguoiDung.manguoidung)
            {
                return BadRequest();
            }

            db.Entry(nguoiDung).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NguoiDungExists(id))
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

        // POST: api/NguoiDungs
        [ResponseType(typeof(NguoiDung))]
        public IHttpActionResult PostNguoiDung(NguoiDung nguoiDung)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.NguoiDungs.Add(nguoiDung);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (NguoiDungExists(nguoiDung.manguoidung))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = nguoiDung.manguoidung }, nguoiDung);
        }

        // DELETE: api/NguoiDungs/5
        [ResponseType(typeof(NguoiDung))]
        public IHttpActionResult DeleteNguoiDung(string id)
        {
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return NotFound();
            }

            db.NguoiDungs.Remove(nguoiDung);
            db.SaveChanges();

            return Ok(nguoiDung);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool NguoiDungExists(string id)
        {
            return db.NguoiDungs.Count(e => e.manguoidung == id) > 0;
        }
    }
}