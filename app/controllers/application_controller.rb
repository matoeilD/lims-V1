class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
 rescue_from CanCan::AccessDenied do |exception|
    redirect_to users_path, :alert => exception.message, :alert=>"You are not authorized to access this page. Please contact your administrator"
  
  end
  

 
  
end
