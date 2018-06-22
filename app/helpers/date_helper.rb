module DateHelper

  def date_time_full(time_obj)
    time_obj.strftime("%A %-m/%-d/%Y %-l:%M%P")
  end

  def date_time_abbrev(time_obj)
    time_obj.strftime("%a %-m/%-d/%Y %-l:%M%P")
  end

  def time_only(time_obj)
    time_obj.strftime("%-l:%M%P")
  end

  def date_only(time_obj)
    time_obj.strftime("%-m/%-d/%Y")
  end

end
