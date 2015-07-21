$(function() {
  $(" .star-rating").raty({
    path: "/",
    readOnly: true,
    score: function(){
      return $(this).attr("data-score");
    }
  });
  
  $(" .star-rating-review").raty({
    path: "/",
    scoreName: "review[rating]"
  });

  $(" .star-rating-filter").raty({
    path: "/",
    scoreName: "query[rating_eq]"
  });  
});
