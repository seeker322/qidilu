webpackJsonp([0],{

/***/ 52:
/***/ (function(module, exports, __webpack_require__) {

var disposed = false
function injectStyle (ssrContext) {
  if (disposed) return
  __webpack_require__(55)
}
var normalizeComponent = __webpack_require__(54)
/* script */
var __vue_script__ = __webpack_require__(59)
/* template */
var __vue_template__ = __webpack_require__(60)
/* template functional */
var __vue_template_functional__ = false
/* styles */
var __vue_styles__ = injectStyle
/* scopeId */
var __vue_scopeId__ = null
/* moduleIdentifier (server only) */
var __vue_module_identifier__ = null
var Component = normalizeComponent(
  __vue_script__,
  __vue_template__,
  __vue_template_functional__,
  __vue_styles__,
  __vue_scopeId__,
  __vue_module_identifier__
)
Component.options.__file = "resources/assets/js/admin/pages/index.vue"

/* hot reload */
if (false) {(function () {
  var hotAPI = require("vue-loader/node_modules/vue-hot-reload-api")
  hotAPI.install(require("vue"), false)
  if (!hotAPI.compatible) return
  module.hot.accept()
  if (!module.hot.data) {
    hotAPI.createRecord("data-v-019494c5", Component.options)
  } else {
    hotAPI.reload("data-v-019494c5", Component.options)
  }
  module.hot.dispose(function (data) {
    disposed = true
  })
})()}

module.exports = Component.exports


/***/ }),

/***/ 54:
/***/ (function(module, exports) {

/* globals __VUE_SSR_CONTEXT__ */

// IMPORTANT: Do NOT use ES2015 features in this file.
// This module is a runtime utility for cleaner component module output and will
// be included in the final webpack user bundle.

module.exports = function normalizeComponent (
  rawScriptExports,
  compiledTemplate,
  functionalTemplate,
  injectStyles,
  scopeId,
  moduleIdentifier /* server only */
) {
  var esModule
  var scriptExports = rawScriptExports = rawScriptExports || {}

  // ES6 modules interop
  var type = typeof rawScriptExports.default
  if (type === 'object' || type === 'function') {
    esModule = rawScriptExports
    scriptExports = rawScriptExports.default
  }

  // Vue.extend constructor export interop
  var options = typeof scriptExports === 'function'
    ? scriptExports.options
    : scriptExports

  // render functions
  if (compiledTemplate) {
    options.render = compiledTemplate.render
    options.staticRenderFns = compiledTemplate.staticRenderFns
    options._compiled = true
  }

  // functional template
  if (functionalTemplate) {
    options.functional = true
  }

  // scopedId
  if (scopeId) {
    options._scopeId = scopeId
  }

  var hook
  if (moduleIdentifier) { // server build
    hook = function (context) {
      // 2.3 injection
      context =
        context || // cached call
        (this.$vnode && this.$vnode.ssrContext) || // stateful
        (this.parent && this.parent.$vnode && this.parent.$vnode.ssrContext) // functional
      // 2.2 with runInNewContext: true
      if (!context && typeof __VUE_SSR_CONTEXT__ !== 'undefined') {
        context = __VUE_SSR_CONTEXT__
      }
      // inject component styles
      if (injectStyles) {
        injectStyles.call(this, context)
      }
      // register component module identifier for async chunk inferrence
      if (context && context._registeredComponents) {
        context._registeredComponents.add(moduleIdentifier)
      }
    }
    // used by ssr in case component is cached and beforeCreate
    // never gets called
    options._ssrRegister = hook
  } else if (injectStyles) {
    hook = injectStyles
  }

  if (hook) {
    var functional = options.functional
    var existing = functional
      ? options.render
      : options.beforeCreate

    if (!functional) {
      // inject component registration as beforeCreate hook
      options.beforeCreate = existing
        ? [].concat(existing, hook)
        : [hook]
    } else {
      // for template-only hot-reload because in that case the render fn doesn't
      // go through the normalizer
      options._injectStyles = hook
      // register for functioal component in vue file
      options.render = function renderWithStyleInjection (h, context) {
        hook.call(context)
        return existing(h, context)
      }
    }
  }

  return {
    esModule: esModule,
    exports: scriptExports,
    options: options
  }
}


/***/ }),

/***/ 55:
/***/ (function(module, exports, __webpack_require__) {

// style-loader: Adds some css to the DOM by adding a <style> tag

// load the styles
var content = __webpack_require__(56);
if(typeof content === 'string') content = [[module.i, content, '']];
if(content.locals) module.exports = content.locals;
// add the styles to the DOM
var update = __webpack_require__(57)("de5913cc", content, false, {});
// Hot Module Replacement
if(false) {
 // When the styles change, update the <style> tags
 if(!content.locals) {
   module.hot.accept("!!../../../../../node_modules/_css-loader@0.28.11@css-loader/index.js!../../../../../node_modules/_vue-loader@13.7.3@vue-loader/lib/style-compiler/index.js?{\"vue\":true,\"id\":\"data-v-019494c5\",\"scoped\":false,\"hasInlineConfig\":true}!../../../../../node_modules/_sass-loader@6.0.7@sass-loader/lib/loader.js!../../../../../node_modules/_vue-loader@13.7.3@vue-loader/lib/selector.js?type=styles&index=0!./index.vue", function() {
     var newContent = require("!!../../../../../node_modules/_css-loader@0.28.11@css-loader/index.js!../../../../../node_modules/_vue-loader@13.7.3@vue-loader/lib/style-compiler/index.js?{\"vue\":true,\"id\":\"data-v-019494c5\",\"scoped\":false,\"hasInlineConfig\":true}!../../../../../node_modules/_sass-loader@6.0.7@sass-loader/lib/loader.js!../../../../../node_modules/_vue-loader@13.7.3@vue-loader/lib/selector.js?type=styles&index=0!./index.vue");
     if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
     update(newContent);
   });
 }
 // When the module is disposed, remove the <style> tags
 module.hot.dispose(function() { update(); });
}

/***/ }),

/***/ 56:
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(13)(false);
// imports


// module
exports.push([module.i, "\n.layout {\n  border: 1px solid #d7dde4;\n  background: #f5f7f9;\n  position: relative;\n  border-radius: 4px;\n  overflow: hidden;\n  height: 100%;\n}\n.layout .ivu-layout {\n    height: 100%;\n}\n.layout-breadcrumb {\n  margin-top: 1px;\n  padding: 10px 25px;\n  background-color: #fff;\n  -webkit-box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);\n          box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);\n}\n.ivu-layout-sider {\n  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);\n          box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);\n}\n.ivu-layout-header {\n  height: 50px;\n  line-height: 50px;\n}\n.slider-logo {\n  height: 50px;\n  line-height: 50px;\n  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);\n          box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);\n  -webkit-box-sizing: border-box;\n          box-sizing: border-box;\n  font-size: 18px;\n  text-align: center;\n  color: rgba(255, 255, 255, 0.7);\n  margin-bottom: 1px;\n}\n.layout-header-bar {\n  background: #fff;\n  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);\n          box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);\n}\n.layout-logo-left {\n  width: 90%;\n  height: 30px;\n  background: #5b6270;\n  border-radius: 3px;\n  margin: 15px auto;\n}\n.menu-icon {\n  -webkit-transition: all .3s;\n  transition: all .3s;\n}\n.rotate-icon {\n  -webkit-transform: rotate(-90deg);\n          transform: rotate(-90deg);\n}\n.menu-item span {\n  display: inline-block;\n  overflow: hidden;\n  width: 69px;\n  text-overflow: ellipsis;\n  white-space: nowrap;\n  vertical-align: bottom;\n  -webkit-transition: width .2s ease .2s;\n  transition: width .2s ease .2s;\n}\n.menu-item i {\n  -webkit-transform: translateX(0px);\n          transform: translateX(0px);\n  -webkit-transition: font-size .2s ease, -webkit-transform .2s ease;\n  transition: font-size .2s ease, -webkit-transform .2s ease;\n  transition: font-size .2s ease, transform .2s ease;\n  transition: font-size .2s ease, transform .2s ease, -webkit-transform .2s ease;\n  vertical-align: middle;\n  font-size: 16px;\n}\n.collapsed-menu span {\n  width: 0px;\n  -webkit-transition: width .2s ease;\n  transition: width .2s ease;\n}\n.ivu-menu-vertical.collapsed-menu .ivu-menu-submenu-title {\n  padding: 0px 24px;\n}\n.ivu-menu-vertical .ivu-menu-item, .ivu-menu-vertical .ivu-menu-submenu-title {\n  padding: 10px 24px;\n}\n.ivu-menu.collapsed-menu {\n  padding-top: 14px;\n}\n.collapsed-menu .ivu-icon-ios-arrow-down:before, .collapsed-menu .ivu-icon-ios-arrow-up:before {\n  display: none;\n}\n.collapsed-menu ul {\n  display: none;\n}\n.collapsed-menu i {\n  -webkit-transform: translateX(5px);\n          transform: translateX(5px);\n  -webkit-transition: font-size .2s ease .2s, -webkit-transform .2s ease .2s;\n  transition: font-size .2s ease .2s, -webkit-transform .2s ease .2s;\n  transition: font-size .2s ease .2s, transform .2s ease .2s;\n  transition: font-size .2s ease .2s, transform .2s ease .2s, -webkit-transform .2s ease .2s;\n  vertical-align: middle;\n  font-size: 22px;\n}\n.layout-copy {\n  text-align: center;\n  padding: 0px 0 0px;\n  color: #9ea7b4;\n}\n.qi-header-menu {\n  display: -webkit-box;\n  display: -ms-flexbox;\n  display: flex;\n  -webkit-box-orient: horizontal;\n  -webkit-box-direction: normal;\n      -ms-flex-direction: row;\n          flex-direction: row;\n  -webkit-box-pack: justify;\n      -ms-flex-pack: justify;\n          justify-content: space-between;\n}\n.qi-header-menu .qi-header-menu-dropdwon {\n    margin-right: 25px;\n}\n", ""]);

// exports


/***/ }),

