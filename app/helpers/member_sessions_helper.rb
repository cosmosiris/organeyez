def current_member
 User.find_by(id: session[:id])
end
