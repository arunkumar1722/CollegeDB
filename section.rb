require_relative 'utilities'

# Class for Changing Section of Student
class Section

  # Method for changing section
  def change_section(college, student)
    puts "Enter RollNo"
    roll_no = gets.chomp
    if student.key?(roll_no)
      puts "Select section to change"
      sec_to_change = gets.chomp
      name = student[roll_no][0]
      department = student[roll_no][1]
      section = student[roll_no][2]
      department_no = student[roll_no][3]
      section_no = student[roll_no][4]
      if college[department][sec_to_change].length < 10
        college[department][section].delete_at(section_no-1)
        puts "Deleted " + name + " of " + department + " Department " + section + " Sec"
        college[department][sec_to_change] << name
        roll_no = Utilities.new.update_rollno(name, department, sec_to_change, college, student)
        puts name + " have been enrolled to " + department + " " + sec_to_change + " with roll no " + roll_no
      else puts "Section full"
      end
    else puts "Wrong rollno....Student record not found"
    end
  end

end