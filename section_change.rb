require_relative 'util.rb'
require_relative 'department_change'
require_relative 'display_details'
require_relative 'data_manager'

# Class for Changing Section of Student
class Section

  # Method for changing section
  def changeSection(college,stud)
    puts "Enter RollNo"
    roll_no=gets.chomp
    name=stud[roll_no][0]
    dep=stud[roll_no][1]
    sec=stud[roll_no][2]
    dep_no=stud[roll_no][3]
    sec_no=stud[roll_no][4]
    puts "Select sec to change"
    sec_change=gets.chomp
    if college[dep][sec].include?name
      college[dep][sec].delete_at(sec_no-1)
      puts "Deleted " + name + " of " + dep + " Department " + sec + " Sec"
      stud.delete(roll_no)
      puts "Deleted record in stud also"
    else puts "Student record not found"
    end
    if college[dep][sec_change].empty? || college[dep][sec_change].length < 10
      college[dep][sec_change]<<name
    else puts "Section full"
    end
    rollNo=Util.new.update_rollno(name,dep,sec_change,college,stud)
    puts name + " have been enrolled to " + dep + " " + sec_change + " with roll no " + rollNo
  end
end