//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StoreFrontApplication.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public Nullable<decimal> Price { get; set; }
        public int CategoryID { get; set; }
        public Nullable<int> AmtInStock { get; set; }
        public Nullable<int> AmtOnOrder { get; set; }
        public int SupplierID { get; set; }
        public int InStockID { get; set; }
        public string ProductImage { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual StockStatus StockStatu { get; set; }
        public virtual Supplier Supplier { get; set; }
    }
}
