post '/projects' do
  @project = current_org.projects.new(params[:project])

  if @project.save
    if request.xhr?
      status 200
      erb :"portal/projects/_projects", layout: false, locals: { project: @project}
    else
      redirect "/org_sessions/#{current_org.id}"
    end
  else
    @errors = @project.errors.full_messages
    if request.xhr?
      status 422
      erb :_errors, layout: false, locals: {errors: @errors }
    else
      redirect "/org_sessions/#{current_org.id}"
    end
  end
end

put '/projects' do
  @project = current_org.projects.find(params[:project_id])
  @project[:name] = params[:name]
  @project[:start_date] = params[:start_date]
  @project[:end_date] = params[:end_date]

  if @project.save
    if request.xhr?
      status 200
    else
      redirect "/projects/#{@project.id}/edit"
    end
  else
    @errors = @project.errors.full_messages
    if request.xhr?
      status 422
      erb :_errors, layout: false, locals: {errors: @errors }
    else
      redirect "/projects/#{@project.id}/edit"
    end
  end
end

delete '/projects/:id' do
  current_org.projects.find(params[:id]).destroy

  if request.xhr?
    status 200
    redirect "/org_sessions/#{current_org.id}"
  else
    redirect "/org_sessions/#{current_org.id}"
  end
end

get '/org_sessions/:id/projects/new' do
  unless request.xhr?
    erb :'portal/projects/new'
  end
end


get '/projects/:id/edit' do
  @project = current_org.projects.find(params[:id])
  erb :'portal/projects/edit', :layout => :'layouts/organization_layout'
end


