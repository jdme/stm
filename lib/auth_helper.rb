module AuthHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    if current_user
      true
    else
      false
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_auth
    unless signed_in?
      redirect_to new_session_path, :alert => "You must be authorized"
    end
  end
end
