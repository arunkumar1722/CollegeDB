require_relative 'util.rb'
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
    stud.clear
    college.each do |dep,sec|
      depNo=0
      sec.each do |sec_name,students|
        secNo=0
        students.each do |name|
          depNo+=1
          secNo+=1
          dep=Util.new.shrink_dep(dep)
          rollNo= dep + Util.new.to_2digit(depNo) + sec_name + Util.new.to_2digit(secNo)
          stud[rollNo]=[name,dep,sec_name,depNo,secNo]
        end
      end
    end
  end

end