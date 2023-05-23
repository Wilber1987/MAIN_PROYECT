//@ts-check
import { WRender, ComponentsManager, WAjaxTools } from "../WDevCore/WModules/WComponentsTools.js";
import { StylesControlsV2, StylesControlsV3, StyleScrolls } from "../WDevCore/StyleModules/WStyleComponents.js"
import { WTableComponent } from "../WDevCore/WComponents/WTableComponent.js"
import { Catalogo_Tipo_Transaccion, Detail_Transaccion_Lote, Transaction_Lotes, Transaction_Transacciones_Lotes } from "../FrontModel/DBODataBaseModel.js"
import { WFilterOptions } from "../WDevCore/WComponents/WFilterControls.js";
import { WModalForm } from "../WDevCore/WComponents/WModalForm.js";
import { WForm } from "../WDevCore/WComponents/WForm.js";
class Transaction_Transacciones_LotesView extends HTMLElement {
    constructor(props) {
        super();
        this.Draw();
    }
    Draw = async () => {
        const model = new Transaction_Transacciones_Lotes();
        const dataset = await model.Get();
        
        this.OptionContainer = WRender.Create({ className: "OptionContainer" });
        this.TabContainer = WRender.createElement({ type: 'div', props: { class: 'TabContainer', id: 'TabContainer' } })
        this.Manager = new ComponentsManager({MainContainer: this.TabContainer}); 
        this.MainComponent = new WTableComponent({
            ModelObject: model, Dataset: dataset, Options: {
                //Add: false, UrlAdd: "../api/ApiEntityDBO/saveTransaction_Transacciones_Lotes",
                //Edit: true, UrlUpdate: "../api/ApiEntityDBO/updateTransaction_Transacciones_Lotes",
                Search: true, UrlSearch: "../api/ApiEntityDBO/getTransaction_Transacciones_Lotes"
            }
        })
        this.FilterOptions = new WFilterOptions({
            Dataset: dataset,
            ModelObject: model,
            FilterFunction: (DFilt) => {
                this.MainComponent.DrawTable(DFilt);
            }
        });
        this.TipoTransacciones = await new Catalogo_Tipo_Transaccion().Get();
        this.ModelObject = new Transaction_Transacciones_Lotes({
            Catalogo_Tipo_Transaccion: {
                type: 'WSELECT', ModelObject: new Catalogo_Tipo_Transaccion(), Dataset: []

            }
        });
        this.OptionContainer.append(WRender.Create({
            tagName: 'button', className: 'Block-Basic', innerText: 'Ingreso por compra',
            onclick: () => this.NewTransaction(this.CompraModel())
        }))
        this.OptionContainer.append(WRender.Create({
            tagName: 'button', className: 'Block-Alert', innerText: 'Egreso por baja',
            onclick: () => this.NewTransaction(new Catalogo_Tipo_Transaccion())
        }))
        this.OptionContainer.append(WRender.Create({
            tagName: 'button', className: 'Block-Success', innerText: 'Egreso por Venta',
            onclick: () => this.NewTransaction(this.VentaModel())
        }))

        this.OptionContainer.append(WRender.Create({
            tagName: 'button', className: 'Block-Success', innerText: 'Datos',
            onclick: () => { this.Manager?.NavigateFunction("tabla", this.MainComponent) }
        }))

       // this.TabContainer.append(this.MainComponent)
       this.Manager.NavigateFunction("tabla", this.MainComponent)

        this.append(
            StylesControlsV2.cloneNode(true),
            StyleScrolls.cloneNode(true),
            StylesControlsV3.cloneNode(true),
            this.FilterOptions,
            this.OptionContainer,
            this.TabContainer
        );

    }
    NewTransaction(Model) {

        this.Manager?.NavigateFunction(Model.constructor.name, new WForm({ModelObject: Model, AutoSave : true, ObjectOptions: {SaveFunction: (NewObject)=>{
            this.MainComponent?.Dataset.unshift(NewObject);
            this.MainComponent?.DrawTable();
        }}}))
    }
    ModelObject = new Transaction_Transacciones_Lotes();
    CompraModel = () => {
        this.ModelObject.Datos_Compra.hidden = false;
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Transaction_Lotes.type = "MODEL";
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Cantidad_Afectada.hidden = true;
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Detail_Factura.hidden = true;        
        this.ModelObject.Catalogo_Tipo_Transaccion.Dataset =
            this.TipoTransacciones?.filter(x => x.Descripcion.toUpperCase() == "COMPRA");
        return this.ModelObject;
    }
    BajaModel = () => {
        this.ModelObject.Datos_Compra.hidden = true;
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Transaction_Lotes.type = "WSELECT";
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Transaction_Lotes.ModelObject = ()=> new Transaction_Lotes();
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Cantidad_Afectada.hidden = false;
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Detail_Factura.hidden = true;
        this.ModelObject.Catalogo_Tipo_Transaccion.Dataset =
            this.TipoTransacciones?.filter(x => x.Descripcion.toUpperCase() == "BAJA");
        return this.ModelObject;
    }
    VentaModel = () => {
        this.ModelObject.Datos_Compra.hidden = true;
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Transaction_Lotes.type = "WSELECT";
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Transaction_Lotes.ModelObject = ()=> new Transaction_Lotes();
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Detail_Factura.hidden = false;
        this.ModelObject.Detail_Transaccion_Lote.ModelObject.Cantidad_Afectada.hidden = false;
        this.ModelObject.Catalogo_Tipo_Transaccion.Dataset =
            this.TipoTransacciones?.filter(x => x.Descripcion.toUpperCase() == "VENTA");
        return this.ModelObject;
    }
}
customElements.define('w-transaction_transacciones_lotes', Transaction_Transacciones_LotesView);
window.addEventListener('load', async () => { MainBody.append(new Transaction_Transacciones_LotesView()) })


form.DrawComponent();