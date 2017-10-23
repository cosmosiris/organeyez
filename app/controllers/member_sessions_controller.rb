get '/member_sessions/new' do
  erb :'/static/member_login'
end

post '/member_sessions' do
   @member = User.find_by(email: params[:email])
  if @member && @member.authenticate(params[:password])
    session[:id] = @member.id
    redirect "/member_sessions/#{@member.id}"
  else
   @errors = ["Your password and/or email is incorrect"]
    erb :'static/org_login'
  end
end


get '/member_sessions/:id' do
  @member = User.find_by(id: params[:id])

  erb :'/portal/members/home', :layout => :'layouts/member_layout'
end

get '/member_sessions/:id/profile' do

  erb :'/portal/members/profile', :layout => :'layouts/member_layout'
end

delete '/member_sessions' do
  session[:id] = nil
  redirect '/member_sessions/new'
end
