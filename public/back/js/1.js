(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[1],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/assets/js/admin/pages/single/index.vue?vue&type=script&lang=js&":
/*!*******************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/assets/js/admin/pages/single/index.vue?vue&type=script&lang=js& ***!
  \*******************************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var vuex__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! vuex */ "./node_modules/vuex/dist/vuex.esm.js");
function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

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
  name: "edit",
  data: function data() {
    return {
      headers: {
        "X-CSRF-TOKEN": document.querySelector("meta[name='csrf-token']").getAttribute("content")
      },
      form: {
        pid: "",
        title: "",
        description: '',
        content: "",
        cover_img: "",
        icon: "",
        hover_icon: ""
      }
    };
  },
  created: function created() {
    var _this = this;

    this.form.pid = this.$route.params.id;
    this.getSingleInfo({
      pid: this.form.pid
    }).then(function (res) {
      if (res.data) {
        _this.form = res.data;
      } else {
        _this.form = {
          pid: "",
          title: "",
          description: '',
          content: "",
          cover_img: "",
          icon: "",
          hover_icon: ""
        };
      }
    });
  },
  computed: {},
  watch: {
    $route: function $route() {
      var _this2 = this;

      this.form.pid = this.$route.params.id;
      this.getSingleInfo({
        pid: this.form.pid
      }).then(function (res) {
        if (res.data) {
          _this2.form = res.data;
        } else {
          _this2.form = {
            pid: "",
            title: "",
            description: '',
            content: "",
            cover_img: "",
            icon: "",
            hover_icon: ""
          };
        }
      });
    }
  },
  mounted: function mounted() {// this.$layer.full(this.layerid);
  },
  methods: _objectSpread(_objectSpread({}, Object(vuex__WEBPACK_IMPORTED_MODULE_0__["mapActions"])('single', ['getSingleInfo', 'editSingle'])), {}, {
    handleCoverSuccess: function handleCoverSuccess(res, file) {
      this.form.cover_img = res.data;
    },
    handleHoverIconSuccess: function handleHoverIconSuccess(res, file) {
      this.form.hover_icon = res.data;
    },
    handleIconSuccess: function handleIconSuccess(res, file) {
      this.form.icon = res.data;
    },
    onSubmit: function onSubmit() {
      var _this3 = this;

      this.form.pid = this.$route.params.id;
      this.editSingle(this.form).then(function (res) {
        _this3.$message(res.msg);
      });
    }
  })
});

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/assets/js/admin/pages/single/index.vue?vue&type=template&id=c5441ab0&":
/*!***********************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/assets/js/admin/pages/single/index.vue?vue&type=template&id=c5441ab0& ***!
  \***********************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c(
    "div",
    { staticClass: "iframe-block" },
    [
      _c(
        "el-form",
        { ref: "form", attrs: { model: _vm.form, "label-width": "100px" } },
        [
          _c(
            "el-form-item",
            { attrs: { label: "标题" } },
            [
              _c("el-input", {
                attrs: { placeholder: "请输入标题" },
                model: {
                  value: _vm.form.title,
                  callback: function($$v) {
                    _vm.$set(_vm.form, "title", $$v)
                  },
                  expression: "form.title"
                }
              })
            ],
            1
          ),
          _vm._v(" "),
          _c(
            "el-form-item",
            { attrs: { label: "描述" } },
            [
              _c("el-input", {
                attrs: { type: "textarea", placeholder: "请输入描述" },
                model: {
                  value: _vm.form.description,
                  callback: function($$v) {
                    _vm.$set(_vm.form, "description", $$v)
                  },
                  expression: "form.description"
                }
              })
            ],
            1
          ),
          _vm._v(" "),
          _c(
            "div",
            { staticStyle: { display: "flex" } },
            [
              _c(
                "el-form-item",
                { attrs: { label: "banner图" } },
                [
                  _c(
                    "el-upload",
                    {
                      staticClass: "avatar-uploader",
                      attrs: {
                        action: "/admin/uploadImg",
                        headers: _vm.headers,
                        "show-file-list": false,
                        "on-success": _vm.handleCoverSuccess
                      }
                    },
                    [
                      _vm.form.cover_img
                        ? _c("img", {
                            staticClass: "avatar",
                            attrs: {
                              src: _vm.$config.img_url + _vm.form.cover_img
                            }
                          })
                        : _c("i", {
                            staticClass: "el-icon-plus avatar-uploader-icon"
                          })
                    ]
                  )
                ],
                1
              ),
              _vm._v(" "),
              _c(
                "el-form-item",
                {
                  staticStyle: { "margin-left": "20px" },
                  attrs: { label: "icon图" }
                },
                [
                  _c(
                    "el-upload",
                    {
                      staticClass: "avatar-uploader",
                      attrs: {
                        action: "/admin/uploadImg",
                        headers: _vm.headers,
                        "show-file-list": false,
                        "on-success": _vm.handleIconSuccess
                      }
                    },
                    [
                      _vm.form.icon
                        ? _c("img", {
                            staticClass: "avatar",
                            attrs: { src: _vm.$config.img_url + _vm.form.icon }
                          })
                        : _c("i", {
                            staticClass: "el-icon-plus avatar-uploader-icon"
                          })
                    ]
                  )
                ],
                1
              ),
              _vm._v(" "),
              _c(
                "el-form-item",
                {
                  staticStyle: { "margin-left": "20px" },
                  attrs: { label: "鼠标经过icon" }
                },
                [
                  _c(
                    "el-upload",
                    {
                      staticClass: "avatar-uploader",
                      attrs: {
                        action: "/admin/uploadImg",
                        headers: _vm.headers,
                        "show-file-list": false,
                        "on-success": _vm.handleHoverIconSuccess
                      }
                    },
                    [
                      _vm.form.hover_icon
                        ? _c("img", {
                            staticClass: "avatar",
                            attrs: {
                              src: _vm.$config.img_url + _vm.form.hover_icon
                            }
                          })
                        : _c("i", {
                            staticClass: "el-icon-plus avatar-uploader-icon"
                          })
                    ]
                  )
                ],
                1
              )
            ],
            1
          ),
          _vm._v(" "),
          _c(
            "el-form-item",
            { attrs: { label: "内容" } },
            [
              _c("ckeditor", {
                model: {
                  value: _vm.form.content,
                  callback: function($$v) {
                    _vm.$set(_vm.form, "content", $$v)
                  },
                  expression: "form.content"
                }
              })
            ],
            1
          ),
          _vm._v(" "),
          _c(
            "el-form-item",
            { attrs: { size: "large" } },
            [
              _c(
                "el-button",
                {
                  attrs: { type: "primary", size: "small" },
                  on: { click: _vm.onSubmit }
                },
                [_vm._v("确定")]
              )
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



/***/ }),