/***/ 57:
/***/ (function(module, exports, __webpack_require__) {

/*
  MIT License http://www.opensource.org/licenses/mit-license.php
  Author Tobias Koppers @sokra
  Modified by Evan You @yyx990803
*/

var hasDocument = typeof document !== 'undefined'

if (typeof DEBUG !== 'undefined' && DEBUG) {
  if (!hasDocument) {
    throw new Error(
    'vue-style-loader cannot be used in a non-browser environment. ' +
    "Use { target: 'node' } in your Webpack config to indicate a server-rendering environment."
  ) }
}

var listToStyles = __webpack_require__(58)

/*
type StyleObject = {
  id: number;
  parts: Array<StyleObjectPart>
}

type StyleObjectPart = {
  css: string;
  media: string;
  sourceMap: ?string
}
*/

var stylesInDom = {/*
  [id: number]: {
    id: number,
    refs: number,
    parts: Array<(obj?: StyleObjectPart) => void>
  }
*/}

var head = hasDocument && (document.head || document.getElementsByTagName('head')[0])
var singletonElement = null
var singletonCounter = 0
var isProduction = false
var noop = function () {}
var options = null
var ssrIdKey = 'data-vue-ssr-id'

// Force single-tag solution on IE6-9, which has a hard limit on the # of <style>
// tags it will allow on a page
var isOldIE = typeof navigator !== 'undefined' && /msie [6-9]\b/.test(navigator.userAgent.toLowerCase())

module.exports = function (parentId, list, _isProduction, _options) {
  isProduction = _isProduction

  options = _options || {}

  var styles = listToStyles(parentId, list)
  addStylesToDom(styles)

  return function update (newList) {
    var mayRemove = []
    for (var i = 0; i < styles.length; i++) {
      var item = styles[i]
      var domStyle = stylesInDom[item.id]
      domStyle.refs--
      mayRemove.push(domStyle)
    }
    if (newList) {
      styles = listToStyles(parentId, newList)
      addStylesToDom(styles)
    } else {
      styles = []
    }
    for (var i = 0; i < mayRemove.length; i++) {
      var domStyle = mayRemove[i]
      if (domStyle.refs === 0) {
        for (var j = 0; j < domStyle.parts.length; j++) {
          domStyle.parts[j]()
        }
        delete stylesInDom[domStyle.id]
      }
    }
  }
}

function addStylesToDom (styles /* Array<StyleObject> */) {
  for (var i = 0; i < styles.length; i++) {
    var item = styles[i]
    var domStyle = stylesInDom[item.id]
    if (domStyle) {
      domStyle.refs++
      for (var j = 0; j < domStyle.parts.length; j++) {
        domStyle.parts[j](item.parts[j])
      }
      for (; j < item.parts.length; j++) {
        domStyle.parts.push(addStyle(item.parts[j]))
      }
      if (domStyle.parts.length > item.parts.length) {
        domStyle.parts.length = item.parts.length
      }
    } else {
      var parts = []
      for (var j = 0; j < item.parts.length; j++) {
        parts.push(addStyle(item.parts[j]))
      }
      stylesInDom[item.id] = { id: item.id, refs: 1, parts: parts }
    }
  }
}

function createStyleElement () {
  var styleElement = document.createElement('style')
  styleElement.type = 'text/css'
  head.appendChild(styleElement)
  return styleElement
}

function addStyle (obj /* StyleObjectPart */) {
  var update, remove
  var styleElement = document.querySelector('style[' + ssrIdKey + '~="' + obj.id + '"]')

  if (styleElement) {
    if (isProduction) {
      // has SSR styles and in production mode.
      // simply do nothing.
      return noop
    } else {
      // has SSR styles but in dev mode.
      // for some reason Chrome can't handle source map in server-rendered
      // style tags - source maps in <style> only works if the style tag is
      // created and inserted dynamically. So we remove the server rendered
      // styles and inject new ones.
      styleElement.parentNode.removeChild(styleElement)
    }
  }

  if (isOldIE) {
    // use singleton mode for IE9.
    var styleIndex = singletonCounter++
    styleElement = singletonElement || (singletonElement = createStyleElement())
    update = applyToSingletonTag.bind(null, styleElement, styleIndex, false)
    remove = applyToSingletonTag.bind(null, styleElement, styleIndex, true)
  } else {
    // use multi-style-tag mode in all other cases
    styleElement = createStyleElement()
    update = applyToTag.bind(null, styleElement)
    remove = function () {
      styleElement.parentNode.removeChild(styleElement)
    }
  }

  update(obj)

  return function updateStyle (newObj /* StyleObjectPart */) {
    if (newObj) {
      if (newObj.css === obj.css &&
          newObj.media === obj.media &&
          newObj.sourceMap === obj.sourceMap) {
        return
      }
      update(obj = newObj)
    } else {
      remove()
    }
  }
}

var replaceText = (function () {
  var textStore = []

  return function (index, replacement) {
    textStore[index] = replacement
    return textStore.filter(Boolean).join('\n')
  }
})()

function applyToSingletonTag (styleElement, index, remove, obj) {
  var css = remove ? '' : obj.css

  if (styleElement.styleSheet) {
    styleElement.styleSheet.cssText = replaceText(index, css)
  } else {
    var cssNode = document.createTextNode(css)
    var childNodes = styleElement.childNodes
    if (childNodes[index]) styleElement.removeChild(childNodes[index])
    if (childNodes.length) {
      styleElement.insertBefore(cssNode, childNodes[index])
    } else {
      styleElement.appendChild(cssNode)
    }
  }
}

function applyToTag (styleElement, obj) {
  var css = obj.css
  var media = obj.media
  var sourceMap = obj.sourceMap

  if (media) {
    styleElement.setAttribute('media', media)
  }
  if (options.ssrId) {
    styleElement.setAttribute(ssrIdKey, obj.id)
  }

  if (sourceMap) {
    // https://developer.chrome.com/devtools/docs/javascript-debugging
    // this makes source maps inside style tags work properly in Chrome
    css += '\n/*# sourceURL=' + sourceMap.sources[0] + ' */'
    // http://stackoverflow.com/a/26603875
    css += '\n/*# sourceMappingURL=data:application/json;base64,' + btoa(unescape(encodeURIComponent(JSON.stringify(sourceMap)))) + ' */'
  }

  if (styleElement.styleSheet) {
    styleElement.styleSheet.cssText = css
  } else {
    while (styleElement.firstChild) {
      styleElement.removeChild(styleElement.firstChild)
    }
    styleElement.appendChild(document.createTextNode(css))
  }
}


/***/ }),

