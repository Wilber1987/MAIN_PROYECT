//@ts-check
import { WForm } from "../WDevCore/WComponents/WForm.js";
import { EntityClass } from "../WDevCore/WModules/EntityClass.js";
import { WAjaxTools } from "../WDevCore/WModules/WComponentsTools.js";
class Detail_Transaccion_Lote extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Detalle_Transaccion = { type: 'number', primary: true };
    Cantidad_Afectada = { type: 'number' };
    Detail_Factura = { type: 'WSELECT', ModelObject: () => new Detail_Factura() };
    Transaction_Lotes = { type: 'WSELECT', ModelObject: () => new Transaction_Lotes() };
}
export { Detail_Transaccion_Lote }

class Catalogo_Almacen extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Almacen = { type: 'number', primary: true };
    Descripcion = { type: 'text' };
    Ubicacion = { type: 'text' };
    Estado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
    Catalogo_Sucursales = { type: 'WSELECT', ModelObject: () => new Catalogo_Sucursales() };
}
export { Catalogo_Almacen }

class Catalogo_Caracteristicas extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Caracteristica = { type: 'number', primary: true };
    Descripcion = { type: 'text' };
    EStado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
    Relational_Caracteristicas_Productos = { type: 'MasterDetail', ModelObject: () => new Relational_Caracteristicas_Productos() };
}
export { Catalogo_Caracteristicas }

class Catalogo_Categorias extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Categoria = { type: 'number', primary: true };
    Descripcion = { type: 'text' };
    Estado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
}
export { Catalogo_Categorias }
class Catalogo_Clientes extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Cliente = { type: 'number', primary: true };
    Nombres = { type: 'text' };
    Apellidos = { type: 'text' };
    DNI = { type: 'text' };
}
export { Catalogo_Clientes }
class Catalogo_Oferta_Especial extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Oferta = { type: 'number', primary: true };
    Id_Lote = { type: 'number' };
    Estado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
    Valor = { type: 'number' };
    Vencimiento = { type: 'date' };
}
export { Catalogo_Oferta_Especial }
class Catalogo_Presentacion extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Presentacion = { type: 'number', primary: true };
    Descripcion = { type: 'text' };
    Estado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
    Abreviatura = { type: 'text' };
    Relational_Equivalencias_Presentacion_Id_Presentacion_Final = { type: 'MasterDetail', ModelObject: () => new Relational_Equivalencias_Presentacion() };
    Relational_Equivalencias_Presentacion_Id_Presentacion_Inicial = { type: 'MasterDetail', ModelObject: () => new Relational_Equivalencias_Presentacion() };
}
export { Catalogo_Presentacion }
class Catalogo_Producto extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Producto = { type: 'number', primary: true };
    Descripcion = { type: 'text' };
    Catalogo_Categorias = { type: 'WSELECT', ModelObject: () => new Catalogo_Categorias() };
    Relational_Caracteristicas_Productos = { type: 'MasterDetail', ModelObject: () => new Relational_Caracteristicas_Productos() };
}
export { Catalogo_Producto }
class Catalogo_Tipo_Detalle_Lote extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Tipo_Detalle = { type: 'number', primary: true };
    Descripcion = { type: 'text' };
    Estado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
    Relational_Detalle_Lotes = { type: 'MasterDetail', ModelObject: () => new Relational_Detalle_Lotes() };
}
export { Catalogo_Tipo_Detalle_Lote }
class Catalogo_Tipo_Transaccion extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Tipo_Transaccion = { type: 'number', primary: true };
    Descripcion = { type: 'text' };
    Estado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
}
export { Catalogo_Tipo_Transaccion }
class Detail_Factura extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Detalle_Factura = { type: 'number', primary: true };
    Cantidad = { type: 'number' };
    Precio_Venta = { type: 'number' };   
    Total = { type: 'number' };
    Catalogo_Oferta_Especial = { type: 'WSELECT', ModelObject: () => new Catalogo_Oferta_Especial() };
    Catalogo_Producto = { type: 'WSELECT', ModelObject: () => new Catalogo_Producto() };
   // Detail_Transaccion_Lote = { type: 'WSELECT', ModelObject: () => new Detail_Transaccion_Lote() };
}
export { Detail_Factura }
class Relational_Caracteristicas_Productos extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Descripcion = { type: 'text' };
    Catalogo_Caracteristicas = { type: 'WSELECT', ModelObject: () => new Catalogo_Caracteristicas() };
    Catalogo_Producto = { type: 'WSELECT', ModelObject: () => new Catalogo_Producto() };
}
export { Relational_Caracteristicas_Productos }
class Relational_Detalle_Lotes extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Detalle = { type: 'number', primary: true };
    Descripcion = { type: 'text' };
    Estado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
    Catalogo_Tipo_Detalle_Lote = { type: 'WSELECT', ModelObject: () => new Catalogo_Tipo_Detalle_Lote() };
    Transaction_Lotes = { type: 'Model', ModelObject: () => new Transaction_Lotes() };
}
export { Relational_Detalle_Lotes }
class Relational_Equivalencias_Presentacion extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Valor_Presentacion_Inicial = { type: 'number' };
    Valor_Presentacion_Final = { type: 'number' };
    Catalogo_Presentacion_Id_Presentacion_Inicial = { type: 'WSELECT', ModelObject: () => new Catalogo_Presentacion() };
    Catalogo_Presentacion_Id_Presentacion_Final = { type: 'WSELECT', ModelObject: () => new Catalogo_Presentacion() };
}
export { Relational_Equivalencias_Presentacion }
class Transaction_Factura extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Factura = { type: 'number', primary: true };
    Nombre_Cliente = { type: 'text' };
    Fecha = { type: 'date' };
    SubTotal = { type: 'number' };
    IVA = { type: 'number' };
    Total = { type: 'number' };
    No_Factura = { type: 'text' };
    Estado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
    Catalogo_Clientes = { type: 'WSELECT', ModelObject: () => new Catalogo_Clientes() };
    Detail_Factura = { type: 'MasterDetail', ModelObject: () => new Detail_Factura() };
}
export { Transaction_Factura }
class Transaction_Lotes extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Lote = { type: 'number', primary: true };
    Cantidad = { type: 'number' };
    Cantidad_Inicial = { type: 'number' };
    Cantidad_Existente = { type: 'number' };
    Costo = { type: 'number' };
    Estado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
    Catalogo_Almacen = { type: 'WSELECT', ModelObject: () => new Catalogo_Almacen() };
    Catalogo_Presentacion = { type: 'WSELECT', ModelObject: () => new Catalogo_Presentacion() };
    Catalogo_Producto = { type: 'WSELECT', ModelObject: () => new Catalogo_Producto() };
    //Detail_Movimiento_Id_Original = { type: 'MasterDetail', ModelObject: () => new Detail_Movimiento() };
    //Detail_Movimiento_Id_Resultante = { type: 'MasterDetail', ModelObject: () => new Detail_Movimiento() };
    //Detail_Transaccion_Lote = { type: 'MasterDetail', ModelObject: () => new Detail_Transaccion_Lote() };
    Relational_Detalle_Lotes = { type: 'MasterDetail', ModelObject: () => new Relational_Detalle_Lotes() };
}
export { Transaction_Lotes }

