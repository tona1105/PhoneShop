using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Apifood.Models
{
    public class BillDetailModel
    {

        public string productname { get; set; }
        public int price { get; set; }
        public int Quantity { get; set; }
        public int BillId { get; set; }
        public int Allprice { get; set; }

    }
}
