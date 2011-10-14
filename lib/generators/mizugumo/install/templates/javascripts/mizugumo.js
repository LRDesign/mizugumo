Ninja.orders(function(Ninja){
  Ninja.behavior({
    // This line enables the NS behavior of graceful degradation of method links
    // to forms and back again
    '.mizugumo_graceful_form': Ninja.becomesAjaxLink
  });
})

