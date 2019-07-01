require_relative 'dep_eee'
require_relative 'dep_mech'
require_relative 'dep_cse'
require_relative 'dep_civil'
require_relative 'util'
class Application
  eee=Array.new
  mech=Array.new
  cse=Array.new
  civil=Array.new
  data=Hash.new{|h,k| h[k]=Hash.new(&h.default_proc) }
  stud=Hash.new
  puts "Welcome to  CollegeDB"
  shouldContinue = true
  while shouldContinue
    puts "Choose Action: \n1.Enroll \n2.Change Department \n3.Change Section \n4.Display Details \n5.Exit"
    c=gets.to_i
    case c
    when 1
      puts "Enroll \nEnter Name:"
      name=gets.chomp
      puts "Select Department: EEE MECH CSE CIVIL"
      dep=gets.chomp
      case dep
      when "EEE","eee"
        DepEee.new(name).enroll(name,eee,stud,data)
      when "MECH","mech"
        DepMech.new(name).enroll(name,mech,stud,data)
      when "CSE","cse"
        DepCse.new(name).enroll(name,cse,stud,data)
      when "CIVIL","civil"
        DepCivil.new(name).enroll(name,civil,stud,data)
      end
    when 2
      Util.new.changeDepartment(eee,mech,cse,civil)
    when 3
      #Util.new.changeSection(eee,mech,cse,civil)
    when 4
      Util.new.display(eee,mech,cse,civil,stud,data)
    when 5
      puts "Exit"
      shouldContinue=false
    end
  end
end
