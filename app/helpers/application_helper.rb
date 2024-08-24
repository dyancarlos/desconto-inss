module ApplicationHelper
  def active_tab(controller)
    "active" if params[:controller] == controller
  end
end
