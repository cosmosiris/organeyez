post '/organizations' do
  @organization = Organization.new(params[:organization])
  @confirmed = params[:organization][:password] == params[:confirmed_password]
  if @confirmed && @organization.save
    session[:id] = @organization.id
    redirect "/organizations/#{@organization.id}"
  else
    @errors = @organization.errors.full_messages
    @errors << "Passwords don't match" unless @confirmed
    erb :'static/registration'
  end
end

get '/organizations/:id' do
  @organization = Organization.find(params[:id])

  erb :'portal/organizations/show', :layout => :'layouts/organization_layout'
end

get '/organizations/:id/profile' do

end

