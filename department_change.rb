require_relative 'util.rb'
require_relative 'section_change'
require_relative 'display_details'
require_relative 'data_manager'

# Class for Changing Department
class Department

  # Method to Change Department
  def changeDepartment(college,stud)
    puts "Enter RollNo"
    roll_no=gets.chomp
    puts "Choose department to change : "
    dep_change=gets.chomp
    name=stud[roll_no][0]
    curr_dep=stud[roll_no][1]
    sec=stud[roll_no][2]
    dep_no=stud[roll_no][3]
    sec_no=stud[roll_no][4]
    if college[curr_dep][sec].include?name
        college[curr_dep][sec].delete_at(sec_no-1)
        puts "Deleted " + name + " of " + curr_dep + " Department" + " of " + sec + "Section"
        stud.delete(roll_no)
        puts "Deleted record in stud also"
    else puts "Student record not found"
    end
    DataManager.new.enroll(name,dep_change,college,stud)
  end

  # Method to Update Department
  def updateDepartment(college,stud)
    puts "UD invoked"
    Util.new.sort_sec(college)
    college.each do |k,v|
      v.each do |k1,v1|
        v1.each do |x|
          Util.new.update_rollno(x, k, k1, college, stud)
        end
      end
    end
  end
end