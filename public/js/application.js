$(document).ready(function() {
  renderNewProjectForm();
  deleteProject();
  submitNewProject();
  editProject();
  renderNewTaskForm();
  submitNewTask();
  deleteTask();
  renderTaskEditForm();
});

var renderNewProjectForm = function(){
  $("#new_project_button").on("click", function(event){
    event.preventDefault();
    console.log("success")
    $("#new_project_button").hide();
    $("#new_project_form").removeClass("hidden");
  });
};

var submitNewProject = function(){
  $("#new_project_container").on("submit", "#new_project_form", function(event){
    event.preventDefault();

    form = this
    var url = $(this).attr("action")
    var method = $(this).attr("method")
    data = $(this).serialize();

    $.ajax({
      url: url,
      method: method,
      data: data
    }).done(function(response){
      $("#project_display_list").append(response);
      form.reset();
      console.log("success")
    }).fail(function(error){
       $("#project_display_list").prepend(error.responseText);
    });
    $("#new_project_form").addClass("hidden");
    $("#new_project_button").show();
  });
}


var deleteProject = function(){
   $("#project_display_list").on("submit", ".delete_project_form", function(event){
    event.preventDefault();
    var url = $(this).attr("action")
    var method = $(this).attr("method")
    var data = $(this).serialize();
    console.log("success");

    $.ajax({
      url: url,
      method: method,
      context: this,
      data: data
    }).done(function(response){
      $(this).closest(".homepage_project_view_box").remove();
      console.log("removed");
    }).fail(function(error){
      $(".homepage_project_view_box").prepend(error.responseText);
    });
  });
};

var editProject = function(){
  $("#edit_project_form").on("submit", function(event){
    event.preventDefault();
    console.log("preventdefault");

    url = $(this).attr("action");

    $.ajax({
      url: url,
      method: "put",
      data: $(this).serialize()
    }).done(function(response){
      console.log("SUCCESS");
    }).fail(function(error){
      $("#project_details_box").after(error.responseText);
      console.log("fail");
    });
  })
}


var renderNewTaskForm = function(){
  $("#new_task_button").on("click", function(event){
    event.preventDefault();
    console.log("SUCCESS");
    $("#new_task_button").hide();
    $("#new_task_form").removeClass("hidden");
  });
};

var submitNewTask = function(){
  $("#new_task_form").on("submit", function(event){
    event.preventDefault();

    url = $(this).attr("action");
    method = $(this).attr("method");
    data = $(this).serialize();

    $.ajax({
      url: url,
      method: method,
      data: data
    }).done(function(response){
      $("#project_task_list").append(response);
      console.log("SUCCESS");
    }).fail(function(error){
      $("#project_task_list").prepend(error.responseText);
      console.log("fail");
    });
      $("#new_task_button").show();
      $("#new_task_form").addClass("hidden");
  });
}

var deleteTask = function(){
   $("#project_task_list").on("submit", ".delete_task_form", function(event){
    event.preventDefault();
    var url = $(this).attr("action")
    var method = $(this).attr("method")
    var data = $(this).serialize();
    console.log("success");

    $.ajax({
      url: url,
      method: method,
      context: this,
      data: data
    }).done(function(response){
      $(this).closest(".task_view_box").remove();
      console.log("removed");
    }).fail(function(error){
      $(".task_view_box").prepend(error.responseText);
    });
  });
};

var renderTaskEditForm = function(){
  $(".render_task_edit_form").on("submit", function(event){
    event.preventDefault();

    taskViewBox = $(this).closest(".task_view_box")

    url = $(this).attr("action")

    console.log(url)

    $.ajax({
      url: url,
      method: "GET"
    }).done(function(response){
      $(taskViewBox).parent().append(response);
      $(taskViewBox).hide();
      console.log(response);
    }).fail(function(error){
        console.log("failure")
    })
  });
}

