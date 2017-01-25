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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap
//= require cocoon
//= require_tree .

function revealMobileNav() {
    var x = document.getElementById("top-nav");
    var y = document.getElementById("sign-in-nav");
    var z = document.getElementById("sign-in");

    if (x.className === "nav navbar-nav hide-on-medium-screen") {
        x.className += " open-mobile-navbar"; }
    else
        { x.className = "nav navbar-nav hide-on-medium-screen"; }
    if (y.className === "nav navbar-nav hide-on-small-screen") {
        y.className += " open-mobile-navbar"; }
    else
        { y.className = "nav navbar-nav hide-on-small-screen"; }
    if (z.className === "navbar-header-right") {
        z.className = "navbar-shifted-left"; }
    else
        { z.className = "navbar-header-right"; }

}
