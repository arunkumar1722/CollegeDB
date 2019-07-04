#!/Users/arunkumarm/.rvm/rubies/ruby-2.6.3/bin/ruby
require_relative 'department'
require_relative 'section'
require_relative 'details'
require_relative 'data_manager'

# Class for running Demo Application
class Application

  puts "Welcome to  CollegeDB"
  #Initializes HashMap
  college = DataManager.new.init_hashmap

  #HashMap for storing RollNo for every student
  student = Hash.new

  should_continue = true
  while should_continue
    puts "Choose Action: \n1.Enroll \n2.Change Department \n3.Change Section \n4.Display Details \n5.Exit"
    choice = gets.to_i

    case choice
    when 1
      puts "Enroll \nEnter Name:"
      name = gets.chomp
      puts "Select Department: EEE MECH CSE CIVIL"
      department = gets.chomp
      DataManager.new.enroll(name, department, college, student)
    when 2
      Department.new.change_department(college, student)
    when 3
      Section.new.change_section(college, student)
    when 4
      Details.new.display_details(college, student)
    when 5
      puts "Exit"
      should_continue = false
    end
    Department.new.update_department(college, student)
  end
end

# TODO:
# Match exactly as a question