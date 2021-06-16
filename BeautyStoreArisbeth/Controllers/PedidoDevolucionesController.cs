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
    public class PedidoDevolucionesController : Controller
    {
        private BeautyStore db = new BeautyStore();

        // GET: PedidoDevoluciones
        public ActionResult Index()
        {
            return View(db.pedidodevoluciones.ToList());
        }

        // GET: PedidoDevoluciones/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PedidoDevolucion pedidoDevolucion = db.pedidodevoluciones.Find(id);
            if (pedidoDevolucion == null)
            {
                return HttpNotFound();
            }
            return View(pedidoDevolucion);
        }

        // GET: PedidoDevoluciones/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PedidoDevoluciones/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPedidoDevolucion,idPedido,idDevolucion,estatus")] PedidoDevolucion pedidoDevolucion)
        {
            if (ModelState.IsValid)
            {
                db.pedidodevoluciones.Add(pedidoDevolucion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(pedidoDevolucion);
        }

        // GET: PedidoDevoluciones/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PedidoDevolucion pedidoDevolucion = db.pedidodevoluciones.Find(id);
            if (pedidoDevolucion == null)
            {
                return HttpNotFound();
            }
            return View(pedidoDevolucion);
        }

        // POST: PedidoDevoluciones/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPedidoDevolucion,idPedido,idDevolucion,estatus")] PedidoDevolucion pedidoDevolucion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pedidoDevolucion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(pedidoDevolucion);
        }

        // GET: PedidoDevoluciones/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PedidoDevolucion pedidoDevolucion = db.pedidodevoluciones.Find(id);
            if (pedidoDevolucion == null)
            {
                return HttpNotFound();
            }
            return View(pedidoDevolucion);
        }

        // POST: PedidoDevoluciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PedidoDevolucion pedidoDevolucion = db.pedidodevoluciones.Find(id);
            db.pedidodevoluciones.Remove(pedidoDevolucion);
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
