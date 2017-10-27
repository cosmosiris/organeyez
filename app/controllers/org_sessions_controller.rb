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
  # @events = EventBriteAdapter.new.return_events

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


get '/org_sessions/:id/profile/create_principle' do

  erb :'portal/organizations/create_principle', :layout => :'layouts/organization_layout'
end

post '/org_sessions/:id/profile/create_principle' do
  @principle = Principle.new(principle: params[:principle], description: params[:description], organization_id: current_org.id)
  if @principle.save
    redirect "/org_sessions/#{current_org.id}/profile"
  else
    @errors = ["Your principle did not save"]
    erb :'portal/organizations/create_principle', :layout => :'layouts/organization_layout'
  end
end


