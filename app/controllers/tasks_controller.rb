post '/tasks' do
  @project = current_org.projects.find(params[:project_id])
  @task = @project.tasks.new(params[:task])
  if @task.save
    if request.xhr?
      status 200
      erb :"portal/tasks/_tasks", layout: false, locals: { task: @task}
    else
      redirect "/projects/#{@project.id}/edit"
    end
  else
    @errors = @task.errors.full_messages
    if request.xhr?
      status 422
      erb :_errors, layout: false, locals: {errors: @errors }
    else
      redirect "/projects/#{@project.id}/edit"
    end
  end
end

get "/org_sessions/:id/projects/:project_id/edit/tasks/new" do

  unless request.xhr?
    erb :'portal/tasks/new'
  end
end

delete '/tasks/:id' do
  @project = current_org.projects.find(params[:project_id])
  @project.tasks.find(params[:id]).destroy
  if request.xhr?
    status 200
    redirect "/projects/#{@project.id}/edit"
  else
    redirect "/projects/#{@project.id}/edit"
  end
end

