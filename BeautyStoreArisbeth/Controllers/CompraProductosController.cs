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
    public class CompraProductosController : Controller
    {
        private BeautyStore db = new BeautyStore();

        // GET: CompraProductos
        public ActionResult Index()
        {
            return View(db.compraproductos.ToList());
        }

        // GET: CompraProductos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompraProducto compraProducto = db.compraproductos.Find(id);
            if (compraProducto == null)
            {
                return HttpNotFound();
            }
            return View(compraProducto);
        }

        // GET: CompraProductos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CompraProductos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCompraProducto,idCompra,idProducto,estatus")] CompraProducto compraProducto)
        {
            if (ModelState.IsValid)
            {
                db.compraproductos.Add(compraProducto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(compraProducto);
        }

        // GET: CompraProductos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompraProducto compraProducto = db.compraproductos.Find(id);
            if (compraProducto == null)
            {
                return HttpNotFound();
            }
            return View(compraProducto);
        }

        // POST: CompraProductos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idCompraProducto,idCompra,idProducto,estatus")] CompraProducto compraProducto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(compraProducto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(compraProducto);
        }

        // GET: CompraProductos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CompraProducto compraProducto = db.compraproductos.Find(id);
            if (compraProducto == null)
            {
                return HttpNotFound();
            }
            return View(compraProducto);
        }

        // POST: CompraProductos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CompraProducto compraProducto = db.compraproductos.Find(id);
            db.compraproductos.Remove(compraProducto);
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