class Catalogo_Proveedores extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Proveedor = { type: 'number', primary: true };
    Descripcion = { type: 'text' };
    No_Contacto = { type: 'text' };
    Email = { type: 'text' };
}
export { Catalogo_Proveedores }
class Datos_Compra extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    No_Factura = { type: 'text' };
    //Transaction_Transacciones_Lotes = { type: 'Model', ModelObject: () => new Transaction_Transacciones_Lotes() };
    Catalogo_Proveedores = { type: 'WSELECT', ModelObject: () => new Catalogo_Proveedores() };
}
export { Datos_Compra }

class Transaction_Transacciones_Lotes extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Transaccion = { type: 'number', primary: true };
    Descripcion = { type: 'text' };
    Id_Usuario_Gestor = { type: 'number' };
    Fecha = { type: 'date' };
    Estado = { type: 'Select', Dataset: ["ACTIVO", "INACTIVO"] };
    Catalogo_Tipo_Transaccion = {
        type: 'WSELECT', ModelObject: () => new Catalogo_Tipo_Transaccion(),
        action: (/**@type { Transaction_Transacciones_Lotes}*/EditObject, /**@type {WForm}*/ form) => {           
            //console.log(EditObject.Catalogo_Tipo_Transaccion);
        }
    };
    Datos_Compra = { type: 'Model', ModelObject: () => new Datos_Compra(), hidden: true };
    Detail_Transaccion_Lote = { type: 'MasterDetail', ModelObject:  new Detail_Transaccion_Lote() };
}
export { Transaction_Transacciones_Lotes }
class Transaction_Movimiento extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Movimiento = { type: 'number', primary: true };
    Motivo = { type: 'text' };
    Fecha = { type: 'date' };
    Detail_Movimiento = { type: 'MasterDetail', ModelObject: () => new Detail_Movimiento() };
}
export { Transaction_Movimiento }
class Detail_Movimiento extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Detalle_Movimiento = { type: 'number', primary: true };
    Cantidad_Afectada = { type: 'number', hidden: false};
    Transaction_Lotes_Id_Original = { type: 'WSelect', ModelObject: () => new Transaction_Lotes() };
  //  Transaction_Lotes_Id_Resultante = { type: 'Model', ModelObject: () => new Transaction_Lotes() };

}
export { Detail_Movimiento }
class Catalogo_Sucursales extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Id_Sucursal = { type: 'number', primary: true };
    Nombre = { type: 'text' };
    Descripcion = { type: 'text' };
    Direccion = { type: 'text' };
}
export { Catalogo_Sucursales }
class Datos_Configuracion extends EntityClass {
    constructor(props) {
        super(props, 'EntityDBO');
        for (const prop in props) {
            this[prop] = props[prop];
        }
    }
    Encabezado = { type: 'text' };
    AutoDebito = { type: 'checkbox' };
    Catalogo_Sucursales = { type: 'WSELECT', ModelObject: () => new Catalogo_Sucursales() };
}
export { Datos_Configuracion }