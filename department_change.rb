require_relative 'util.rb'
require_relative 'section_change'
require_relative 'display_details'
require_relative 'data_manager'

# Class for Changing Department
class DepartmentChange

  # Method to Change Department
  def changeDepartment(college)
    puts "Change Department \nEnter Name:"
    name=gets.chomp
    puts "Select current department"
    curr_dep=gets.chomp
    puts "Choose department to change : "
    dep_change=gets.chomp
    college[curr_dep].each do |k,v|
      if v.include?name
        v.delete(name)
        puts "Deleted " + name + " of " + curr_dep + " Department"
      end
    end
    DataManager.new.enroll(name,dep_change,college)
  end

  # Method to Update Department
  def updateDepartment(college)
    Util.new.sort_sec(college)
    college.each do |k,v|
      v.each do |k1,v1|
        v1.each do |x|
          Util.new.update_rollno(x,k,k1,college)
        end
      end
    end
  end
end