require_relative 'utilities'
require_relative 'data_manager'

# Class for Changing Department
class Department

  # Method to Change Department
  def change_department(college, student)
    puts "Enter RollNo"
    roll_no = gets.chomp
    if student.key?(roll_no)
      puts "Choose department to change : "
      department_to_change = gets.chomp
      name = student[roll_no][0]
      curr_department = student[roll_no][1]
      section = student[roll_no][2]
      dep_no = student[roll_no][3]
      section_no = student[roll_no][4]
      college[curr_department][section].delete_at(section_no-1)
      puts "Deleted " + name + " of " + curr_department + " Department" + " of " + section + " Section"
      DataManager.new.enroll(name, department_to_change, college, student)
    else puts "Wrong roll no...Student record not found"
    end
  end

  # Method to Update Department
  def update_department(college, student)
    Utilities.new.sort_all_section(college)
    student.clear
    college.each do |department, section|
      department_no = 0
      section.each do |section_name, students|
        section_no = 0
        students.each do |name|
          department_no += 1
          section_no += 1
          rollNo = Utilities.new.shrink_department(department) + Utilities.new.to_2digit(department_no) + section_name + Utilities.new.to_2digit(section_no)
          student[rollNo]=[name, department, section_name, department_no, section_no]
        end
      end
    end
  end

end