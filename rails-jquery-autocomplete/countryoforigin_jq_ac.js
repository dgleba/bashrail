$(function() {
  // run when eventlistener is triggered
  // http://stackoverflow.com/questions/6431459/jquery-autocomplete-trigger-change-event
  //
  $("#country_of_origin_ctype").on("autocompletechange", function(event, data) {
    // post value to console for validation
    console.log("Item is: ", $(this).val());

    // if item user typed in the input box is not in the list of suggestions, it will be cleared out. The user must select an item.
    //  if (!data.item) {
    //    this.value = '';
    //    console.log('> Item selected is:', data.item);
    //    }
  });
  console.log("msg.. 1015");
});
