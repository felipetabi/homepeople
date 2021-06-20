module WorkingHoursHelper
  def pm_or_am(block)
    am = ["00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00"]
    if am.include?(block.text)
      "<label for='working_setting_array_hours_#{block.text.tr(':', '')}''>#{block.text} AM</label>".html_safe
    else
      "<label for='working_setting_array_hours_#{block.text.tr(':', '')}''>#{block.text} PM</label>".html_safe
    end
  end
end
