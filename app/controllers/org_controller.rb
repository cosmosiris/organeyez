post '/organizations' do
  @organization = Organization.new(params[:organization])
  @confirmed = params[:organization][:password] == params[:confirmed_password]
  if @confirmed && @organization.save
    session[:id] = @organization.id
    redirect "/org_sessions/#{@organization.id}"
  else
    @errors = @organization.errors.full_messages
    @errors << "Passwords don't match" unless @confirmed
    erb :'static/registration'
  end
end




