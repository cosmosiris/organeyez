def current_org
  @current_org ||= Organization.find_by(id: session[:id])
end

def list_organizations
 Organization.all
end
