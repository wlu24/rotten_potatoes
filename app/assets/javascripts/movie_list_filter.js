var MovieListFilter = {
  filter_adult: function () {
    // 'this' is *unwrapped* element that received event (checkbox)
    if ($(this).is(':checked')) {
      $('tr.adult').hide();
    } else {
      $('tr.adult').show();
    };
  },
  setup: function() {
    // construct checkbox with label
    var labelAndCheckbox =
      $('<label for="filter">Only movies suitable for children</label>' +
        '<input type="checkbox" id="filter"/>' );
    labelAndCheckbox.insertBefore('#movies');
    $('#filter').change(MovieListFilter.filter_adult);
  }
}

// Original code from the textbook
// Will not work (MovieListFilter.setup not called) when the page is
// reached with a link_to from other pages. This is due to rails's
// turbo-link functionality.
//$(MovieListFilter.setup); // run setup function when document ready

// To fix the above problem, use solution from
// https://stackoverflow.com/questions/17600093/
//   rails-javascript-not-loading-after-clicking-through-link-to-helper
$(document).on('turbolinks:load', MovieListFilter.setup);
