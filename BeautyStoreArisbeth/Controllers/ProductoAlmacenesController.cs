using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BeautyStoreArisbeth.Models;

namespace BeautyStoreArisbeth.Controllers
{
    public class ProductoAlmacenesController : Controller
    {
        private BeautyStore db = new BeautyStore();

        // GET: ProductoAlmacenes
        public ActionResult Index()
        {
            return View(db.productoalmacen.ToList());
        }

        // GET: ProductoAlmacenes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductoAlmacen productoAlmacen = db.productoalmacen.Find(id);
            if (productoAlmacen == null)
            {
                return HttpNotFound();
            }
            return View(productoAlmacen);
        }

        // GET: ProductoAlmacenes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductoAlmacenes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idProductoAlmacen,idProducto,idAlmacen,estatus")] ProductoAlmacen productoAlmacen)
        {
            if (ModelState.IsValid)
            {
                db.productoalmacen.Add(productoAlmacen);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(productoAlmacen);
        }

        // GET: ProductoAlmacenes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductoAlmacen productoAlmacen = db.productoalmacen.Find(id);
            if (productoAlmacen == null)
            {
                return HttpNotFound();
            }
            return View(productoAlmacen);
        }

        // POST: ProductoAlmacenes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idProductoAlmacen,idProducto,idAlmacen,estatus")] ProductoAlmacen productoAlmacen)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productoAlmacen).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(productoAlmacen);
        }

        // GET: ProductoAlmacenes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductoAlmacen productoAlmacen = db.productoalmacen.Find(id);
            if (productoAlmacen == null)
            {
                return HttpNotFound();
            }
            return View(productoAlmacen);
        }

        // POST: ProductoAlmacenes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductoAlmacen productoAlmacen = db.productoalmacen.Find(id);
            db.productoalmacen.Remove(productoAlmacen);
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
