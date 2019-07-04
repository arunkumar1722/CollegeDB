#CLass for Utility functions
class Utilities

  #Method for Sorting each section of department
  def sort_all_section(college)
    college.each do |department, section|
      section.each do |section_name, students|
        students.sort!
      end
    end
  end

  #Method for converting single digit to 2 digit
  def to_2digit(number)
    (number < 9) ? "0" + number.to_s : number.to_s
  end

  #Method for finding Department Roll No
  def find_department_no(name, department, college)
    department_no=0
    college[department].each do |section_name, students|
      students.each do |student|
        if student <= name
          department_no += 1
        else break
        end
      end
    end
    to_2digit(department_no)
  end

  #Method for finding Section RollNo
  def find_sec_no(name, department, section, college)
    section_no=0
    college[department][section].each do |student|
      if student <= name
        section_no += 1
      else break
      end
    end
    to_2digit(section_no)
  end

  #Method to shrink MECH and CIVIL Department
  def shrink_department(department)
    if department == "MECH" || department == "CIVIL"
      department == "MECH" ? "MEC" : "CVL"
    else
      department
    end
  end

  #Method to update RollNo of every student
  def update_rollno(name, department, section, college, student)
    self.sort_all_section(college)
    department_no = self.find_department_no(name, department, college)
    section_no = self.find_sec_no(name, department, section, college)
    department = self.shrink_department(department)
    roll_no= department + department_no + section + section_no
    student[roll_no]=[name, department, section, department_no.to_i, section_no.to_i]
    return roll_no
  end

end