get '/org_sessions/projects/new' do
  if request.xhr?
    erb :'portal/projects/new', layout: false
  else
    erb :'portal/projects/new'
  end
end

post '/projects' do
  current_org.projects.create(params[:project])
  redirect "/org_sessions/#{current_org.id}"
end
