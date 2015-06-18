require 'date'

module NormalizeData
  
  def map_gender(gender)
    case gender
      when "M", "m" then gender = "Male"
      when "F", "f" then gender = "Female"
    end
    gender
  end

  def map_date(date)
    if date.include? '-'
      date.gsub!("-", "/")
    elsif date.include? '/'
      date.gsub!("/", "/")
    end
  end

end