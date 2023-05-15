using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Apifood.Database
{
    public class product
    {

        [Key]
        public int productid { get; set; }
        public string productname { get; set; }
        public int menuid { get; set; }
        public int price { get; set; }
        public string imghp { get; set; }
        public string img1 { get; set; }
        public string img2 { get; set; }
        public string img3 { get; set; }
        public string img4 { get; set; }
        public string productDescription { get; set; }
        public int inStock { get; set; }
        public int typeProduct { get; set; }
    }
}
