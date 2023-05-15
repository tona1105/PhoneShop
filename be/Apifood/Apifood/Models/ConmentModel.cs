using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Apifood.Models
{
    public class ConmentModel
    {
        public int productid { get; set; }
        public string productname { get; set; }
        public string customername { get; set; }
        public string commentDescriptions { get; set; }
    }
}
