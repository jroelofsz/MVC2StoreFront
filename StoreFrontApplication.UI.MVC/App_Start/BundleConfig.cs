using System.Web.Optimization;

namespace StoreFrontApplication.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Content/js/demo.js",
                        "~/Content/js/front.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));


            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Content/vendor/bootstrap/css/bootstrap.min.css",
                      "~/Scripts/respond.js",
                      "~/Content/vendor/bootstrap-select/css/bootstrap-select.min.css"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css",
                      "~/Content/vendor/lightbox2/css/lightbox.min.css",
                      "~/Content/vendor/nouislider/nouislider.min.css",
                      "~/Content/vendor/owl.carousel2/assets/owl.carousel.min.css",
                      "~/Content/vendor/owl.carousel2/assets/owl.theme.default.css",
                      "~/Content/css/style.default.css",
                      "~/Content/img/favicon.png",
                      "~/Content/css/jakecustom.css"));
        }

    }
}
