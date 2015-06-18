require_relative 'app/person_data'
require_relative 'app/prepare_person_data'

task :default => [:display_output]

namespace :display_output do
  PreparePersonData.initialize_array_from_files(PersonData, "data/comma_delimited.txt", "data/pipe_delimited.txt", "data/space_delimited.txt")

  desc "Print records sorted by gender (female first), then by last name asc"
  task :first_task do
    puts "Records sorted by gender (female first), then by last name asc"
    PersonData.sort_all_by_gender_then_last_name.each do |pd|
      puts pd.ordered_attributes
    end
  end

  desc "Print records sorted by birth date, asc"
  task :second_task do
    puts "Records sorted by birth date, asc"
    PersonData.sort_all_by_birth_date.each do |pd|
      puts pd.ordered_attributes
    end
  end

  desc "Print records sorted by last name, desc"
  task :third_task do
    puts "Records sorted by last name, desc"
    PersonData.sort_all_by_last_name("desc").each do |pd|
      puts pd.ordered_attributes
    end
  end

  desc "Print all three outputs"
  task :print_all do
    Rake::Task['display_output:first_task'].invoke
    puts ""
    Rake::Task['display_output:second_task'].invoke
    puts ""
    Rake::Task['display_output:third_task'].invoke
  end

end