$(function() {
  $(" .star-rating").raty({
    path: "/assets/",
    readOnly: true,
    score: function(){
      return $(this).attr("data-score");
    }
  });
  
  $(" .star-rating-review").raty({
    path: "/assets/",
    scoreName: "review[rating]"
  });

  $(" .star-rating-filter").raty({
    path: "/assets/",
    scoreName: "query[rating_eq]"
  });  
});
