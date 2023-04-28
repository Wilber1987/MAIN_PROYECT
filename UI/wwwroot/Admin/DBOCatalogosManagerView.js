//@ts-check
import { WRender, ComponentsManager, WAjaxTools } from "../WDevCore/WModules/WComponentsTools.js";
import { WOrtograficValidation } from "../WDevCore/WModules/WOrtograficValidation.js";
import { StylesControlsV2, StyleScrolls } from "../WDevCore/StyleModules/WStyleComponents.js"
import { WTableComponent } from "../WDevCore/WComponents/WTableComponent.js"
import { WFilterOptions } from '../WDevCore/WComponents/WFilterControls.js';
import { WAppNavigator } from "../WDevCore/WComponents/WAppNavigator.js"
import { Catalogo_Almacen, Catalogo_Caracteristicas, Catalogo_Categorias, Catalogo_Clientes, Catalogo_Oferta_Especial, Catalogo_Presentacion, Catalogo_Producto, Catalogo_Proveedores, Catalogo_Tipo_Detalle_Lote, Catalogo_Tipo_Transaccion } from "../FrontModel/DBODataBaseModel.js"
import { EntityClass } from "../WDevCore/WModules/EntityClass.js";
class DBOCatalogosManagerView extends HTMLElement {
    constructor() {
        super();
        this.TabContainer = WRender.createElement({ type: 'div', props: { class: 'TabContainer', id: 'TabContainer' } })
        this.TabManager = new ComponentsManager({ MainContainer: this.TabContainer });
        this.append(
            StylesControlsV2.cloneNode(true),
            StyleScrolls.cloneNode(true),
            this.MainNav,
            this.TabContainer
        );
    }
    /** @param {EntityClass} Model*/
    NavigateFunction = async (Model) => {
        const data = await Model.Get();
        const mainComponent = new WTableComponent({
            ModelObject: Model, 
            Dataset: data, 
            AutoSave: true,
            Options: {
                Add: true,
                Edit: true,
                Search: true
            }
        })
        
        const filterOptions = new WFilterOptions({
            Dataset: data,
            ModelObject: Model,
            FilterFunction: (DFilt) => {
                mainComponent.DrawTable(DFilt);
            }
        });
        WRender.SetStyle(filterOptions, {marginBottom: "20px", display: "block"})
        this.TabManager.NavigateFunction( Model.constructor.name ,  WRender.Create({ className: "catalogo-container", children: [filterOptions, mainComponent] }));
    }
    MainNav = new WAppNavigator({
        Elements: [
            {
                name: WOrtograficValidation.es('Catalogo_Almacen'), action: async () => {
                    this.NavigateFunction(new Catalogo_Almacen())
                }
            },
            {
                name: WOrtograficValidation.es('Catalogo_Caracteristicas'), action: async () => {
                    this.NavigateFunction(new Catalogo_Caracteristicas())
                }
            },
            {
                name: WOrtograficValidation.es('Catalogo_Categorias'), action: async () => {
                    this.NavigateFunction(new Catalogo_Categorias())
                }
            },
            {
                name: WOrtograficValidation.es('Catalogo_Clientes'), action: async () => {
                    this.NavigateFunction(new Catalogo_Clientes())
                }
            },
            {
                name: WOrtograficValidation.es('Catalogo_Oferta_Especial'), action: async () => {
                    this.NavigateFunction(new Catalogo_Oferta_Especial())
                }
            },
            {
                name: WOrtograficValidation.es('Catalogo_Presentacion'), action: async () => {
                    this.NavigateFunction(new Catalogo_Presentacion())
                }
            },
            {
                name: WOrtograficValidation.es('Catalogo_Producto'), action: async () => {
                    this.NavigateFunction(new Catalogo_Producto())
                }
            },
            {
                name: WOrtograficValidation.es('Catalogo_Tipo_Detalle_Lote'), action: async () => {
                    this.NavigateFunction(new Catalogo_Tipo_Detalle_Lote())
                }
            },
            {
                name: WOrtograficValidation.es('Catalogo_Tipo_Transaccion'), action: async () => {
                    this.NavigateFunction(new Catalogo_Tipo_Transaccion())
                }
            }, {
                name: WOrtograficValidation.es('Catalogo_Proveedores'), action: async () => {
                    this.NavigateFunction(new Catalogo_Proveedores())
                }
            }
        ]
    });
}
customElements.define('w-catalogos_manager', DBOCatalogosManagerView);
export { DBOCatalogosManagerView }