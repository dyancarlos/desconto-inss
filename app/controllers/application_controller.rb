class ApplicationController < ActionController::Base
  layout :layout_by_resource
  allow_browser versions: :modern
  before_action :authenticate_user!

  private

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end
end
