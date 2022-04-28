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
    public class SanPhamsController : ApiController
    {
        private WebAPIzEntities1 db = new WebAPIzEntities1();

        // GET: api/SanPhams
        public IQueryable<SanPham> GetSanPhams()
        {
            return db.SanPhams;
        }

        // GET: api/SanPhams/5
        //Lấy về thông tin của sp theo mã
        [ResponseType(typeof(SanPham))]
        [Route("api/SanPhams/GetSanPham")]
        public IHttpActionResult GetSanPham(string id)
        {
            var query = from x in db.SanPhams
                        where x.masp == id
                        select new
                        {
                            masp = x.masp,
                            tensp = x.tensp,
                            mota = x.mota,
                            soluong = x.soluong,
                            dongia=x.dongia,
                            anh = x.anh,
                            maloai = x.maloai,
                        };
            var sp = query.FirstOrDefault();
            if (sp == null)
            {
                return NotFound();
            }

            return Ok(sp);
        }


        //Lấy về các sp có cùng mã loại
        [Route("api/SanPhams/GetSanPhamTheoMaLoai")]
        public IHttpActionResult GetSanPhamTheoMaLoai(string id)
        {
            var query = from x in db.SanPhams
                        where x.maloai == id
                        select new
                        {
                            masp = x.masp,
                            tensp = x.tensp,
                            mota = x.mota,
                            soluong = x.soluong,
                            dongia = x.dongia,
                            anh = x.anh,
                            maloai = x.maloai,
                        };

            return Ok(query.ToList());
        }

        //Tìm kiếm sp trong khoảng giá
        [Route("api/SanPhams/GetSanPhamTheoKhoangGia")]
        public IHttpActionResult GetSanPhamTheoKhoangGia(float giamin, float giamax)
        {
            return Ok(db.F_GetSPTheoKhoangGia(giamin, giamax));
        }

        //Tìm kiếm sp gần đúng theo tên
        [Route("api/SanPhams/GetSanPhamTheoTen")]
        public IHttpActionResult GetSanPhamTheoTen(string tensp) 
        {
            return Ok(db.F_GetSPTheoTen(tensp));
        }

        //Thống kê sp bán chạy
        [Route("api/SanPhams/GetSanPhamBanChay")]
        public IHttpActionResult GetSanPhamBanChay()
        {
            return Ok(db.F_GetSPBanChay());
        }

        //Thống kê sản phẩm tồn kho
        [Route("api/SanPhams/GetSanPhamTonKho")]
        public IHttpActionResult GetSanPhamTonKho()
        {
            return Ok(db.F_GetSPTonKho());
        }

        //Thống kê doanh thu theo thời gian tùy ý
        [Route("api/SanPhams/GetDoanhThu")]
        public IHttpActionResult GetDoanhThu(DateTime timestart, DateTime timeend)
        {
            return Ok(db.F_GetDoanhThu(timestart, timeend));
        }


        // PUT: api/SanPhams/5
        [ResponseType(typeof(void))]
        [Route("api/SanPhams/PutSanPham")]
        public IHttpActionResult PutSanPham(string id, SanPham sanPham)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != sanPham.masp)
            {
                return BadRequest();
            }

            db.Entry(sanPham).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SanPhamExists(id))
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

        // POST: api/SanPhams
        [ResponseType(typeof(SanPham))]
        [Route("api/SanPhams/PostSanPham")]
        public IHttpActionResult PostSanPham(SanPham sanPham)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.SanPhams.Add(sanPham);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SanPhamExists(sanPham.masp))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = sanPham.masp }, sanPham);
        }

        // DELETE: api/SanPhams/5
        [ResponseType(typeof(SanPham))]
        [Route("api/SanPhams/DeleteSanPham")]
        public IHttpActionResult DeleteSanPham(string id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return NotFound();
            }

            db.SanPhams.Remove(sanPham);
            db.SaveChanges();

            return Ok(sanPham);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SanPhamExists(string id)
        {
            return db.SanPhams.Count(e => e.masp == id) > 0;
        }
    }
}