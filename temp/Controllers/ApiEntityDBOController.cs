using DataBaseModel;
using Security;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
namespace API.Controllers {
   [Route("api/[controller]/[action]")]
   [ApiController]
   public class  ApiEntityDBOController : ControllerBase {
       //Catalogo_Almacen
       [HttpPost]
       [AuthController]
       public List<Catalogo_Almacen> getCatalogo_Almacen(Catalogo_Almacen Inst) {
           return Inst.Get<Catalogo_Almacen>();
       }
       [HttpPost]
       [AuthController]
       public object saveCatalogo_Almacen(Catalogo_Almacen inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateCatalogo_Almacen(Catalogo_Almacen inst) {
           return inst.Update();
       }
       //Catalogo_Caracteristicas
       [HttpPost]
       [AuthController]
       public List<Catalogo_Caracteristicas> getCatalogo_Caracteristicas(Catalogo_Caracteristicas Inst) {
           return Inst.Get<Catalogo_Caracteristicas>();
       }
       [HttpPost]
       [AuthController]
       public object saveCatalogo_Caracteristicas(Catalogo_Caracteristicas inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateCatalogo_Caracteristicas(Catalogo_Caracteristicas inst) {
           return inst.Update();
       }
       //Catalogo_Categorias
       [HttpPost]
       [AuthController]
       public List<Catalogo_Categorias> getCatalogo_Categorias(Catalogo_Categorias Inst) {
           return Inst.Get<Catalogo_Categorias>();
       }
       [HttpPost]
       [AuthController]
       public object saveCatalogo_Categorias(Catalogo_Categorias inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateCatalogo_Categorias(Catalogo_Categorias inst) {
           return inst.Update();
       }
       //Catalogo_Clientes
       [HttpPost]
       [AuthController]
       public List<Catalogo_Clientes> getCatalogo_Clientes(Catalogo_Clientes Inst) {
           return Inst.Get<Catalogo_Clientes>();
       }
       [HttpPost]
       [AuthController]
       public object saveCatalogo_Clientes(Catalogo_Clientes inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateCatalogo_Clientes(Catalogo_Clientes inst) {
           return inst.Update();
       }
       //Catalogo_Oferta_Especial
       [HttpPost]
       [AuthController]
       public List<Catalogo_Oferta_Especial> getCatalogo_Oferta_Especial(Catalogo_Oferta_Especial Inst) {
           return Inst.Get<Catalogo_Oferta_Especial>();
       }
       [HttpPost]
       [AuthController]
       public object saveCatalogo_Oferta_Especial(Catalogo_Oferta_Especial inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateCatalogo_Oferta_Especial(Catalogo_Oferta_Especial inst) {
           return inst.Update();
       }
       //Catalogo_Presentacion
       [HttpPost]
       [AuthController]
       public List<Catalogo_Presentacion> getCatalogo_Presentacion(Catalogo_Presentacion Inst) {
           return Inst.Get<Catalogo_Presentacion>();
       }
       [HttpPost]
       [AuthController]
       public object saveCatalogo_Presentacion(Catalogo_Presentacion inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateCatalogo_Presentacion(Catalogo_Presentacion inst) {
           return inst.Update();
       }
       //Catalogo_Producto
       [HttpPost]
       [AuthController]
       public List<Catalogo_Producto> getCatalogo_Producto(Catalogo_Producto Inst) {
           return Inst.Get<Catalogo_Producto>();
       }
       [HttpPost]
       [AuthController]
       public object saveCatalogo_Producto(Catalogo_Producto inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateCatalogo_Producto(Catalogo_Producto inst) {
           return inst.Update();
       }
       //Catalogo_Tipo_Detalle_Lote
       [HttpPost]
       [AuthController]
       public List<Catalogo_Tipo_Detalle_Lote> getCatalogo_Tipo_Detalle_Lote(Catalogo_Tipo_Detalle_Lote Inst) {
           return Inst.Get<Catalogo_Tipo_Detalle_Lote>();
       }
       [HttpPost]
       [AuthController]
       public object saveCatalogo_Tipo_Detalle_Lote(Catalogo_Tipo_Detalle_Lote inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateCatalogo_Tipo_Detalle_Lote(Catalogo_Tipo_Detalle_Lote inst) {
           return inst.Update();
       }
       //Catalogo_Tipo_Transaccion
       [HttpPost]
       [AuthController]
       public List<Catalogo_Tipo_Transaccion> getCatalogo_Tipo_Transaccion(Catalogo_Tipo_Transaccion Inst) {
           return Inst.Get<Catalogo_Tipo_Transaccion>();
       }
       [HttpPost]
       [AuthController]
       public object saveCatalogo_Tipo_Transaccion(Catalogo_Tipo_Transaccion inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateCatalogo_Tipo_Transaccion(Catalogo_Tipo_Transaccion inst) {
           return inst.Update();
       }
       //Detail_Factura
       [HttpPost]
       [AuthController]
       public List<Detail_Factura> getDetail_Factura(Detail_Factura Inst) {
           return Inst.Get<Detail_Factura>();
       }
       [HttpPost]
       [AuthController]
       public object saveDetail_Factura(Detail_Factura inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateDetail_Factura(Detail_Factura inst) {
           return inst.Update();
       }
       //Detail_Transaccion_Lote
       [HttpPost]
       [AuthController]
       public List<Detail_Transaccion_Lote> getDetail_Transaccion_Lote(Detail_Transaccion_Lote Inst) {
           return Inst.Get<Detail_Transaccion_Lote>();
       }
       [HttpPost]
       [AuthController]
       public object saveDetail_Transaccion_Lote(Detail_Transaccion_Lote inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateDetail_Transaccion_Lote(Detail_Transaccion_Lote inst) {
           return inst.Update();
       }
       //Relational_Caracteristicas_Productos
       [HttpPost]
       [AuthController]
       public List<Relational_Caracteristicas_Productos> getRelational_Caracteristicas_Productos(Relational_Caracteristicas_Productos Inst) {
           return Inst.Get<Relational_Caracteristicas_Productos>();
       }
       [HttpPost]
       [AuthController]
       public object saveRelational_Caracteristicas_Productos(Relational_Caracteristicas_Productos inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateRelational_Caracteristicas_Productos(Relational_Caracteristicas_Productos inst) {
           return inst.Update();
       }
       //Relational_Detalle_Lotes
       [HttpPost]
       [AuthController]
       public List<Relational_Detalle_Lotes> getRelational_Detalle_Lotes(Relational_Detalle_Lotes Inst) {
           return Inst.Get<Relational_Detalle_Lotes>();
       }
       [HttpPost]
       [AuthController]
       public object saveRelational_Detalle_Lotes(Relational_Detalle_Lotes inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateRelational_Detalle_Lotes(Relational_Detalle_Lotes inst) {
           return inst.Update();
       }
       //Relational_Equivalencias_Presentacion
       [HttpPost]
       [AuthController]
       public List<Relational_Equivalencias_Presentacion> getRelational_Equivalencias_Presentacion(Relational_Equivalencias_Presentacion Inst) {
           return Inst.Get<Relational_Equivalencias_Presentacion>();
       }
       [HttpPost]
       [AuthController]
       public object saveRelational_Equivalencias_Presentacion(Relational_Equivalencias_Presentacion inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateRelational_Equivalencias_Presentacion(Relational_Equivalencias_Presentacion inst) {
           return inst.Update();
       }
       //Transaction_Factura
       [HttpPost]
       [AuthController]
       public List<Transaction_Factura> getTransaction_Factura(Transaction_Factura Inst) {
           return Inst.Get<Transaction_Factura>();
       }
       [HttpPost]
       [AuthController]
       public object saveTransaction_Factura(Transaction_Factura inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateTransaction_Factura(Transaction_Factura inst) {
           return inst.Update();
       }
       //Transaction_Lotes
       [HttpPost]
       [AuthController]
       public List<Transaction_Lotes> getTransaction_Lotes(Transaction_Lotes Inst) {
           return Inst.Get<Transaction_Lotes>();
       }
       [HttpPost]
       [AuthController]
       public object saveTransaction_Lotes(Transaction_Lotes inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateTransaction_Lotes(Transaction_Lotes inst) {
           return inst.Update();
       }
       //Transaction_Transacciones_Lotes
       [HttpPost]
       [AuthController]
       public List<Transaction_Transacciones_Lotes> getTransaction_Transacciones_Lotes(Transaction_Transacciones_Lotes Inst) {
           return Inst.Get<Transaction_Transacciones_Lotes>();
       }
       [HttpPost]
       [AuthController]
       public object saveTransaction_Transacciones_Lotes(Transaction_Transacciones_Lotes inst) {
           return inst.Save();
       }
       [HttpPost]
       [AuthController]
       public object updateTransaction_Transacciones_Lotes(Transaction_Transacciones_Lotes inst) {
           return inst.Update();
       }
   }
}
