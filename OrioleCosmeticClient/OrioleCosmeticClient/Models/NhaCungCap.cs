namespace OrioleCosmeticClient.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NhaCungCap")]
    public partial class NhaCungCap
    {
        [Key]
        [StringLength(10)]
        public string mancc { get; set; }

        [Required]
        [StringLength(50)]
        public string tenncc { get; set; }

        [StringLength(10)]
        public string sdt { get; set; }

        public string diachi { get; set; }
    }
}
