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
    public class PedidoProductosController : Controller
    {
        private BeautyStore db = new BeautyStore();

        // GET: PedidoProductos
        public ActionResult Index()
        {
            return View(db.pedidoproducto.ToList());
        }

        // GET: PedidoProductos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PedidoProducto pedidoProducto = db.pedidoproducto.Find(id);
            if (pedidoProducto == null)
            {
                return HttpNotFound();
            }
            return View(pedidoProducto);
        }

        // GET: PedidoProductos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PedidoProductos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPedidoProducto,idPedido,idProducto,cantidadProducto,total,estatus")] PedidoProducto pedidoProducto)
        {
            if (ModelState.IsValid)
            {
                db.pedidoproducto.Add(pedidoProducto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(pedidoProducto);
        }

        // GET: PedidoProductos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PedidoProducto pedidoProducto = db.pedidoproducto.Find(id);
            if (pedidoProducto == null)
            {
                return HttpNotFound();
            }
            return View(pedidoProducto);
        }

        // POST: PedidoProductos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPedidoProducto,idPedido,idProducto,cantidadProducto,total,estatus")] PedidoProducto pedidoProducto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pedidoProducto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(pedidoProducto);
        }

        // GET: PedidoProductos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PedidoProducto pedidoProducto = db.pedidoproducto.Find(id);
            if (pedidoProducto == null)
            {
                return HttpNotFound();
            }
            return View(pedidoProducto);
        }

        // POST: PedidoProductos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PedidoProducto pedidoProducto = db.pedidoproducto.Find(id);
            db.pedidoproducto.Remove(pedidoProducto);
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
