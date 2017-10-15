get '/org_login' do

  erb :'static/org_login'
end

post '/org_sessions' do
  @organization = Organization.find_by(email: params[:organization][:email])
  if @organization && @organization.authenticate(params[:organization][:password])
    session[:id] = @organization.id
    redirect "/org_sessions/#{@organization.id}"
  else
   @errors = ["Your password and/or email is incorrect"]
    erb :'static/org_login'
  end
end

get '/org_sessions/:id' do
  @organization = Organization.find(params[:id])

  erb :'portal/organizations/home', :layout => :'layouts/organization_layout'
end

delete '/org_sessions' do
  session[:id] = nil
  redirect '/org_login'
end

get '/org_sessions/:id/profile' do

  erb :'portal/organizations/profile', :layout => :'layouts/organization_layout'
end

get '/org_sessions/:id/profile/mission_statement' do

  erb :'portal/organizations/update_mission', :layout => :'layouts/organization_layout'
end

put '/org_sessions/:id/profile/mission_statement' do
  @organization = current_org
  @organization[:mission] = params[:mission]
  if @organization.save
    redirect "/org_sessions/#{current_org.id}/profile"
  else
    @errors = ["Your message did not save"]
    erb :'portal/organizations/update_mission', :layout => :'layouts/organization_layout'
  end
end


