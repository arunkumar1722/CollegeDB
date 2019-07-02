require_relative 'util.rb'
require_relative 'department_change'
require_relative 'section_change'
require_relative 'display_details'
require_relative 'data_manager'
class Application
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
      dep=gets.chomp
      case dep
      when "EEE"
        DataManager.new.enroll(name,dep)
      when "MECH"
        DataManager.new.enroll(name,dep)
      when "CSE"
        DataManager.new.enroll(name,dep)
      when "CIVIL"
        DataManager.new.enroll(name,dep)
      end
      DepartmentChange.new.updateDepartment()
    when 2
      DepartmentChange.new.changeDepartment()
    when 3
      SectionChange.new.changeSection()
    when 4
      DisplayDetails.new.displayDetails()
    when 5
      puts "Exit"
      shouldContinue=false
    end
    DepartmentChange.new.updateDepartment()
  end
end
