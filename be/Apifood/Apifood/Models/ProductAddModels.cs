using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Apifood.Models
{
    public class ProductAddModels
    {
        [Required(ErrorMessage = "Vui lòng nhập tên Món ăn")]
        public string productname { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập tên Danh mục")]
        public int menuid { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập giá")]
        public int price { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập hình ảnh")]
        public string imghp { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập hình ảnh 1")]
        public string img1 { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập hình ảnh 2")]
        public string img2 { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập hình ảnh 3")]
        public string img3 { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập hình ảnh 4")]
        public string img4 { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập Mô tả")]
        public string productDescription { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập tình trạng")]
        public int inStock { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập loại")]
        public int typeProduct { get; set; }

    }
}
