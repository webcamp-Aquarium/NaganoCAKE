class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    root_path(resource)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_kanji,
                                              :first_name_kanji,
                                              :family_name_kana,
                                              :first_name_kana,
                                              :postal_code,
                                              :address,
                                              :phone,])
  end
end
