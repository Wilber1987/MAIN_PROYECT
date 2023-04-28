import { WRender, ComponentsManager, WAjaxTools } from "../WDevCore/WModules/WComponentsTools.js";
import { StylesControlsV2, StyleScrolls } from "../WDevCore/StyleModules/WStyleComponents.js"
import { WTableComponent } from "../WDevCore/WComponents/WTableComponent.js"
import { Datos_Configuracion } from "../FrontModel/DBODataBaseModel.js"
class Datos_ConfiguracionView extends HTMLElement {
   constructor(props) {
       super();
       this.TabContainer = WRender.createElement({ type: 'div', props: { class: 'TabContainer', id: 'TabContainer' } })
       this.MainComponent = new WTableComponent({ ModelObject: new Datos_Configuracion(), Dataset: [], Options: {
           Add: true, UrlAdd: "../api/ApiEntityDBO/saveDatos_Configuracion",
           Edit: true, UrlUpdate: "../api/ApiEntityDBO/updateDatos_Configuracion",
           Search: true, UrlSearch: "../api/ApiEntityDBO/getDatos_Configuracion"
       }})
       this.TabContainer.append(this.MainComponent)
       this.append(
           StylesControlsV2.cloneNode(true),
           StyleScrolls.cloneNode(true),
           this.TabContainer
       );
   }
}
customElements.define('w-datos_configuracion', Datos_ConfiguracionView );
window.addEventListener('load', async () => {  MainBody.append(new Datos_ConfiguracionView())  })
