namespace OrioleCosmeticClient.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDonBan")]
    public partial class HoaDonBan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HoaDonBan()
        {
            ChiTietHDBans = new HashSet<ChiTietHDBan>();
        }

        [Key]
        [StringLength(10)]
        public string mahd { get; set; }

        public DateTime ngaydat { get; set; }

        [Required]
        [StringLength(100)]
        public string hoten { get; set; }

        [Required]
        [StringLength(10)]
        public string sdt { get; set; }

        [Required]
        public string diachinhanhang { get; set; }

        public double tongtientt { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHDBan> ChiTietHDBans { get; set; }
    }
}
