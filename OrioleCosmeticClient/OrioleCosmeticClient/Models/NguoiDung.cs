namespace OrioleCosmeticClient.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NguoiDung")]
    public partial class NguoiDung
    {
        [Key]
        [StringLength(10)]
        public string manguoidung { get; set; }

        [Required]
        [StringLength(100)]
        public string hoten { get; set; }

        [Required]
        [StringLength(50)]
        public string email { get; set; }

        [Required]
        [StringLength(10)]
        public string matkhau { get; set; }

        [Required]
        [StringLength(10)]
        public string sdt { get; set; }

        [Required]
        public string diachi { get; set; }

        public int maquyen { get; set; }

        public virtual PhanQuyen PhanQuyen { get; set; }
    }
}
