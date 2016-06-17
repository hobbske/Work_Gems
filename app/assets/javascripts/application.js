// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require owl.carousel

//= require_tree .


// jQuery code

$(document).ready(function() {
 
  $("#owl-slider").owlCarousel({
 
      autoPlay: 4000, //Set AutoPlay to 4 seconds
      navigation : true, // Show next and prev buttons
      slideSpeed : 200,
      paginationSpeed : 200,
      singleItem:true,
      transitionStyle : "fade",
      stopOnHover: true,
      touchDrag: true,
      paginationNumbers: true,
      navigation: false
 
      // "singleItem:true" is a shortcut for:
      // items : 1, 
      // itemsDesktop : false,
      // itemsDesktopSmall : false,
      // itemsTablet: false,
      // itemsMobile : false
 
  });

 
});

$(document).ready(function(){
  setTimeout(function(){
    $('#flash').remove();
  }, 5000);
 });


$(document).ready(function(){
  
  var selector = '.nav li';

  $(selector).on('click', function(){
      $(selector).removeClass('active');
      $(this).addClass('active');
  });
});


$(document).ready(function(){

  $('a[href="' + this.location.pathname + '"]').parents('ul,li').addClass('active');

});


// Owl Carousel Modal

$(document).ready(function(){
    var $modal = $('.modal').modal({
      show: false 
    });
    
    $('#mymodal').on('click', function() {
        $modal.modal('show');
    });
});



/* users.js */

$(document).ready(function() {
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  // Watch for a form submission:
  $("#form-submit-btn").click(function(event) {
    event.preventDefault();
    $('input[type=submit]').prop('disabled', true);
    var error = false;
    var ccNum = $('#card_number').val(),
        cvcNum = $('#card_code').val(),
        expMonth = $('#card_month').val(),
        expYear = $('#card_year').val();

    if (!error) {
      // Get the Stripe token:
      Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler);
    }
    return false;
  }); // form submission
  
  function stripeResponseHandler(status, response) {
    // Get a reference to the form:
    var f = $("#new_user");

    // Get the token from the response:
    var token = response.id;

    // Add the token to the form:
    f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');

    // Submit the form:
    f.get(0).submit(); 
  }


});


