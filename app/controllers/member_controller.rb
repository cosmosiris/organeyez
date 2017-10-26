post '/members' do
  @member = User.new(params[:user])
  @organization = Organization.find_by(name: params[:organization])
  password_confirmed = params[:user][:password] == params[:confirmed_password]
  org_confirmed = params[:sign_up_code].to_i == @organization.code

  if password_confirmed && org_confirmed && @member.save
    session[:id] = @member.id
    redirect "/member_sessions/#{@member.id}"
  else
    @errors = @member.errors.full_messages
    @errors << "Passwords don't match" unless @confirmed
    @errors << "Organization not found" unless @org_confirmed
    erb :'static/registration'
  end
end

get '/members/:id' do
  @member = User.find(params[:id])
  erb :'/portal/members/profile', layout: :'layouts/organization_layout'
end
