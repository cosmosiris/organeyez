def current_org
  Organization.find_by(id: session[:id])
end
