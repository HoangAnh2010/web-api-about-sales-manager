namespace OrioleCosmeticClient.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietHDBan")]
    public partial class ChiTietHDBan
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string mahd { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string masp { get; set; }

        public int soluong { get; set; }

        public double thanhtien { get; set; }

        public virtual HoaDonBan HoaDonBan { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
