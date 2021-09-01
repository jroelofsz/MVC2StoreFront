using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFrontApplication.DATA.EF//.Metadata
{
    #region Category
    public class CategoryMetadata
    {
        public int CategoryID { get; set; }

        [Required(ErrorMessage ="* Type is required")]
        [StringLength(15, ErrorMessage ="* Type cannot exceed 15 characters")]
        public string Type { get; set; }
    }

    [MetadataType(typeof(CategoryMetadata))]
    public partial class Category
    {
        //this is typically empty, unless you need to create custom properties
    }

    #endregion

    #region Department
    public class DepartmentMetadata
    {
        public int DeptID { get; set; }

        [Required(ErrorMessage ="* Departmant Name is required")]
        [StringLength(20, ErrorMessage ="* Dept. Name cannot exceed 20 characters")]
        [Display(Name ="Departmant Name")]
        public string DeptName { get; set; }
    }

    [MetadataType(typeof(DepartmentMetadata))]
    public partial class Department
    {
        //this is typically empty, unless you need to create custom properties
    }

    #endregion

    #region Employee
    public class EmployeeMetadata
    {
        public int EmpID { get; set; }

        [Required(ErrorMessage = "* First Name is required")]
        [Display(Name ="First Name")]
        [StringLength(25, ErrorMessage ="* First Name cannot exceed 25 characters")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "* Last Name is required")]
        [Display(Name = "Last Name")]
        [StringLength(25, ErrorMessage = "* Last Name cannot exceed 25 characters")]
        public string LastName { get; set; }

        [StringLength(20, ErrorMessage ="* Job Title cannot exceed 20 characters")]
        [Display(Name ="Job Title")]
        public string JobTitle { get; set; }

        [Display(Name = "Date of Birth")]
        public int DeptID { get; set; }
        public Nullable<System.DateTime> DateOfBirth { get; set; }

        [StringLength(5, ErrorMessage = "* Title of Courtesy cannot exceed 5 characters")]
        [Display(Name ="Title of Courtesy")]
        public string TitleOfCourtesy { get; set; }

        [Required(ErrorMessage = "* Hire Date is required")]
        [Display(Name = "Hire Date")]
        public System.DateTime HireDate { get; set; }

        [Required(ErrorMessage = "* Address is required")]
        [StringLength(50, ErrorMessage = "* Address cannot exceed 50 characters")]
        public string Address { get; set; }

        [Required(ErrorMessage = "* City is required")]
        [StringLength(20, ErrorMessage = "* City cannot exceed 20 characters")]
        public string City { get; set; }

        [Required(ErrorMessage = "* State is required (if none put NA)")]
        [StringLength(2, ErrorMessage = "* State cannot exceed 2 characters")]
        public string State { get; set; }

        [Required(ErrorMessage = "* Country is required")]
        [StringLength(20, ErrorMessage = "* Country cannot exceed 20 characters")]
        public string Country { get; set; }

        [Required(ErrorMessage = "* Zip is required")]
        [StringLength(5, ErrorMessage = "* Zip cannot exceed 5 characters")]
        public string Zip { get; set; }

        [StringLength(15, ErrorMessage = "* Phone number cannot exceed 15 characters")]
        public string Phone { get; set; }
        public Nullable<int> DirectReportID { get; set; }
    }

    [MetadataType(typeof(EmployeeMetadata))]
    public partial class Employee
    {
        //this is typically empty, unless you need to create custom properties
    }

    #endregion

    #region Product
    public class ProductMetadata
    {
        public int ProductID { get; set; }

        [StringLength(50, ErrorMessage ="* Product Name cannot exceed 50 characters")]
        [Display(Name ="Product Name")]
        public string ProductName { get; set; }

        [StringLength(1000, ErrorMessage = "* Description cannot exceed 1000 characters")]
        [UIHint("MultilineText")]
        public string Description { get; set; }

        [DisplayFormat(DataFormatString = "{0:c}")]
        public Nullable<decimal> Price { get; set; }

        [Required(ErrorMessage = "* Category is required")]
        [Display(Name = "Category")]
        public int CategoryID { get; set; }

        [DisplayFormat(DataFormatString = "{0:n0}", ApplyFormatInEditMode = true)]
        [Display(Name = "Amount in Stock")]
        public Nullable<int> AmtInStock { get; set; }

        [DisplayFormat(DataFormatString = "{0:n0}", ApplyFormatInEditMode = true)]
        [Display(Name = "Amount on Order")]
        public Nullable<int> AmtOnOrder { get; set; }

        [Required(ErrorMessage = "* Supplier is required")]
        [Display(Name = "Supplier")]
        public int SupplierID { get; set; }

        [Required(ErrorMessage = "* In Stock is required")]
        [Display(Name = "In Stock")]
        public int InStockID { get; set; }
    }

    [MetadataType(typeof(ProductMetadata))]
    public partial class Product
    {
        //this is typically empty, unless you need to create custom properties
    }

    #endregion

    #region StockStatus
    public class StockStatusMetadata
    {
        public int InStockID { get; set; }

        [Required(ErrorMessage = "* Status is required")]
        [StringLength(15, ErrorMessage ="* Status cannot exceed 15 characters")]
        public string Status { get; set; }
    }

    [MetadataType(typeof(StockStatusMetadata))]
    public partial class StockStatus
    {
        //this is typically empty, unless you need to create custom properties
    }

    #endregion

    #region Supplier
    public class SupplierMetadata
    {
        public int SupplierID { get; set; }

        [Required(ErrorMessage ="* Company Name is required")]
        [StringLength(20, ErrorMessage ="* Company Name cannot exceed 20 characters")]
        [Display(Name ="Company Name")]
        public string CompanyName { get; set; }

        [Required(ErrorMessage = "* Address is required")]
        [StringLength(50, ErrorMessage = "* Address cannot exceed 50 characters")]
        public string Address { get; set; }

        [Required(ErrorMessage = "* City is required")]
        [StringLength(20, ErrorMessage = "* City cannot exceed 20 characters")]
        public string City { get; set; }

        [Required(ErrorMessage = "* State is required (if none put NA)")]
        [StringLength(2, ErrorMessage = "* State cannot exceed 2 characters")]
        public string State { get; set; }

        [Required(ErrorMessage = "* Country is required")]
        [StringLength(20, ErrorMessage = "* Country cannot exceed 20 characters")]
        public string Country { get; set; }

        [Required(ErrorMessage = "* Zip is required")]
        [StringLength(5, ErrorMessage = "* Zip cannot exceed 5 characters")]
        public string Zip { get; set; }
    }

    [MetadataType(typeof(SupplierMetadata))]
    public partial class Supplier
    {
        //this is typically empty, unless you need to create custom properties
    }

    #endregion
}
