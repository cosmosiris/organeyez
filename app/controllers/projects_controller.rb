get '/org_sessions/projects/new' do

  erb :'portal/projects/new'
end

post '/projects' do
  current_org.projects.create(params[:project])
  redirect "/org_sessions/#{current_org.id}"
end
