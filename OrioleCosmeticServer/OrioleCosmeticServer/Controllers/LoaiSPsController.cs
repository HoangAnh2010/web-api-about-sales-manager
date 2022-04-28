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
    public class LoaiSPsController : ApiController
    {
        private WebAPIzEntities1 db = new WebAPIzEntities1();

        // GET: api/LoaiSPs
        public IQueryable<LoaiSP> GetLoaiSPs()
        {
            return db.LoaiSPs;
        }

        // GET: api/LoaiSPs/5
        [ResponseType(typeof(LoaiSP))]
        public IHttpActionResult GetLoaiSP(string id)
        {
            LoaiSP loaiSP = db.LoaiSPs.Find(id);
            if (loaiSP == null)
            {
                return NotFound();
            }

            return Ok(loaiSP);
        }

        // PUT: api/LoaiSPs/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutLoaiSP(string id, LoaiSP loaiSP)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != loaiSP.maloai)
            {
                return BadRequest();
            }

            db.Entry(loaiSP).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LoaiSPExists(id))
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

        // POST: api/LoaiSPs
        [ResponseType(typeof(LoaiSP))]
        public IHttpActionResult PostLoaiSP(LoaiSP loaiSP)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.LoaiSPs.Add(loaiSP);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (LoaiSPExists(loaiSP.maloai))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = loaiSP.maloai }, loaiSP);
        }

        // DELETE: api/LoaiSPs/5
        [ResponseType(typeof(LoaiSP))]
        public IHttpActionResult DeleteLoaiSP(string id)
        {
            LoaiSP loaiSP = db.LoaiSPs.Find(id);
            if (loaiSP == null)
            {
                return NotFound();
            }

            db.LoaiSPs.Remove(loaiSP);
            db.SaveChanges();

            return Ok(loaiSP);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LoaiSPExists(string id)
        {
            return db.LoaiSPs.Count(e => e.maloai == id) > 0;
        }
    }
}