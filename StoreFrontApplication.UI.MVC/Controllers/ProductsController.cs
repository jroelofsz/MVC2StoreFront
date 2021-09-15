using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontApplication.DATA.EF; //Added
using StoreFrontApplication.UI.MVC.Utilities;// Added
using PagedList; // Added for pagedlist
using PagedList.Mvc;// Added for pagedlist
using StoreFrontApplication.UI.MVC.Models;

namespace StoreFrontApplication.UI.MVC.Controllers
{
    public class ProductsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Products
        public ActionResult Index(string searchString, int page = 1)
        {
            //var products = db.Products.Include(p => p.Category).Include(p => p.StockStatu).Include(p => p.Supplier);
            //return View(products.ToList());

            //variable for how many records to show
            int pageSize = 7;

            //collections sorting
            var products = db.Products.OrderBy(x => x.ProductName).ToList();

            #region Searching Logic

            if (!String.IsNullOrEmpty(searchString))
            {
                products = products.Where(x => x.ProductName.ToLower().Contains(searchString.ToLower())).ToList();
            }

            ViewBag.SearchString = searchString;
            #endregion

            return View(products.ToPagedList(page, pageSize));
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Products/Create
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "Type");
            ViewBag.InStockID = new SelectList(db.StockStatus1, "InStockID", "Status");
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,Description,Price,CategoryID,AmtInStock,AmtOnOrder,SupplierID,InStockID")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {

                string file = "NoImage.png";

                if (productImage != null)
                {
                    string ext = file.Substring(file.LastIndexOf("."));

                    string[] goodExts = new string[] { ".png", ".jpg", ".jpeg", ".gif" };

                    if (goodExts.Contains(ext.ToLower()) && productImage.ContentLength <= 4194304)
                    {
                        file = Guid.NewGuid() + ext;

                        #region Resize image
                        string path = Server.MapPath("~/Content/img/products/");

                        Image convertedImage = Image.FromStream(productImage.InputStream);

                        int maxImageSize = 500;

                        int maxThumbSize = 300;

                        ImageUtility.ResizeImage(path, file, convertedImage, maxImageSize, maxThumbSize);
                        #endregion
                    }
                    //No matter what, update the name of the image file that will be saved in the DB
                    product.ProductImage = file;
                }
                
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "Type", product.CategoryID);
            ViewBag.InStockID = new SelectList(db.StockStatus1, "InStockID", "Status", product.InStockID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        // GET: Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "Type", product.CategoryID);
            ViewBag.InStockID = new SelectList(db.StockStatus1, "InStockID", "Status", product.InStockID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,Description,Price,CategoryID,AmtInStock,AmtOnOrder,SupplierID,InStockID")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {

                #region file upload
                string file = product.ProductImage;

                if (productImage != null)
                {
                    file = productImage.FileName;

                    string ext = file.Substring(file.LastIndexOf("."));

                    string[] goodExts = new string[] { ".png", ".jpg", ".jpeg", ".gif" };

                    if (goodExts.Contains(ext.ToLower()) && productImage.ContentLength <= 4194304)
                    {
                        file = Guid.NewGuid() + ext;

                        #region image resize
                        string savePath = Server.MapPath("~/Content/img/products/");

                        Image convertedImage = Image.FromStream(productImage.InputStream);

                        int maxImageSize = 500;

                        int maxThumbSize = 300;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                        #endregion
                        if (product.ProductImage != null && product.ProductImage != "NoImage.png")
                        {
                            string path = Server.MapPath("~/Content/img/products/");
                            ImageUtility.Delete(path, product.ProductImage);
                        }
                        product.ProductImage = file;
                    }
                }
                #endregion
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "Type", product.CategoryID);
            ViewBag.InStockID = new SelectList(db.StockStatus1, "InStockID", "Status", product.InStockID);
            ViewBag.SupplierID = new SelectList(db.Suppliers, "SupplierID", "CompanyName", product.SupplierID);
            return View(product);
        }

        // GET: Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);


            //Delete the image file
            string path = Server.MapPath("~/Content/img/products/");
            ImageUtility.Delete(path, product.ProductImage);


            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
