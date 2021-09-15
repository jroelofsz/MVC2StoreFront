using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StoreFrontApplication.DATA.EF;

namespace StoreFrontApplication.UI.MVC.Models
{
    public class CartItemViewModel
    {
        public Product Product { get; set; }
        public int Qty { get; set; }


        //FQCTOR
        public CartItemViewModel(Product product, int qty)
        {
            Product = product;
            Qty = qty;
        }
    }
}