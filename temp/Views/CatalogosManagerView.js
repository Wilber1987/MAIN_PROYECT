import { WRender, ComponentsManager, WAjaxTools } from "../WDevCore/WModules/WComponentsTools.js";
import { StylesControlsV2, StyleScrolls } from "../WDevCore/StyleModules/WStyleComponents.js"
import { WTableComponent } from "../WDevCore/WComponents/WTableComponent.js"
import { WAppNavigator } from "../WDevCore/WComponents/WAppNavigator.js"
import { Security_Permissions,Security_Permissions_Roles,Security_Roles,Security_Users,Security_Users_Roles } from "../FrontModel/SECURITYDataBaseModel.js"
class CatalogosManagerView extends HTMLElement {
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
   /** @param {Object} model*/
   NavigateFunction = (model)=>{
       const mainComponent = new WTableComponent({ ModelObject: model, Dataset: [], Options: {
           Add: true,
           Edit: true,
           Search: true,
           Delete: true
       }})
       this.TabManager.NavigateFunction('+ Model.constructor.name +', mainComponent);
   }
    MainNav = new WAppNavigator({  Elements: [
       { name: WOrtograficValidation.es(Security_Permissions), action : async ()=> {
           this.NavigateFunction(Security_Permissions)
        }},
       { name: WOrtograficValidation.es(Security_Permissions_Roles), action : async ()=> {
           this.NavigateFunction(Security_Permissions_Roles)
        }},
       { name: WOrtograficValidation.es(Security_Roles), action : async ()=> {
           this.NavigateFunction(Security_Roles)
        }},
       { name: WOrtograficValidation.es(Security_Users), action : async ()=> {
           this.NavigateFunction(Security_Users)
        }},
       { name: WOrtograficValidation.es(Security_Users_Roles), action : async ()=> {
           this.NavigateFunction(Security_Users_Roles)
        }},
   ]});
}
customElements.define('w-catalogos_manager', CatalogosManagerView );
window.addEventListener('load', async () => {  MainBody.append(new CatalogosManagerView()) })
