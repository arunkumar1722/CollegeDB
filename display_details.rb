require_relative 'util.rb'
require_relative 'department_change'
require_relative 'section_change'
require_relative 'data_manager'
#Class for Displaying Student Details
class Details

  #Method for Display Details
  def displayDetails(college,stud)
    puts "Display Details"
    puts "1.Display Full Database \n2.Display Department Details \n3.Display Student Details \n4.Display Every Student Details Roll No Wise"
    c=gets.to_i
    case c
    when 1
      puts college
    when 2
      puts "Select Department: EEE MECH CSE CIVIL"
      dep=gets.chomp
      puts college[dep]
    when 3
      puts "Enter Student RollNo"
      rollNo=gets.chomp
      if stud[rollNo].nil?
        puts "Record not found"
      else
      puts "Name: " +  stud[rollNo][0] + "\nDepartment: " +  stud[rollNo][1] + "\nSection: " +  stud[rollNo][2] + "\nDep No: " +  stud[rollNo][3].to_s + "\nSec No: " +  stud[rollNo][4].to_s
      end
      when 4
      puts stud
    end
  end
end