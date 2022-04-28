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
    public class NhaCungCapsController : ApiController
    {
        private WebAPIzEntities1 db = new WebAPIzEntities1();

        // GET: api/NhaCungCaps
        public IQueryable<NhaCungCap> GetNhaCungCaps()
        {
            return db.NhaCungCaps;
        }

        // GET: api/NhaCungCaps/5
        [ResponseType(typeof(NhaCungCap))]
        public IHttpActionResult GetNhaCungCap(string id)
        {
            NhaCungCap nhaCungCap = db.NhaCungCaps.Find(id);
            if (nhaCungCap == null)
            {
                return NotFound();
            }

            return Ok(nhaCungCap);
        }

        // PUT: api/NhaCungCaps/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutNhaCungCap(string id, NhaCungCap nhaCungCap)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != nhaCungCap.mancc)
            {
                return BadRequest();
            }

            db.Entry(nhaCungCap).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NhaCungCapExists(id))
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

        // POST: api/NhaCungCaps
        [ResponseType(typeof(NhaCungCap))]
        public IHttpActionResult PostNhaCungCap(NhaCungCap nhaCungCap)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.NhaCungCaps.Add(nhaCungCap);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (NhaCungCapExists(nhaCungCap.mancc))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = nhaCungCap.mancc }, nhaCungCap);
        }

        // DELETE: api/NhaCungCaps/5
        [ResponseType(typeof(NhaCungCap))]
        public IHttpActionResult DeleteNhaCungCap(string id)
        {
            NhaCungCap nhaCungCap = db.NhaCungCaps.Find(id);
            if (nhaCungCap == null)
            {
                return NotFound();
            }

            db.NhaCungCaps.Remove(nhaCungCap);
            db.SaveChanges();

            return Ok(nhaCungCap);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool NhaCungCapExists(string id)
        {
            return db.NhaCungCaps.Count(e => e.mancc == id) > 0;
        }
    }
}