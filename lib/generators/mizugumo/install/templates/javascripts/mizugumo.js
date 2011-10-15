Ninja.orders(function(Ninja){
  Ninja.behavior({
    // Enables graceful degradation of method links to forms.
    '.mizugumo_graceful_form': Ninja.becomesLink,
    '.flash': Ninja.decays({ lifetime : 5000}),
    '*[data-confirm]': Ninja.confirms  
  });
})

