class ApplicationController < ActionController::Base

  before_action :set_locale
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      tests_path
    end
  end

  def default_url_options
    { lang: (I18n.locale unless I18n.locale == I18n.default_locale) }
  end

  private
  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
