class Usuarios::SessionsController < Devise::SessionsController
  
  private
  
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_path
    else
      root_path
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end 