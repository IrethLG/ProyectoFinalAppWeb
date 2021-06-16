﻿using System;
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
    public class FormaPagosController : Controller
    {
        private BeautyStore db = new BeautyStore();

        // GET: FormaPagos
        public ActionResult Index()
        {
            return View(db.formapago.ToList());
        }

        // GET: FormaPagos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FormaPago formaPago = db.formapago.Find(id);
            if (formaPago == null)
            {
                return HttpNotFound();
            }
            return View(formaPago);
        }

        // GET: FormaPagos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: FormaPagos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idFormaPago,nombre,estatus")] FormaPago formaPago)
        {
            if (ModelState.IsValid)
            {
                db.formapago.Add(formaPago);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(formaPago);
        }

        // GET: FormaPagos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FormaPago formaPago = db.formapago.Find(id);
            if (formaPago == null)
            {
                return HttpNotFound();
            }
            return View(formaPago);
        }

        // POST: FormaPagos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idFormaPago,nombre,estatus")] FormaPago formaPago)
        {
            if (ModelState.IsValid)
            {
                db.Entry(formaPago).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(formaPago);
        }

        // GET: FormaPagos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FormaPago formaPago = db.formapago.Find(id);
            if (formaPago == null)
            {
                return HttpNotFound();
            }
            return View(formaPago);
        }

        // POST: FormaPagos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FormaPago formaPago = db.formapago.Find(id);
            db.formapago.Remove(formaPago);
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
