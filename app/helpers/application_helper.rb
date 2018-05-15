module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert-info"
      when 'success' then "alert-success"
      when 'error' then "alert-error"
      when 'alert' then "alert-warning"
      else "alert_#{level}"
    end
  end
end
