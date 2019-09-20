!function(){var a={},b=function(b){for(var c=a[b],e=c.deps,f=c.defn,g=e.length,h=new Array(g),i=0;i<g;++i)h[i]=d(e[i]);var j=f.apply(null,h);if(void 0===j)throw"module ["+b+"] returned undefined";c.instance=j},c=function(b,c,d){if("string"!=typeof b)throw"module id must be a string";if(void 0===c)throw"no dependencies for "+b;if(void 0===d)throw"no definition function for "+b;a[b]={deps:c,defn:d,instance:void 0}},d=function(c){var d=a[c];if(void 0===d)throw"module ["+c+"] was undefined";return void 0===d.instance&&b(c),d.instance},e=function(a,b){for(var c=a.length,e=new Array(c),f=0;f<c;++f)e.push(d(a[f]));b.apply(null,b)},f={};f.bolt={module:{api:{define:c,require:e,demand:d}}};var g=c,h=function(a,b){g(a,[],function(){return b})};h("1",tinymce.Env),h("2",tinymce.EditorManager),h("3",tinymce.ThemeManager),h("8",tinymce.util.Tools),h("9",tinymce.ui.Factory),h("a",tinymce.DOM),g("b",["8","9"],function(a,b){var c="undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",d=function(c,d,e){var f,g=[];if(d)return a.each(d.split(/[ ,]/),function(a){var d,h=function(){var b=c.selection;a.settings.stateSelector&&b.selectorChanged(a.settings.stateSelector,function(b){a.active(b)},!0),a.settings.disabledStateSelector&&b.selectorChanged(a.settings.disabledStateSelector,function(b){a.disabled(b)})};"|"==a?f=null:b.has(a)?(a={type:a,size:e},g.push(a),f=null):(f||(f={type:"buttongroup",items:[]},g.push(f)),c.buttons[a]&&(d=a,a=c.buttons[d],"function"==typeof a&&(a=a()),a.type=a.type||"button",a.size=e,a=b.create(a),f.items.push(a),c.initialized?h():c.on("init",h)))}),{type:"toolbar",layout:"flow",items:g}},e=function(b,e){var f=[],g=b.settings,h=function(a){if(a)return f.push(d(b,a,e)),!0};if(a.isArray(g.toolbar)){if(0===g.toolbar.length)return;a.each(g.toolbar,function(a,b){g["toolbar"+(b+1)]=a}),delete g.toolbar}for(var i=1;i<10&&h(g["toolbar"+i]);i++);if(f.length||g.toolbar===!1||h(g.toolbar||c),f.length)return{type:"panel",layout:"stack",classes:"toolbar-grp",ariaRoot:!0,ariaRemember:!0,items:f}};return{createToolbar:d,createToolbars:e}}),g("c",["8"],function(a){var b={file:{title:"File",items:"newdocument"},edit:{title:"Edit",items:"undo redo | cut copy paste pastetext | selectall"},insert:{title:"Insert",items:"|"},view:{title:"View",items:"visualaid |"},format:{title:"Format",items:"bold italic underline strikethrough superscript subscript | formats | removeformat"},table:{title:"Table"},tools:{title:"Tools"}},c=function(a,b){var c;return"|"==b?{text:"|"}:c=a[b]},d=function(d,e,f){var g,h,i,j,k;if(k=a.makeMap((e.removed_menuitems||"").split(/[ ,]/)),e.menu?(h=e.menu[f],j=!0):h=b[f],h){g={text:h.title},i=[],a.each((h.items||"").split(/[ ,]/),function(a){var b=c(d,a);b&&!k[a]&&i.push(c(d,a))}),j||a.each(d,function(a){a.context==f&&("before"==a.separator&&i.push({text:"|"}),a.prependToContext?i.unshift(a):i.push(a),"after"==a.separator&&i.push({text:"|"}))});for(var l=0;l<i.length;l++)"|"==i[l].text&&(0!==l&&l!=i.length-1||i.splice(l,1));if(g.menu=i,!g.menu.length)return null}return g},e=function(a){var c,e=[],f=a.settings,g=[];if(f.menu)for(c in f.menu)g.push(c);else for(c in b)g.push(c);for(var h="string"==typeof f.menubar?f.menubar.split(/[ ,]/):g,i=0;i<h.length;i++){var j=h[i];j=d(a.menuItems,a.settings,j),j&&e.push(j)}return e};return{createMenuButtons:e}}),h("j",tinymce.util.Delay),h("k",tinymce.geom.Rect),g("d",["a","8","j","b","9","k"],function(a,b,c,d,e,f){var g=function(a){return{left:a.x,top:a.y,width:a.w,height:a.h,right:a.x+a.w,bottom:a.y+a.h}},h=function(a){b.each(a.contextToolbars,function(a){a.panel&&a.panel.hide()})},i=function(a,b){a.moveTo(b.left,b.top)},j=function(a,c,d){c=c?c.substr(0,2):"",b.each({t:"down",b:"up"},function(b,e){a.classes.toggle("arrow-"+b,d(e,c.substr(0,1)))}),b.each({l:"left",r:"right"},function(b,e){a.classes.toggle("arrow-"+b,d(e,c.substr(1,1)))})},k=function(a,b,c,d,e,f){return f=g({x:b,y:c,w:f.w,h:f.h}),a&&(f=a({elementRect:g(d),contentAreaRect:g(e),panelRect:f})),f},l=function(g){var l,m=g.settings,n=function(){return g.contextToolbars||[]},o=function(b){var c,d,e;return c=a.getPos(g.getContentAreaContainer()),d=g.dom.getRect(b),e=g.dom.getRoot(),"BODY"===e.nodeName&&(d.x-=e.ownerDocument.documentElement.scrollLeft||e.scrollLeft,d.y-=e.ownerDocument.documentElement.scrollTop||e.scrollTop),d.x+=c.x,d.y+=c.y,d},p=function(b,c){var d,e,l,n,p,q,r,s,t=m.inline_toolbar_position_handler;if(!g.removed){if(!b||!b.toolbar.panel)return void h(g);r=["bc-tc","tc-bc","tl-bl","bl-tl","tr-br","br-tr"],p=b.toolbar.panel,c&&p.show(),l=o(b.element),e=a.getRect(p.getEl()),n=a.getRect(g.getContentAreaContainer()||g.getBody()),s=25,"inline"!==a.getStyle(b.element,"display",!0)&&(l.w=b.element.clientWidth,l.h=b.element.clientHeight),g.inline||(n.w=g.getDoc().documentElement.offsetWidth),g.selection.controlSelection.isResizable(b.element)&&l.w<s&&(l=f.inflate(l,0,8)),d=f.findBestRelativePosition(e,l,n,r),l=f.clamp(l,n),d?(q=f.relativePosition(e,l,d),i(p,k(t,q.x,q.y,l,n,e))):(n.h+=e.h,l=f.intersect(n,l),l?(d=f.findBestRelativePosition(e,l,n,["bc-tc","bl-tl","br-tr"]),d?(q=f.relativePosition(e,l,d),i(p,k(t,q.x,q.y,l,n,e))):i(p,k(t,l.x,l.y,l,n,e))):p.hide()),j(p,d,function(a,b){return a===b})}},q=function(a){return function(){var b=function(){g.selection&&p(u(g.selection.getNode()),a)};c.requestAnimationFrame(b)}},r=function(){l||(l=g.selection.getScrollContainer()||g.getWin(),a.bind(l,"scroll",q(!0)),g.on("remove",function(){a.unbind(l,"scroll")}))},s=function(a){var b;return a.toolbar.panel?(a.toolbar.panel.show(),void p(a)):(r(),b=e.create({type:"floatpanel",role:"dialog",classes:"tinymce tinymce-inline arrow",ariaLabel:"Inline toolbar",layout:"flex",direction:"column",align:"stretch",autohide:!1,autofix:!0,fixed:!0,border:1,items:d.createToolbar(g,a.toolbar.items),oncancel:function(){g.focus()}}),a.toolbar.panel=b,b.renderTo(document.body).reflow(),void p(a))},t=function(){b.each(n(),function(a){a.panel&&a.panel.hide()})},u=function(a){var b,c,d,e=n();for(d=g.$(a).parents().add(a),b=d.length-1;b>=0;b--)for(c=e.length-1;c>=0;c--)if(e[c].predicate(d[b]))return{toolbar:e[c],element:d[b]};return null};g.on("click keyup setContent ObjectResized",function(a){("setcontent"!==a.type||a.selection)&&c.setEditorTimeout(g,function(){var a;a=u(g.selection.getNode()),a?(t(),s(a)):t()})}),g.on("blur hide contextmenu",t),g.on("ObjectResizeStart",function(){var a=u(g.selection.getNode());a&&a.toolbar.panel&&a.toolbar.panel.hide()}),g.on("ResizeEditor ResizeWindow",q(!0)),g.on("nodeChange",q(!1)),g.on("remove",function(){b.each(n(),function(a){a.panel&&a.panel.remove()}),g.contextToolbars={}}),g.shortcuts.add("ctrl+shift+e > ctrl+shift+p","",function(){var a=u(g.selection.getNode());a&&a.toolbar.panel&&a.toolbar.panel.items()[0].focus()})};return{addContextualToolbars:l}}),g("e",[],function(){var a=function(a,b){return function(){var c=a.find(b)[0];c&&c.focus(!0)}},b=function(b,c){b.shortcuts.add("Alt+F9","",a(c,"menubar")),b.shortcuts.add("Alt+F10,F10","",a(c,"toolbar")),b.shortcuts.add("Alt+F11","",a(c,"elementpath")),c.on("cancel",function(){b.focus()})};return{addKeys:b}}),g("f",["8","9","1"],function(a,b,c){var d=function(a){return{element:function(){return a}}},e=function(a,b,c){var e=a.settings[c];e&&e(d(b.getEl("body")))},f=function(b,c,d){a.each(d,function(a){var d=c.items().filter("#"+a.name)[0];d&&d.visible()&&a.name!==b&&(e(a,d,"onhide"),d.visible(!1))})},g=function(a){a.items().each(function(a){a.active(!1)})},h=function(b,c){return a.grep(b,function(a){return a.name===c})[0]},i=function(a,c,d){return function(i){var j=i.control,k=j.parents().filter("panel")[0],l=k.find("#"+c)[0],m=h(d,c);f(c,k,d),g(j.parent()),l&&l.visible()?(e(m,l,"onhide"),l.hide(),j.active(!1)):(l?(l.show(),e(m,l,"onshow")):(l=b.create({type:"container",name:c,layout:"stack",classes:"sidebar-panel",html:""}),k.prepend(l),e(m,l,"onrender"),e(m,l,"onshow")),j.active(!0)),a.fire("ResizeEditor")}},j=function(){return!c.ie||c.ie>=11},k=function(a){return!(!j()||!a.sidebars)&&a.sidebars.length>0},l=function(b){var c=a.map(b.sidebars,function(a){var c=a.settings;return{type:"button",icon:c.icon,image:c.image,tooltip:c.tooltip,onclick:i(b,a.name,b.sidebars)}});return{type:"panel",name:"sidebar",layout:"stack",classes:"sidebar",items:[{type:"toolbar",layout:"stack",classes:"sidebar-toolbar",items:c}]}};return{hasSidebar:k,createSidebar:l}}),g("g",[],function(){var a=function(a){return function(){a.initialized?a.fire("SkinLoaded"):a.on("init",function(){a.fire("SkinLoaded")})}};return{fireSkinLoaded:a}}),g("6",["a"],function(a){var b=function(a){return{width:a.clientWidth,height:a.clientHeight}},c=function(c,d,e){var f,g,h,i,j=c.settings;f=c.getContainer(),g=c.getContentAreaContainer().firstChild,h=b(f),i=b(g),null!==d&&(d=Math.max(j.min_width||100,d),d=Math.min(j.max_width||65535,d),a.setStyle(f,"width",d+(h.width-i.width)),a.setStyle(g,"width",d)),e=Math.max(j.min_height||100,e),e=Math.min(j.max_height||65535,e),a.setStyle(g,"height",e),c.fire("ResizeEditor")},d=function(a,b,d){var e=a.getContentAreaContainer();c(a,e.clientWidth+b,e.clientHeight+d)};return{resizeTo:c,resizeBy:d}}),g("4",["8","9","a","b","c","d","e","f","g","6"],function(a,b,c,d,e,f,g,h,i,j){var k=function(a){return function(b){a.find("*").disabled("readonly"===b.mode)}},l=function(a){return{type:"panel",name:"iframe",layout:"stack",classes:"edit-area",border:a,html:""}},m=function(a){return{type:"panel",layout:"stack",classes:"edit-aria-container",border:"1 0 0 0",items:[l("0"),h.createSidebar(a)]}},n=function(a,n,o){var p,q,r,s=a.settings;return o.skinUiCss&&c.styleSheetLoader.load(o.skinUiCss,i.fireSkinLoaded(a)),p=n.panel=b.create({type:"panel",role:"application",classes:"tinymce",style:"visibility: hidden",layout:"stack",border:1,items:[s.menubar===!1?null:{type:"menubar",border:"0 0 1 0",items:e.createMenuButtons(a)},d.createToolbars(a,s.toolbar_items_size),h.hasSidebar(a)?m(a):l("1 0 0 0")]}),s.resize!==!1&&(q={type:"resizehandle",direction:s.resize,onResizeStart:function(){var b=a.getContentAreaContainer().firstChild;r={width:b.clientWidth,height:b.clientHeight}},onResize:function(b){"both"===s.resize?j.resizeTo(a,r.width+b.deltaX,r.height+b.deltaY):j.resizeTo(a,null,r.height+b.deltaY)}}),s.statusbar!==!1&&p.add({type:"panel",name:"statusbar",classes:"statusbar",layout:"flow",border:"1 0 0 0",ariaRoot:!0,items:[{type:"elementpath",editor:a},q]}),a.fire("BeforeRenderUI"),a.on("SwitchMode",k(p)),p.renderBefore(o.targetNode).reflow(),s.readonly&&a.setMode("readonly"),s.width&&c.setStyle(p.getEl(),"width",s.width),a.on("remove",function(){p.remove(),p=null}),g.addKeys(a,p),f.addContextualToolbars(a),{iframeContainer:p.find("#iframe")[0].getEl(),editorContainer:p.getEl()}};return{render:n}}),h("h",tinymce.ui.FloatPanel),g("5",["8","9","a","h","b","c","d","e","g"],function(a,b,c,d,e,f,g,h,i){var j=function(a,j,k){var l,m,n=a.settings;n.fixed_toolbar_container&&(m=c.select(n.fixed_toolbar_container)[0]);var o=function(){if(l&&l.moveRel&&l.visible()&&!l._fixed){var b=a.selection.getScrollContainer(),d=a.getBody(),e=0,f=0;if(b){var g=c.getPos(d),h=c.getPos(b);e=Math.max(0,h.x-g.x),f=Math.max(0,h.y-g.y)}l.fixed(!1).moveRel(d,a.rtl?["tr-br","br-tr"]:["tl-bl","bl-tl","tr-br"]).moveBy(e,f)}},p=function(){l&&(l.show(),o(),c.addClass(a.getBody(),"mce-edit-focus"))},q=function(){l&&(l.hide(),d.hideAll(),c.removeClass(a.getBody(),"mce-edit-focus"))},r=function(){return l?void(l.visible()||p()):(l=j.panel=b.create({type:m?"panel":"floatpanel",role:"application",classes:"tinymce tinymce-inline",layout:"flex",direction:"column",align:"stretch",autohide:!1,autofix:!0,fixed:!!m,border:1,items:[n.menubar===!1?null:{type:"menubar",border:"0 0 1 0",items:f.createMenuButtons(a)},e.createToolbars(a,n.toolbar_items_size)]}),a.fire("BeforeRenderUI"),l.renderTo(m||document.body).reflow(),h.addKeys(a,l),p(),g.addContextualToolbars(a),a.on("nodeChange",o),a.on("activate",p),a.on("deactivate",q),void a.nodeChanged())};return n.content_editable=!0,a.on("focus",function(){k.skinUiCss?c.styleSheetLoader.load(k.skinUiCss,r,r):r()}),a.on("blur hide",q),a.on("remove",function(){l&&(l.remove(),l=null)}),k.skinUiCss&&c.styleSheetLoader.load(k.skinUiCss,i.fireSkinLoaded(a)),{}};return{render:j}}),h("i",tinymce.ui.Throbber),g("7",["i"],function(a){var b=function(b,c){var d;b.on("ProgressState",function(b){d=d||new a(c.panel.getEl("body")),b.state?d.show(b.time):d.hide()})};return{setup:b}}),g("0",["1","2","3","4","5","6","7"],function(a,b,c,d,e,f,g){var h=function(c,f,h){var i=c.settings,j=i.skin!==!1&&(i.skin||"lightgray");if(j){var k=i.skin_url;k=k?c.documentBaseURI.toAbsolute(k):b.baseURL+"/skins/"+j,a.documentMode<=7?h.skinUiCss=k+"/skin.ie7.min.css":h.skinUiCss=k+"/skin.min.css",c.contentCSS.push(k+"/content"+(c.inline?".inline":"")+".min.css")}return g.setup(c,f),i.inline?e.render(c,f,h):d.render(c,f,h)};return c.add("modern",function(a){return{renderUI:function(b){return h(a,this,b)},resizeTo:function(b,c){return f.resizeTo(a,b,c)},resizeBy:function(b,c){return f.resizeBy(a,b,c)}}}),function(){}}),d("0")()}();