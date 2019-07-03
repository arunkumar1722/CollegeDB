require_relative 'util.rb'
require_relative 'department_change'
require_relative 'section_change'
require_relative 'display_details'

# Class for Managing College Database and enrolling students
class DataManager

  # Method for Enrolling Students into department
  def enroll(name, dep, college, stud)
    sec=nil
    college[dep].each do |k,v|
      if v.length<30
        v<<name
        sec=k
        break
      end
    end
    if sec.nil?
      puts "Department full"
    else
      rollNo=Util.new.update_rollno(name,dep,sec,college,stud)
      puts name + " have been enrolled to " + dep + " " + sec + " with roll no " + rollNo
    end
  end
end