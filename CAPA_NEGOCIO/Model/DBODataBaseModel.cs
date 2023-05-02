using CAPA_DATOS;
using CAPA_NEGOCIO.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace DataBaseModel {
   public class Detail_Transaccion_Lote : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Detalle_Transaccion { get; set; }
       public int? Id_Lote { get; set; }
       public int? Cantidad_Afectada { get; set; }
       public int? Id_Transaccion { get; set; }
       public int? Id_Detalle_Factura { get; set; }
       [ManyToOne(TableName = "Detail_Factura", KeyColumn = "Id_Detalle_Factura", ForeignKeyColumn = "Id_Detalle_Factura")]
       public Detail_Factura? Detail_Factura { get; set; }
       [ManyToOne(TableName = "Transaction_Lotes", KeyColumn = "Id_Lote", ForeignKeyColumn = "Id_Lote")]
       public Transaction_Lotes? Transaction_Lotes { get; set; }
       [ManyToOne(TableName = "Transaction_Transacciones_Lotes", KeyColumn = "Id_Transaccion", ForeignKeyColumn = "Id_Transaccion")]
       public Transaction_Transacciones_Lotes? Transaction_Transacciones_Lotes { get; set; }
   }
   public class Transaction_Movimiento : EntityClass {
       [PrimaryKey(Identity = false)]
       public int? Id_Movimiento { get; set; }
       public string? Motivo { get; set; }
       public DateTime? Fecha { get; set; }
       public int? Id_Gestor { get; set; }
       [OneToMany(TableName = "Detail_Movimiento", KeyColumn = "Id_Movimiento", ForeignKeyColumn = "Id_Movimiento")]
       public List<Detail_Movimiento>? Detail_Movimiento { get; set; }
   }
   public class Detail_Movimiento : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Detalle_Movimiento { get; set; }
       public int? Id_Original { get; set; }
       public int? Id_Resultante { get; set; }
       public int? Id_Movimiento { get; set; }
       public int? Cantidad_Afectada { get; set; }
       [ManyToOne(TableName = "Transaction_Movimiento", KeyColumn = "Id_Movimiento", ForeignKeyColumn = "Id_Movimiento")]
       public Transaction_Movimiento? Transaction_Movimiento { get; set; }
       [ManyToOne(TableName = "Transaction_Lotes", KeyColumn = "Id_Lote", ForeignKeyColumn = "Id_Original")]
       public Transaction_Lotes? Transaction_Lotes_Id_Original { get; set; }
       [ManyToOne(TableName = "Transaction_Lotes", KeyColumn = "Id_Lote", ForeignKeyColumn = "Id_Resultante")]
       public Transaction_Lotes? Transaction_Lotes_Id_Resultante { get; set; }
   }
   public class Catalogo_Almacen : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Almacen { get; set; }
       public string? Descripcion { get; set; }
       public string? Ubicacion { get; set; }
       public string? Estado { get; set; }
       public int? Id_Sucursal { get; set; }
       [ManyToOne(TableName = "Catalogo_Sucursales", KeyColumn = "Id_Sucursal", ForeignKeyColumn = "Id_Sucursal")]
       public Catalogo_Sucursales? Catalogo_Sucursales { get; set; }
       [OneToMany(TableName = "Transaction_Lotes", KeyColumn = "Id_Almacen", ForeignKeyColumn = "Id_Almacen")]
       public List<Transaction_Lotes>? Transaction_Lotes { get; set; }
   }
   public class Catalogo_Sucursales : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Sucursal { get; set; }
       public string? Nombre { get; set; }
       public string? Descripcion { get; set; }
       public string? Direccion { get; set; }
       [OneToMany(TableName = "Catalogo_Almacen", KeyColumn = "Id_Sucursal", ForeignKeyColumn = "Id_Sucursal")]
       public List<Catalogo_Almacen>? Catalogo_Almacen { get; set; }
       [OneToOne(TableName = "Datos_Configuracion", KeyColumn = "Id_Sucursal", ForeignKeyColumn = "Id_Sucursal")]
       public Datos_Configuracion? Datos_Configuracion { get; set; }
       [OneToMany(TableName = "Security_Users", KeyColumn = "Id_Sucursal", ForeignKeyColumn = "Id_Sucursal")]
       public List<Security_Users>? Security_Users { get; set; }
   }
   public class Catalogo_Caracteristicas : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Caracteristica { get; set; }
       public string? Descripcion { get; set; }
       public string? EStado { get; set; }
       [OneToMany(TableName = "Relational_Caracteristicas_Productos", KeyColumn = "Id_Caracteristica", ForeignKeyColumn = "Id_Caracteristica")]
       public List<Relational_Caracteristicas_Productos>? Relational_Caracteristicas_Productos { get; set; }
   }
   public class Datos_Configuracion : EntityClass {
       [PrimaryKey(Identity = false)]
       public int? Id_Sucursal { get; set; }
       public string? Encabezado { get; set; }
       public bool? AutoDebito { get; set; }
       [OneToOne(TableName = "Catalogo_Sucursales", KeyColumn = "Id_Sucursal", ForeignKeyColumn = "Id_Sucursal")]
       public Catalogo_Sucursales? Catalogo_Sucursales { get; set; }
   }
   public class Catalogo_Categorias : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Categoria { get; set; }
       public string? Descripcion { get; set; }
       public string? Estado { get; set; }
       [OneToMany(TableName = "Catalogo_Producto", KeyColumn = "Id_Categoria", ForeignKeyColumn = "Id_Categoria")]
       public List<Catalogo_Producto>? Catalogo_Producto { get; set; }
   }
   public class Catalogo_Clientes : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Cliente { get; set; }
       public string? Nombres { get; set; }
       public string? Apellidos { get; set; }
       public string? DNI { get; set; }
       [OneToMany(TableName = "Transaction_Factura", KeyColumn = "Id_Cliente", ForeignKeyColumn = "Id_Cliente")]
       public List<Transaction_Factura>? Transaction_Factura { get; set; }
   }
   public class Catalogo_Oferta_Especial : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Oferta { get; set; }
       public int? Id_Lote { get; set; }
       public string? Estado { get; set; }
       public Double? Valor { get; set; }
       public DateTime? Vencimiento { get; set; }
       [OneToMany(TableName = "Detail_Factura", KeyColumn = "Id_Oferta", ForeignKeyColumn = "Id_Oferta")]
       public List<Detail_Factura>? Detail_Factura { get; set; }
   }
   public class Catalogo_Presentacion : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Presentacion { get; set; }
       public string? Descripcion { get; set; }
       public string? Estado { get; set; }
       public string? Abreviatura { get; set; }
       [OneToMany(TableName = "Relational_Equivalencias_Presentacion", KeyColumn = "Id_Presentacion", ForeignKeyColumn = "Id_Presentacion_Final")]
       public List<Relational_Equivalencias_Presentacion>? Relational_Equivalencias_Presentacion_Id_Presentacion_Final { get; set; }
       [OneToMany(TableName = "Relational_Equivalencias_Presentacion", KeyColumn = "Id_Presentacion", ForeignKeyColumn = "Id_Presentacion_Inicial")]
       public List<Relational_Equivalencias_Presentacion>? Relational_Equivalencias_Presentacion_Id_Presentacion_Inicial { get; set; }
       [OneToMany(TableName = "Transaction_Lotes", KeyColumn = "Id_Presentacion", ForeignKeyColumn = "Id_Presentacion")]
       public List<Transaction_Lotes>? Transaction_Lotes { get; set; }
   }
   public class Catalogo_Producto : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Producto { get; set; }
       public string? Descripcion { get; set; }
       public int? Id_Categoria { get; set; }
       [ManyToOne(TableName = "Catalogo_Categorias", KeyColumn = "Id_Categoria", ForeignKeyColumn = "Id_Categoria")]
       public Catalogo_Categorias? Catalogo_Categorias { get; set; }
       [OneToMany(TableName = "Detail_Factura", KeyColumn = "Id_Producto", ForeignKeyColumn = "Id_Producto")]
       public List<Detail_Factura>? Detail_Factura { get; set; }
       [OneToMany(TableName = "Relational_Caracteristicas_Productos", KeyColumn = "Id_Producto", ForeignKeyColumn = "Id_Producto")]
       public List<Relational_Caracteristicas_Productos>? Relational_Caracteristicas_Productos { get; set; }
       [OneToMany(TableName = "Transaction_Lotes", KeyColumn = "Id_Producto", ForeignKeyColumn = "Id_Producto")]
       public List<Transaction_Lotes>? Transaction_Lotes { get; set; }
   }
   public class Catalogo_Tipo_Detalle_Lote : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Tipo_Detalle { get; set; }
       public string? Descripcion { get; set; }
       public string? Estado { get; set; }
       [OneToMany(TableName = "Relational_Detalle_Lotes", KeyColumn = "Id_Tipo_Detalle", ForeignKeyColumn = "Id_Tipo_Detalle")]
       public List<Relational_Detalle_Lotes>? Relational_Detalle_Lotes { get; set; }
   }
   public class Catalogo_Tipo_Transaccion : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Tipo_Transaccion { get; set; }
       public string? Descripcion { get; set; }
       public string? Estado { get; set; }
       [OneToMany(TableName = "Transaction_Transacciones_Lotes", KeyColumn = "Id_Tipo_Transaccion", ForeignKeyColumn = "Id_Tipo_Transaccion")]
       public List<Transaction_Transacciones_Lotes>? Transaction_Transacciones_Lotes { get; set; }
   }
   public class Detail_Factura : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Detalle_Factura { get; set; }
       public int? Id_Factura { get; set; }
       public int? Id_Producto { get; set; }
       public Double? Precio_Venta { get; set; }
       public int? Cantidad { get; set; }
       public Double? Total { get; set; }
       public int? Id_Oferta { get; set; }
       [ManyToOne(TableName = "Catalogo_Oferta_Especial", KeyColumn = "Id_Oferta", ForeignKeyColumn = "Id_Oferta")]
       public Catalogo_Oferta_Especial? Catalogo_Oferta_Especial { get; set; }
       [ManyToOne(TableName = "Catalogo_Producto", KeyColumn = "Id_Producto", ForeignKeyColumn = "Id_Producto")]
       public Catalogo_Producto? Catalogo_Producto { get; set; }
       [ManyToOne(TableName = "Transaction_Factura", KeyColumn = "Id_Factura", ForeignKeyColumn = "Id_Factura")]
       public Transaction_Factura? Transaction_Factura { get; set; }
       [OneToMany(TableName = "Detail_Transaccion_Lote", KeyColumn = "Id_Detalle_Factura", ForeignKeyColumn = "Id_Detalle_Factura")]
       public List<Detail_Transaccion_Lote>? Detail_Transaccion_Lote { get; set; }
   }
   public class Relational_Caracteristicas_Productos : EntityClass {
       [PrimaryKey(Identity = false)]
       public int? Id_Producto { get; set; }
       [PrimaryKey(Identity = false)]
       public int? Id_Caracteristica { get; set; }
       public string? Descripcion { get; set; }
       [ManyToOne(TableName = "Catalogo_Caracteristicas", KeyColumn = "Id_Caracteristica", ForeignKeyColumn = "Id_Caracteristica")]
       public Catalogo_Caracteristicas? Catalogo_Caracteristicas { get; set; }
       [ManyToOne(TableName = "Catalogo_Producto", KeyColumn = "Id_Producto", ForeignKeyColumn = "Id_Producto")]
       public Catalogo_Producto? Catalogo_Producto { get; set; }
   }
   public class Relational_Detalle_Lotes : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Detalle { get; set; }
       public string? Descripcion { get; set; }
       public int? Id_Tipo_Detalle { get; set; }
       public string? Estado { get; set; }
       public int? Id_Lote { get; set; }
       [ManyToOne(TableName = "Catalogo_Tipo_Detalle_Lote", KeyColumn = "Id_Tipo_Detalle", ForeignKeyColumn = "Id_Tipo_Detalle")]
       public Catalogo_Tipo_Detalle_Lote? Catalogo_Tipo_Detalle_Lote { get; set; }
       [ManyToOne(TableName = "Transaction_Lotes", KeyColumn = "Id_Lote", ForeignKeyColumn = "Id_Lote")]
       public Transaction_Lotes? Transaction_Lotes { get; set; }
   }
   public class Relational_Equivalencias_Presentacion : EntityClass {
       [PrimaryKey(Identity = false)]
       public int? Id_Presentacion_Inicial { get; set; }
       public int? Valor_Presentacion_Inicial { get; set; }
       [PrimaryKey(Identity = false)]
       public int? Id_Presentacion_Final { get; set; }
       public int? Valor_Presentacion_Final { get; set; }
       [ManyToOne(TableName = "Catalogo_Presentacion", KeyColumn = "Id_Presentacion", ForeignKeyColumn = "Id_Presentacion_Inicial")]
       public Catalogo_Presentacion? Catalogo_Presentacion_Id_Presentacion_Inicial { get; set; }
       [ManyToOne(TableName = "Catalogo_Presentacion", KeyColumn = "Id_Presentacion", ForeignKeyColumn = "Id_Presentacion_Final")]
       public Catalogo_Presentacion? Catalogo_Presentacion_Id_Presentacion_Final { get; set; }
   }
   public class Transaction_Factura : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Factura { get; set; }
       public string? Nombre_Cliente { get; set; }
       public int? Id_Cliente { get; set; }
       public DateTime? Fecha { get; set; }
       public Double? SubTotal { get; set; }
       public Double? IVA { get; set; }
       public Double? Total { get; set; }
       public string? No_Factura { get; set; }
       public string? Estado { get; set; }
       [ManyToOne(TableName = "Catalogo_Clientes", KeyColumn = "Id_Cliente", ForeignKeyColumn = "Id_Cliente")]
       public Catalogo_Clientes? Catalogo_Clientes { get; set; }
       [OneToMany(TableName = "Detail_Factura", KeyColumn = "Id_Factura", ForeignKeyColumn = "Id_Factura")]
       public List<Detail_Factura>? Detail_Factura { get; set; }
   }
   public class Transaction_Lotes : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Lote { get; set; }
       public int? Cantidad { get; set; }
       public int? Id_Producto { get; set; }
       public int? Cantidad_Inicial { get; set; }
       public int? Cantidad_Existente { get; set; }
       public Double? Costo { get; set; }
       public string? Estado { get; set; }
       public int? Id_Presentacion { get; set; }
       public int? Id_Almacen { get; set; }
       [ManyToOne(TableName = "Catalogo_Almacen", KeyColumn = "Id_Almacen", ForeignKeyColumn = "Id_Almacen")]
       public Catalogo_Almacen? Catalogo_Almacen { get; set; }
       [ManyToOne(TableName = "Catalogo_Presentacion", KeyColumn = "Id_Presentacion", ForeignKeyColumn = "Id_Presentacion")]
       public Catalogo_Presentacion? Catalogo_Presentacion { get; set; }
       [ManyToOne(TableName = "Catalogo_Producto", KeyColumn = "Id_Producto", ForeignKeyColumn = "Id_Producto")]
       public Catalogo_Producto? Catalogo_Producto { get; set; }
       [OneToMany(TableName = "Detail_Movimiento", KeyColumn = "Id_Lote", ForeignKeyColumn = "Id_Original")]
       public List<Detail_Movimiento>? Detail_Movimiento_Id_Original { get; set; }
       [OneToMany(TableName = "Detail_Movimiento", KeyColumn = "Id_Lote", ForeignKeyColumn = "Id_Resultante")]
       public List<Detail_Movimiento>? Detail_Movimiento_Id_Resultante { get; set; }
       [OneToMany(TableName = "Detail_Transaccion_Lote", KeyColumn = "Id_Lote", ForeignKeyColumn = "Id_Lote")]
       public List<Detail_Transaccion_Lote>? Detail_Transaccion_Lote { get; set; }
       [OneToMany(TableName = "Relational_Detalle_Lotes", KeyColumn = "Id_Lote", ForeignKeyColumn = "Id_Lote")]
       public List<Relational_Detalle_Lotes>? Relational_Detalle_Lotes { get; set; }
   }
   public class Transaction_Transacciones_Lotes : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Transaccion { get; set; }
       public string? Descripcion { get; set; }
       public string? Estado { get; set; }
       public int? Id_Detalle_Transaccion { get; set; }
       public int? Id_Usuario_Gestor { get; set; }
       public DateTime? Fecha { get; set; }
       [ManyToOne(TableName = "Catalogo_Tipo_Transaccion", KeyColumn = "Id_Tipo_Transaccion", ForeignKeyColumn = "Id_Tipo_Transaccion")]
       public Catalogo_Tipo_Transaccion? Catalogo_Tipo_Transaccion { get; set; }
       [OneToOne(TableName = "Datos_Compra", KeyColumn = "Id_Transaccion", ForeignKeyColumn = "Id_Transaccion")]
       public Datos_Compra? Datos_Compra { get; set; }
       [OneToMany(TableName = "Detail_Transaccion_Lote", KeyColumn = "Id_Transaccion", ForeignKeyColumn = "Id_Transaccion")]
       public List<Detail_Transaccion_Lote>? Detail_Transaccion_Lote { get; set; }
   }
   public class Catalogo_Proveedores : EntityClass {
       [PrimaryKey(Identity = true)]
       public int? Id_Proveedor { get; set; }
       public string? Descripcion { get; set; }
       public string? No_Contacto { get; set; }
       public string? Email { get; set; }
       [OneToMany(TableName = "Datos_Compra", KeyColumn = "Id_Proveedor", ForeignKeyColumn = "Id_Proveedor")]
       public List<Datos_Compra>? Datos_Compra { get; set; }
   }
   public class Datos_Compra : EntityClass {
       [PrimaryKey(Identity = false)]
       public int? Id_Transaccion { get; set; }
       public int? Id_Proveedor { get; set; }
       public string? No_Factura { get; set; }
       [OneToOne(TableName = "Transaction_Transacciones_Lotes", KeyColumn = "Id_Transaccion", ForeignKeyColumn = "Id_Transaccion")]
       public Transaction_Transacciones_Lotes? Transaction_Transacciones_Lotes { get; set; }
       [ManyToOne(TableName = "Catalogo_Proveedores", KeyColumn = "Id_Proveedor", ForeignKeyColumn = "Id_Proveedor")]
       public Catalogo_Proveedores? Catalogo_Proveedores { get; set; }
   }
}
