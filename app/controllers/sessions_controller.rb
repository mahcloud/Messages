class SessionsController < Devise::SessionsController
  def create
    resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
    sign_in(resource_name, resource)
    if current_user
      if !current_user.authentication_tokens
        current_user.reset_authentication_token! 
      end
      render json: {success: true, userToken: current_user.authentication_tokens, email: resource.email}
    else
      invalid_login_attempt()
    end
  end

  protected

  def invalid_login_attempt
    warden.custom_failure!
    render json: {success: false, message: "Error with your login or password"}, status: 401
  end
end