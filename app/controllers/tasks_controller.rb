post '/tasks' do
  @project = Project.find(params[:project_id])
  @task = @project.tasks.new(params[:task])
  if @task.save
    redirect "/projects/#{@project.id}/edit"
  else
    @errors = @task.errors.full_messages
    erb :_errors, layout: false, locals: {errors: @errors }
  end
end

get "/org_sessions/:id/projects/:id/edit/tasks/new" do
   if request.xhr?
    erb :'portal/tasks/new', layout: false
  else
    erb :'portal/tasks/new'
  end
end

delete '/tasks/:id' do
  Task.find_by(id: params[:id]).destroy
  @project = Project.find(params[:project_id])
  redirect "/projects/#{@project.id}/edit"
end

