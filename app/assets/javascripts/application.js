// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require es6-module-loader.src
//= require system.js/dist/system.src

System.config({
  baseURL: '/assets/',
  map: {
    'jquery': 'jquery2',
    'handlebars': 'handlebars.runtime'
  },
  meta: {
    'jquery2': {
      format: 'global',
      exports: 'jQuery'
    },
    'jquery_ujs': {
      deps: ['jquery']
    },
    'extensions/handlebars_helpers': {
      format: 'global',
      deps: ['handlebars']
    }
  }
});

System.import('jquery_ujs');
System.import('extensions/handlebars_helpers');
