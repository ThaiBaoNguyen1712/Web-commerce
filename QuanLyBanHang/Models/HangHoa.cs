//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyBanHang.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class HangHoa
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HangHoa()
        {
            this.ChiTietHoaDon = new HashSet<ChiTietHoaDon>();
        }
    
        public int ID { get; set; }
        public string TenHang { get; set; }
        public Nullable<int> NhomHang { get; set; }
        public Nullable<int> ThuongHieu { get; set; }
        public Nullable<decimal> GiaVon { get; set; }
        public Nullable<decimal> GiaBan { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public string ViTri { get; set; }
        public string HinhAnh { get; set; }
        public Nullable<System.DateTime> Created { get; set; }
        public string GhiChu { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDon { get; set; }
        public virtual NhomHangHoa NhomHangHoa { get; set; }
        public virtual ThuongHieu ThuongHieu1 { get; set; }
    }
}
