post '/tasks' do
  @project = Project.find(params[:project_id])
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

get "/org_sessions/:id/projects/:id/edit/tasks/new" do
   if request.xhr?
    redirect ''
  else
    erb :'portal/tasks/new'
  end
end

delete '/tasks/:id' do
  Task.find_by(id: params[:id]).destroy
  @project = Project.find(params[:project_id])
  if request.xhr?
    status 200
    redirect "/projects/#{@project.id}/edit"
  else
    redirect "/projects/#{@project.id}/edit"
  end
end

