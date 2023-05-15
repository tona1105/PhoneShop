using System.ComponentModel.DataAnnotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Apifood.Database
{
    public class Cart
    {

        [Key]
        public int Cartid { get; set; }
        public int productid { get; set; }
        public string productname { get; set; }
        public int price { get; set; }
        public string imghp { get; set; }
        public int customerid { get; set; }
        public int cartquantity { get; set; }
        public int Allprice { get; set; }
    }
}
