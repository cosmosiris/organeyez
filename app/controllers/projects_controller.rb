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
  @project = Project.find(params[:project_id])
  @project[:name] = params[:name]
  @project[:start_date] = params[:start_date]
  @project[:end_date] = params[:end_date]
  if @project.save
    redirect "/projects/#{@project.id}/edit"
  else
    @errors = ["Your message did not save"]
    erb :_errors, layout: false, locals: {errors: @errors }
  end
end

delete '/projects/:id' do
  Project.find(params[:id]).destroy
  if request.xhr?
    status 200
    redirect "/org_sessions/#{current_org.id}"
  else
    redirect "/org_sessions/#{current_org.id}"
  end
end

get '/org_sessions/:id/projects/new' do
  if request.xhr?
    erb :'portal/projects/new', layout: false
  else
    erb :'portal/projects/new'
  end
end



get '/projects/:id/edit' do
  @project = Project.find(params[:id])
  erb :'portal/projects/edit', :layout => :'layouts/organization_layout'
end


