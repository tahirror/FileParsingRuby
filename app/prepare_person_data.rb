require_relative 'person_data'
require_relative '../module/read_files'

class PreparePersonData 
  extend ReadFiles

  def self.prepare(string)
    spacing_normalized = adjust_spacing(string)
    middle_initial_removed = remove_middle_name(spacing_normalized)
    correct_positions = adjust_birthdate_position(middle_initial_removed)
    map_to_hash(correct_positions)
  end

  def self.adjust_spacing(string)
    string.gsub(/[,]|[|]/, "").squeeze(" ").strip
  end

  def self.remove_middle_name(string)
    array = string.split(" ")
    array.delete_at(2) if array.size == 6
    array
  end

  def self.adjust_birthdate_position(array)
    array[4] =~ (/\d/) ? array.insert(3, array.delete_at(4)) : array
  end

  def self.map_to_hash(attrs_array)
    { last_name: attrs_array[0], first_name: attrs_array[1],
      gender: attrs_array[2], birth_date: attrs_array[3],
      favorite_color: attrs_array[4] }
  end

end