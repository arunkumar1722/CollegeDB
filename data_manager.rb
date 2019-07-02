require_relative 'util.rb'
require_relative 'department_change'
require_relative 'section_change'
require_relative 'display_details'

# Class for Managing College Database and enrolling students
class DataManager

  # Method for Enrolling Students into department
  def enroll(name,dep,college)
    sec=nil
    college[dep].each do |k,v|
      if v.empty? || v.length<30
        if v.include?(name)
          puts "Already record with same name present...Assigning new RollNo"
          v<<name
          sec=k
          Util.new.assign_new_rollno(name,dep,sec,college)
          return
        else
          puts "Adding new record...."
          v<<name
          sec=k
          Util.new.sort_sec(college)
          rollNo=Util.new.update_rollno(name,dep,sec,college)
          puts name + " have been enrolled to " + dep + " " + sec + " with roll no " + rollNo
          return
        end
      end
    end
    if sec.nil?
      puts "Department full"
    end
  end
end