/***/ 58:
/***/ (function(module, exports) {

/**
 * Translates the list format produced by css-loader into something
 * easier to manipulate.
 */
module.exports = function listToStyles (parentId, list) {
  var styles = []
  var newStyles = {}
  for (var i = 0; i < list.length; i++) {
    var item = list[i]
    var id = item[0]
    var css = item[1]
    var media = item[2]
    var sourceMap = item[3]
    var part = {
      id: parentId + ':' + i,
      css: css,
      media: media,
      sourceMap: sourceMap
    }
    if (!newStyles[id]) {
      styles.push(newStyles[id] = { id: id, parts: [part] })
    } else {
      newStyles[id].parts.push(part)
    }
  }
  return styles
}


/***/ }),

/***/ 59:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ __webpack_exports__["default"] = ({
    data: function data() {
        return {
            isCollapsed: false
        };
    },

    computed: {
        rotateIcon: function rotateIcon() {
            return ['menu-icon', this.isCollapsed ? 'rotate-icon' : ''];
        },
        menuitemClasses: function menuitemClasses() {
            return ['menu-item', this.isCollapsed ? 'collapsed-menu' : ''];
        }
    },
    methods: {
        collapsedSider: function collapsedSider() {
            this.$refs.side1.toggleCollapse();
        }
    }
});

