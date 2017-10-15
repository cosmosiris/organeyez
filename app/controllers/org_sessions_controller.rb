get '/org_login' do

  erb :'static/org_login'
end

post '/org_sessions' do

end

get '/org_sessions/:id' do
  @organization = Organization.find(params[:id])

  erb :'portal/organizations/show', :layout => :'layouts/organization_layout'
end
