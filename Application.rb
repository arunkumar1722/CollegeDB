#!/Users/arunkumarm/.rvm/rubies/ruby-2.6.3/bin/ruby
require_relative 'util.rb'
require_relative 'department_change'
require_relative 'section_change'
require_relative 'display_details'
require_relative 'data_manager'

# Class for running Demo Application
class Application
  #HashMap for Student Database
  college={
      "EEE"=>{
          "A"=>[],
          "B"=>[],
          "C"=>[],
      },
      "MECH"=>{
          "A"=>[],
          "B"=>[],
          "C"=>[],
      },
      "CSE"=>{
          "A"=>[],
          "B"=>[],
          "C"=>[],
      },
      "CIVIL"=>{
          "A"=>[],
          "B"=>[],
          "C"=>[],
      }
  }
  $stud=Hash.new

  puts "Welcome to  CollegeDB"
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
      case department
      when "EEE"
        DataManager.new.enroll(name,department,college)
      when "MECH"
        DataManager.new.enroll(name,department,college)
      when "CSE"
        DataManager.new.enroll(name,department,college)
      when "CIVIL"
        DataManager.new.enroll(name,department,college)
      end
      DepartmentChange.new.updateDepartment(college)
    when 2
      DepartmentChange.new.changeDepartment(college)
    when 3
      SectionChange.new.changeSection(college)
    when 4
      DisplayDetails.new.displayDetails(college)
    when 5
      puts "Exit"
      shouldContinue=false
    end
    DepartmentChange.new.updateDepartment(college)
  end
end
