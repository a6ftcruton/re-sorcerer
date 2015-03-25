module SessionHelper
  def authenticate_and_login_user
    user = create(:user)
    visit login_path
    fill_in("Email", with: user.email)
    fill_in("Password", with: user.password)
    click_on("Sign In")
  end

  def destroy_session
    session[:user_id] = nil
    redirect_to root_path
  end
end
