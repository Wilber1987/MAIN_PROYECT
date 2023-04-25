import { WRender, ComponentsManager, WAjaxTools } from "../WDevCore/WModules/WComponentsTools.js";
import { StylesControlsV2, StyleScrolls } from "../WDevCore/StyleModules/WStyleComponents.js"
import { WTableComponent } from "../WDevCore/WComponents/WTableComponent.js"
import { Security_Users_Roles } from "../FrontModel/SECURITYDataBaseModel.js"
class Security_Users_RolesView extends HTMLElement {
   constructor(props) {
       super();
       this.TabContainer = WRender.createElement({ type: 'div', props: { class: 'TabContainer', id: 'TabContainer' } })
       this.MainComponent = new WTableComponent({ ModelObject: new Security_Users_Roles(), Dataset: [], Options: {
           Add: true, UrlAdd: "../api/ApiEntitySECURITY/saveSecurity_Users_Roles",
           Edit: true, UrlUpdate: "../api/ApiEntitySECURITY/updateSecurity_Users_Roles",
           Search: true, UrlSearch: "../api/ApiEntitySECURITY/getSecurity_Users_Roles"
       }})
       this.TabContainer.append(this.MainComponent)
       this.append(
           StylesControlsV2.cloneNode(true),
           StyleScrolls.cloneNode(true),
           this.TabContainer
       );
   }
}
customElements.define('w-security_users_roles', Security_Users_RolesView );
window.addEventListener('load', async () => {  MainBody.append(new Security_Users_RolesView())  })