/***/ }),

/***/ 60:
/***/ (function(module, exports, __webpack_require__) {

var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c(
    "div",
    { staticClass: "layout" },
    [
      _c(
        "Layout",
        [
          _c(
            "Sider",
            {
              ref: "side1",
              attrs: {
                "hide-trigger": "",
                collapsible: "",
                "collapsed-width": 78
              },
              model: {
                value: _vm.isCollapsed,
                callback: function($$v) {
                  _vm.isCollapsed = $$v
                },
                expression: "isCollapsed"
              }
            },
            [
              _c(
                "div",
                { staticClass: "slider-logo", class: _vm.menuitemClasses },
                [
                  _c("Icon", { attrs: { type: "md-settings" } }),
                  _vm._v(" "),
                  _c("span", [_vm._v("后台")])
                ],
                1
              ),
              _vm._v(" "),
              _c(
                "Menu",
                {
                  class: _vm.menuitemClasses,
                  attrs: {
                    "active-name": "1-2",
                    theme: "dark",
                    width: "auto",
                    "open-names": ["1"]
                  }
                },
                [
                  _c(
                    "Submenu",
                    { attrs: { name: "1" } },
                    [
                      _c(
                        "template",
                        { slot: "title" },
                        [
                          _c("Icon", { attrs: { type: "ios-navigate" } }),
                          _vm._v(" "),
                          _c("span", [_vm._v("Item 1")])
                        ],
                        1
                      ),
                      _vm._v(" "),
                      _c("MenuItem", { attrs: { name: "1-1" } }, [
                        _vm._v("Option 1")
                      ]),
                      _vm._v(" "),
                      _c("MenuItem", { attrs: { name: "1-2" } }, [
                        _vm._v("Option 2")
                      ]),
                      _vm._v(" "),
                      _c("MenuItem", { attrs: { name: "1-3" } }, [
                        _vm._v("Option 3")
                      ])
                    ],
                    2
                  ),
                  _vm._v(" "),
                  _c(
                    "Submenu",
                    { attrs: { name: "2" } },
                    [
                      _c(
                        "template",
                        { slot: "title" },
                        [
                          _c("Icon", { attrs: { type: "ios-keypad" } }),
                          _vm._v(" "),
                          _c("span", [_vm._v("Item 2")])
                        ],
                        1
                      ),
                      _vm._v(" "),
                      _c("MenuItem", { attrs: { name: "2-1" } }, [
                        _vm._v("Option 1")
                      ]),
                      _vm._v(" "),
                      _c("MenuItem", { attrs: { name: "2-2" } }, [
                        _vm._v("Option 2")
                      ])
                    ],
                    2
                  ),
                  _vm._v(" "),
                  _c(
                    "Submenu",
                    { attrs: { name: "3" } },
                    [
                      _c(
                        "template",
                        { slot: "title" },
                        [
                          _c("Icon", { attrs: { type: "ios-analytics" } }),
                          _vm._v(" "),
                          _c("span", [_vm._v("Item 3")])
                        ],
                        1
                      ),
                      _vm._v(" "),
                      _c("MenuItem", { attrs: { name: "3-1" } }, [
                        _vm._v("Option 1")
                      ]),
                      _vm._v(" "),
                      _c("MenuItem", { attrs: { name: "3-2" } }, [
                        _vm._v("Option 2")
                      ])
                    ],
                    2
                  )
                ],
                1
              )
            ],
            1
          ),
          _vm._v(" "),
          _c(
            "Layout",
            [
              _c(
                "Header",
                { staticClass: "layout-header-bar", style: { padding: 0 } },
                [
                  _c("div", { staticClass: "qi-header-menu" }, [
                    _c(
                      "div",
                      { staticClass: "qi-header-menu-icon" },
                      [
                        _c("Icon", {
                          class: _vm.rotateIcon,
                          style: { margin: "0 20px" },
                          attrs: { type: "md-menu", size: "24" },
                          nativeOn: {
                            click: function($event) {
                              return _vm.collapsedSider($event)
                            }
                          }
                        })
                      ],
                      1
                    ),
                    _vm._v(" "),
                    _c(
                      "div",
                      { staticClass: "qi-header-menu-dropdwon" },
                      [
                        _c(
                          "Dropdown",
                          {
                            staticStyle: { "margin-left": "20px" },
                            attrs: { trigger: "click" }
                          },
                          [
                            _c(
                              "a",
                              {
                                staticStyle: { color: "#999" },
                                attrs: { href: "javascript:void(0)" }
                              },
                              [
                                _vm._v(
                                  "\n                                Admin\n                                "
                                ),
                                _c("Icon", {
                                  attrs: { type: "md-arrow-dropdown" }
                                })
                              ],
                              1
                            ),
                            _vm._v(" "),
                            _c(
                              "DropdownMenu",
                              { attrs: { slot: "list" }, slot: "list" },
                              [
                                _c("DropdownItem", [_vm._v("基本资料")]),
                                _vm._v(" "),
                                _c("DropdownItem", [_vm._v("修改密码")]),
                                _vm._v(" "),
                                _c("DropdownItem", { attrs: { divided: "" } }, [
                                  _vm._v("退出")
                                ])
                              ],
                              1
                            )
                          ],
                          1
                        )
                      ],
                      1
                    )
                  ])
                ]
              ),
              _vm._v(" "),
              _c(
                "div",
                { staticClass: "layout-breadcrumb" },
                [
                  _c(
                    "Breadcrumb",
                    { attrs: { separator: ">" } },
                    [
                      _c("Breadcrumb-item", { attrs: { href: "#" } }, [
                        _vm._v("首页")
                      ]),
                      _vm._v(" "),
                      _c("Breadcrumb-item", { attrs: { href: "#" } }, [
                        _vm._v("应用中心")
                      ]),
                      _vm._v(" "),
                      _c("Breadcrumb-item", [_vm._v("某应用")])
                    ],
                    1
                  )
                ],
                1
              ),
              _vm._v(" "),
              _c(
                "Content",
                {
                  style: {
                    margin: "15px 20px 10px 20px",
                    background: "#fff",
                    minHeight: "260px"
                  }
                },
                [_vm._v("\n                Content\n            ")]
              ),
              _vm._v(" "),
              _c("div", { staticClass: "layout-copy" }, [
                _vm._v(
                  "\n                2011-2016 © TalkingData\n            "
                )
              ])
            ],
            1
          )
        ],
        1
      )
    ],
    1
  )
}
var staticRenderFns = []
render._withStripped = true
module.exports = { render: render, staticRenderFns: staticRenderFns }
if (false) {
  module.hot.accept()
  if (module.hot.data) {
    require("vue-loader/node_modules/vue-hot-reload-api")      .rerender("data-v-019494c5", module.exports)
  }
}

/***/ })

});