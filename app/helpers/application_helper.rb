module ApplicationHelper
  def active_tab(controller)
    "active" if params[:controller] == controller
  end

  def flash_message_class(level)
    {
      notice: "alert alert-success",
      success: "alert alert-success",
      error: "alert alert-error",
      alert: "alert alert-error"
    }[level.to_sym]
  end
end
