class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:student).permit(:email, :password, :password_confirmation, :name, :school, :major, :city, :nationality)
  end

  def account_update_params
    params.requrie(:student).permit(:email, :password, :password_confirmation, :current_password, :name, :school, :major, :city, :nationality)
  end


end
