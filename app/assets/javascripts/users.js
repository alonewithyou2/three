/*global $, Stripe*/
//Document ready - waits for the form to fully load before we manipulate it.
$(document).on('turbolinks:load', function(){
    var theForm = $('#pro_form');
    var submitBtn = $('#form-submit-btn')
    //set stripe public key.
    Stripe.setPublishableKey( $('meta[name = "stripe-key"]').attr('content') );
    
    //when user clicks form submit button
    submitBtn.click(function(event){
      //we want to prevent default submission behavior.
      event.preventDefault();
      //collect the credit card fields.
      var ccNum = $('#card_number').val(), 
          cvcNum = $('#card_code').val(),
          expMonth = $('#card_month').val(),
          expYear = $('#card_year').val();
      //send the card info to stripe.
      Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler);
    });
    
    //stripe will return back a card token.
    //need to do something with that token, inject it as a hidden field into the form and then finally
    // tell the form to go ahead and continue submitting to our rails server/app.
    //  
    
});
