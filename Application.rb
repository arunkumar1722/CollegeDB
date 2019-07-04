#!/Users/arunkumarm/.rvm/rubies/ruby-2.6.3/bin/ruby
require_relative 'department'
require_relative 'section'
require_relative 'details'
require_relative 'data_manager'

# Class for running Demo Application
class Application
  puts "Welcome to  CollegeDB"
  #Initializes HashMap
  college=DataManager.new.init_hashmap
  #HashMap for storing RollNo for every student
  stud=Hash.new
  shouldContinue = true
  while shouldContinue
    puts "Choose Action: \n1.Enroll \n2.Change Department \n3.Change Section \n4.Display Details \n5.Exit"
    c=gets.to_i
    case c
    when 1
      puts "Enroll \nEnter Name:"
      name=gets.chomp
      puts "Select Department: EEE MECH CSE CIVIL"
      department=gets.chomp
      DataManager.new.enroll(name,department,college,stud)
    when 2
      Department.new.changeDepartment(college,stud)
    when 3
      Section.new.changeSection(college,stud)
    when 4
      Details.new.displayDetails(college,stud)
    when 5
      puts "Exit"
      shouldContinue = false
    end
    Department.new.updateDepartment(college,stud)
  end
end
# TODO: Formatting
# Match exactly as a question
# Naming conventions