using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFrontApplication.DATA.EF;
using StoreFrontApplication.UI.MVC.Models;

namespace StoreFrontApplication.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: ShoppingCart
        public ActionResult Index()
        {
            //retrieve the session varaible
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            if (shoppingCart == null)
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            //return view
            return View(shoppingCart);
        }

        #region Adding to cart

        
        public ActionResult AddToCart(int qty, int prodId)
        {
            //Creates an empty collection to store cart info
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            //Checks if session-cart exists, if it does use it to populate the page
            if (Session["cart"] != null)
            {
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            }
            else
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            //Find the product by the ID argument
            Product product = db.Products.Find(prodId);

            //Creates the cart item
            CartItemViewModel item = new CartItemViewModel(product, qty);

            //Add the item to the cart - BUT if we already have that item in the cart, update qty instead
            if (shoppingCart.ContainsKey(product.ProductID))
            {
                shoppingCart[product.ProductID].Qty += qty;
            }
            else
            {
                shoppingCart.Add(product.ProductID, item);
            }

            //Update the session variable
            Session["cart"] = shoppingCart;


            //return view with session variable
            return RedirectToAction("Index");
        }
        #endregion

        #region Updating Cart
        public ActionResult UpdateCart(int prodId, int qty)
        {
            //get session variable and store it locallly
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //update the quantity tied with the product id
            shoppingCart[prodId].Qty = qty;

            //if cart item is 0, remove the item 
            if (shoppingCart[prodId].Qty == 0)
            {
                shoppingCart.Remove(prodId);
            }
            else if (shoppingCart[prodId].Qty > shoppingCart[prodId].Product.AmtInStock)
            {
                shoppingCart[prodId].Qty = (int)shoppingCart[prodId].Product.AmtInStock;
            }

            //update the session variable
            Session["cart"] = shoppingCart;

            //redirct back to index with updated qty
            return RedirectToAction("Index");
        }
        #endregion

        #region Deleting from cart
        public ActionResult RemoveFromCart(int id)
        {
            //Get session variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //remove item
            shoppingCart.Remove(id);

            //update session
            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");

        }
        #endregion
    }
}