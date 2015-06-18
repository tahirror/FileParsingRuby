require_relative '../module/normalize_data'

class PersonData
  include NormalizeData

  @attributes = [ :last_name, :first_name, :gender, :birth_date, :favorite_color ]
  attr_reader *@attributes

  PEOPLE = []

  def initialize(args)
    @last_name = args.values[0].to_s if args.values[0].to_s
    @first_name = args.values[1].to_s if args.values[1].to_s
    @gender = map_gender(args.values[2].to_s) if args.values[2].to_s
    @birth_date = map_date(args.values[3].to_s) if args.values[3].to_s
    @favorite_color = args.values[4].to_s if args.values[4].to_s
    PEOPLE << self
  end

  def self.all
    PEOPLE
  end

  def ordered_attributes
    "#{last_name} #{first_name} #{gender} #{birth_date} #{favorite_color}"
  end

  @attributes.each do |attr|
    self.define_singleton_method("sort_all_by_#{attr}") do |arg=nil|
      sorted = all.sort_by { |per| per.send(attr) }
      arg == "desc" ? sorted.reverse : sorted
    end
  end

  def self.sort_all_by_gender_then_last_name
    self.all.sort_by { |pd| [pd.gender, pd.last_name] }
  end

end