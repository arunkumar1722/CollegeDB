require_relative 'utilities'

# Class for Managing College Database and enrolling students
class DataManager

  #Method for initializing HashMap for database storage
  def init_hashmap
    #HashMap for Student Database
    college = {
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
    return college
  end

  # Method for Enrolling Students into department
  def enroll(name, department, college, student)
    section = nil
    college[department].each do |section_name, students|
      if students.length < 10
        students << name
        section = section_name
        break
      end
    end
    if section.nil?
      puts "Department full"
    else
      roll_no = Utilities.new.update_rollno(name, department, section, college, student)
      puts name + " have been enrolled to " + department + " " + section + " with roll no " + roll_no
    end
  end
end