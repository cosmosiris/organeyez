$(document).ready(function() {
  renderNewProjectForm()
});

var renderNewProjectForm = function(){
  $("#new_project_button").on("submit", function(event){
    event.preventDefault();

    var url = $(this).attr("action")
    var method = $(this).attr("method")

    $.ajax({
      url: url,
      method: method
    }).done(function(response){
      $("#new_project_button").after(response);
    });
  });
};


