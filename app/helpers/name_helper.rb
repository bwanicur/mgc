module NameHelper

  def last_name_init(obj)
    "#{obj.first_name.capitalize} #{obj.last_name.first.capitalize}"
  end

  def full_name(obj)
    "#{obj.first_name.capitalize} #{obj.last_name.capitalize}"
  end

end
