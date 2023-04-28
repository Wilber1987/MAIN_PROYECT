import { WRender, ComponentsManager, WAjaxTools } from "../WDevCore/WModules/WComponentsTools.js";
import { StylesControlsV2, StyleScrolls } from "../WDevCore/StyleModules/WStyleComponents.js"
import { WTableComponent } from "../WDevCore/WComponents/WTableComponent.js"
import { Transaction_Movimineto } from "../FrontModel/DBODataBaseModel.js"
class Transaction_MoviminetoView extends HTMLElement {
   constructor(props) {
       super();
       this.TabContainer = WRender.createElement({ type: 'div', props: { class: 'TabContainer', id: 'TabContainer' } })
       this.MainComponent = new WTableComponent({ ModelObject: new Transaction_Movimineto(), Dataset: [], Options: {
           Add: true, UrlAdd: "../api/ApiEntityDBO/saveTransaction_Movimineto",
           //Edit: true, UrlUpdate: "../api/ApiEntityDBO/updateTransaction_Movimineto",
           Search: true, UrlSearch: "../api/ApiEntityDBO/getTransaction_Movimineto"
       }})
       this.TabContainer.append(this.MainComponent)
       this.append(
           StylesControlsV2.cloneNode(true),
           StyleScrolls.cloneNode(true),
           this.TabContainer
       );
   }
}
customElements.define('w-transaction_movimineto', Transaction_MoviminetoView );
window.addEventListener('load', async () => {  MainBody.append(new Transaction_MoviminetoView())  })
