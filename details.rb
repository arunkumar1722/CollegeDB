#Class for Displaying Student Details
class Details

  #Method for Display Details
  def display_details(college,stud)
    puts "Display Details"
    puts "1.Display Full Database \n2.Display Department Details \n3.Display Student Details \n4.Display Every Student Details Roll No Wise"
    choice = gets.to_i
    case choice
    when 1
      puts college
    when 2
      puts "Select Department: EEE MECH CSE CIVIL"
      department = gets.chomp
      puts college[department]
    when 3
      puts "Enter Student RollNo"
      roll_no = gets.chomp
      if stud[roll_no].nil?
        puts "Record not found"
      else
      puts "Name: " +  stud[roll_no][0] + "\nDepartment: " +  stud[roll_no][1] + "\nSection: " +  stud[roll_no][2] + "\nDep No: " +  stud[roll_no][3].to_s + "\nSec No: " +  stud[roll_no][4].to_s
      end
      when 4
      puts stud
    end
  end
end