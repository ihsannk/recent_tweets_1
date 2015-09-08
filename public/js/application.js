$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
   $('#submit-tweet').click(function(event) {
   	event.preventDefault();
   	$("#ajax-loader").show();
   	$.ajax({
   		url: "/recent_tweets",
   		method: "get",
   		data: $('#find-recent-tweets').serialize(),
   		cache: false,
   		success: function(response) {
   			$("#container").html(response);
   			$("#ajax-loader").hide();
   		},
   		error: function() {
   			$("#container").html("<br>unable to search");
   			$("#ajax-loader").hide();
   		}

   	});
   });


});
