require_relative 'util.rb'
require_relative 'department_change'
require_relative 'display_details'
require_relative 'data_manager'

# Class for Changing Section of Student
class SectionChange

  # Method for changing section
  def changeSection(college)
    puts "Change Section \nEnter Name:"
    name=gets.chomp
    puts "Select department"
    dep=gets.chomp
    puts "Select current section"
    sec=gets.chomp
    puts "Select sec to change"
    sec_change=gets.chomp
    if college[dep][sec].include?name
      college[dep][sec].delete(name)
      puts "Deleted " + name + " of " + dep + " Department " + sec + " Sec"
    end
    if college[dep][sec_change].empty? || college[dep][sec_change].length < 10
      college[dep][sec_change]<<name
    end
    Util.new.sort_sec(college)
    rollNo=Util.new.update_rollno(name,dep,sec_change,college)
    puts name + " have been enrolled to " + dep + " " + sec_change + " with roll no " + rollNo
  end
end