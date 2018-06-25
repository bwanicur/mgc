module PhoneHelper

  def phone_with_country_code(phone_num)
    # for now only supporting USA
    country_code = "+1"
    "#{country_code}#{phone_num}"
  end
end
