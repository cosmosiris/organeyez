$(document).ready(function() {
  renderNewProjectForm()
  deleteProject()
  submitNewProject()
  renderNewTaskForm()
});

var renderNewProjectForm = function(){
  $("#new_project_button").on("click", function(event){
    event.preventDefault();

    $("#new_project_button").hide();
    $("#new_project_form").removeClass("hidden");
  });
};

var submitNewProject = function(){
  $("#new_project_container").on("submit", "#new_project_form", function(event){
    event.preventDefault();
    console.log(this)

    var url = $(this).attr("action")
    var method = $(this).attr("method")
    data = $(this).serialize();

    $.ajax({
      url: url,
      method: method,
      data: data
    }).done(function(response){
      $("#new_project_form").addClass("hidden");
      $("#project_display_list").append(response);
    }).fail(function(error){
       $("#project_display_list").append(error.responseText);
    });
  $("#new_project_button").show();
  });
}


var deleteProject = function(){
   $("#project_display_list").on("submit", ".delete_project_form", function(event){
    event.preventDefault();
    var url = $(this).attr("action")
    var method = $(this).attr("method")
    var data = $(this).serialize();
    console.log("heyyyyyyyyy");

    $.ajax({
      url: url,
      method: method,
      context: this,
      data: data
    }).done(function(response){
      $(this).closest(".homepage_project_view").remove();
      console.log("removed");
    }).fail(function(error){
      $("#new_project_button").prepend(error.responseText);
    });
  });
};

var renderNewTaskForm = function(){
  $("#new_task_button").on("click", function(event){
    event.preventDefault();

    $("#new_task_button").hide();
    $("#new_task_form").removeClass("hidden");
  });
};