/***/ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js":
/*!********************************************************************!*\
  !*** ./node_modules/vue-loader/lib/runtime/componentNormalizer.js ***!
  \********************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return normalizeComponent; });
/* globals __VUE_SSR_CONTEXT__ */

// IMPORTANT: Do NOT use ES2015 features in this file (except for modules).
// This module is a runtime utility for cleaner component module output and will
// be included in the final webpack user bundle.

function normalizeComponent (
  scriptExports,
  render,
  staticRenderFns,
  functionalTemplate,
  injectStyles,
  scopeId,
  moduleIdentifier, /* server only */
  shadowMode /* vue-cli only */
) {
  // Vue.extend constructor export interop
  var options = typeof scriptExports === 'function'
    ? scriptExports.options
    : scriptExports

  // render functions
  if (render) {
    options.render = render
    options.staticRenderFns = staticRenderFns
    options._compiled = true
  }

  // functional template
  if (functionalTemplate) {
    options.functional = true
  }

  // scopedId
  if (scopeId) {
    options._scopeId = 'data-v-' + scopeId
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
    hook = shadowMode
      ? function () { injectStyles.call(this, this.$root.$options.shadowRoot) }
      : injectStyles
  }

  if (hook) {
    if (options.functional) {
      // for template-only hot-reload because in that case the render fn doesn't
      // go through the normalizer
      options._injectStyles = hook
      // register for functioal component in vue file
      var originalRender = options.render
      options.render = function renderWithStyleInjection (h, context) {
        hook.call(context)
        return originalRender(h, context)
      }
    } else {
      // inject component registration as beforeCreate hook
      var existing = options.beforeCreate
      options.beforeCreate = existing
        ? [].concat(existing, hook)
        : [hook]
    }
  }

  return {
    exports: scriptExports,
    options: options
  }
}


/***/ }),

/***/ "./resources/assets/js/admin/pages/single/index.vue":
/*!**********************************************************!*\
  !*** ./resources/assets/js/admin/pages/single/index.vue ***!
  \**********************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _index_vue_vue_type_template_id_c5441ab0___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./index.vue?vue&type=template&id=c5441ab0& */ "./resources/assets/js/admin/pages/single/index.vue?vue&type=template&id=c5441ab0&");
/* harmony import */ var _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./index.vue?vue&type=script&lang=js& */ "./resources/assets/js/admin/pages/single/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _index_vue_vue_type_template_id_c5441ab0___WEBPACK_IMPORTED_MODULE_0__["render"],
  _index_vue_vue_type_template_id_c5441ab0___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/assets/js/admin/pages/single/index.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/assets/js/admin/pages/single/index.vue?vue&type=script&lang=js&":
/*!***********************************************************************************!*\
  !*** ./resources/assets/js/admin/pages/single/index.vue?vue&type=script&lang=js& ***!
  \***********************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/assets/js/admin/pages/single/index.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/assets/js/admin/pages/single/index.vue?vue&type=template&id=c5441ab0&":
/*!*****************************************************************************************!*\
  !*** ./resources/assets/js/admin/pages/single/index.vue?vue&type=template&id=c5441ab0& ***!
  \*****************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_c5441ab0___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../../node_modules/vue-loader/lib??vue-loader-options!./index.vue?vue&type=template&id=c5441ab0& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/assets/js/admin/pages/single/index.vue?vue&type=template&id=c5441ab0&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_c5441ab0___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_index_vue_vue_type_template_id_c5441ab0___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);