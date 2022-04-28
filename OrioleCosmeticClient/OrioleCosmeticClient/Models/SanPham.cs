namespace OrioleCosmeticClient.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietHDBans = new HashSet<ChiTietHDBan>();
        }

        [Key]
        [StringLength(10)]
        public string masp { get; set; }

        [Required]
        public string tensp { get; set; }

        [Required]
        public string mota { get; set; }

        public int soluong { get; set; }

        public double dongia { get; set; }

        [StringLength(50)]
        public string anh { get; set; }

        [Required]
        [StringLength(10)]
        public string maloai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHDBan> ChiTietHDBans { get; set; }

        public virtual LoaiSP LoaiSP { get; set; }
    }
}
