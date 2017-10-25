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

put '/tasks' do
  @project = current_org.projects.find(params[:project_id])
  @task = @project.tasks.find(params[:task_id])
  @task[:name] = params[:name]
  @task[:description] = params[:description]
  @task[:notes] = params[:notes]
  @task[:leader_id] = params[:leader_id]

  if @task.save
    if request.xhr?
      status 200
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

get "/projects/:project_id/edit/tasks/new" do

  unless request.xhr?
    erb :'portal/tasks/new'
  end
end

get "/projects/:project_id/edit/tasks/:task_id/edit" do
  @project = current_org.projects.find(params[:project_id])
  @task = @project.tasks.find(params[:task_id])
  p "***************************************"
  p @project
  p @task

  if request.xhr?
    erb :'portal/tasks/_edit', layout: false, locals: {task: @task, project: @project }
  else
    erb :'portal/tasks/edit'
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

