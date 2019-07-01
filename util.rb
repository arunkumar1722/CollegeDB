require_relative 'dep_eee'
require_relative 'dep_mech'
require_relative 'dep_cse'
require_relative 'dep_civil'
class Util
  def changeDepartment(eee,mech,cse,civil)
    puts "Change Department \nEnter Name:"
    name=gets.to_s
    puts "Select current department"
    curr_dep=gets.chomp
    puts "Choose department to change : "
    dep_change=gets.chomp

    case curr_dep
    when "EEE","eee"
      eee.delete_at(eee.index(name))
      puts "Deleted 1 rec from eee"
    when "MECH","mech"
      mech.delete_at(mech.index(name))
      puts "Deleted 1 rec from mech"
    when "CSE","cse"
      cse.delete_at(cse.index(name))
      puts "Deleted 1 rec from cse"
    when "CIVIL","civil"
      civil.delete_at(civil.index(name))
      puts "Deleted 1 rec from civil"
    end

    case dep_change
    when "EEE","eee"
      puts "Added 1 rec to eee"
      e=DepEee.new(name)
      e.enroll(name,eee)
    when "MECH","mech"
      puts "Added 1 rec to mech"
      m=DepMech.new(name)
      m.enroll(name,mech)
    when "CSE","cse"
      puts "Added 1 rec to cse"
      cs=DepCse.new(name)
      cs.enroll(name,cse)
    when "CIVIL","civil"
      puts "Added 1 rec to civil"
      civ=DepCivil.new(name)
      civ.enroll(name,civil)
    end
  end

  def display(eee,mech,cse,civil,stud,data)
    puts "Display Details"
    puts "1.Display Full Database \n2.Display Department Details \n3.Display Student Details"
    c=gets.to_i
    case c
    when 1
      puts data
    when 2
      puts "Select Department: EEE MECH CSE CIVIL"
      dep=gets.chomp
      case dep
      when "EEE","eee"
        puts eee
      when "MECH","mech"
        puts mech
      when "CSE","cse"
        puts cse
      when "CIVIL","civil"
        puts civil
      end
    when 3
      puts "Enter Student RollNo"
      r=gets.chomp
      puts stud[r]
    end
  end
  end