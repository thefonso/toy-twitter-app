// TODO add drop shadow and rounded corners

$(function() {

  var lightboxHTML = '<div id="overlay"></div>' +
                     '<div id="lightbox">' +
                     '<a href="#" id="close">Close</a>' +
                     '<p/>' + '</div>';

  $(lightboxHTML).appendTo('body').
  hide();

  $('#overlay').css('opacity', '0.8');

  // continues
	$('li', '#gallery').each(function() {

	    var $li = $(this);
	    var $a = $li.find('a');

	    $a.click(function(event) {

	      $('p', '#lightbox').text(alt);

	      $('#overlay, #lightbox').show();

	      event.preventDefault();
	    });

	});

	$('#close', '#lightbox').click(function(event) {

	    $('#lightbox, #overlay').hide();

	    event.preventDefault();
	});

});
