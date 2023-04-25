import { WRender, ComponentsManager, WAjaxTools } from "../WDevCore/WModules/WComponentsTools.js";
import { StylesControlsV2, StyleScrolls } from "../WDevCore/StyleModules/WStyleComponents.js"
import { WTableComponent } from "../WDevCore/WComponents/WTableComponent.js"
import { Datos_Compra } from "../FrontModel/DBODataBaseModel.js"
class Datos_CompraView extends HTMLElement {
   constructor(props) {
       super();
       this.TabContainer = WRender.createElement({ type: 'div', props: { class: 'TabContainer', id: 'TabContainer' } })
       this.MainComponent = new WTableComponent({ ModelObject: new Datos_Compra(), Dataset: [], Options: {
           Add: true, UrlAdd: "../api/ApiEntityDBO/saveDatos_Compra",
           Edit: true, UrlUpdate: "../api/ApiEntityDBO/updateDatos_Compra",
           Search: true, UrlSearch: "../api/ApiEntityDBO/getDatos_Compra"
       }})
       this.TabContainer.append(this.MainComponent)
       this.append(
           StylesControlsV2.cloneNode(true),
           StyleScrolls.cloneNode(true),
           this.TabContainer
       );
   }
}
customElements.define('w-datos_compra', Datos_CompraView );
window.addEventListener('load', async () => {  MainBody.append(new Datos_CompraView())  })
