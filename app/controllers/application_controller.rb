class ApplicationController < ActionController::Base
  impersonates :user
  include Pundit::Authorization

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :matric_number, :state, :nationality, :gender, :level, :birth_date, :department, :duration, :year])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :matric_number, :state, :nationality, :gender, :level, :birth_date, :department, :duration, :year])
    end
end
