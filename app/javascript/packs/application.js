// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//= require jquery3
//= require jquery_ujs
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

window.store = {}

document.addEventListener("turbolinks:load", function() {
  var element = document.querySelector("#boards")
  if (element != undefined) {
    window.store.lists = JSON.parse(element.dataset.lists)

    const app = new Vue({
      el: element,
      data: window.store,
      template: "<App :original_lists='lists' />",
      components: { App }
    })
  }
});