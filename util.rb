require_relative 'department_change'
require_relative 'section_change'
require_relative 'display_details'
require_relative 'data_manager'

#CLass for Utility functions
class Util

  #Method for Sorting each section of dep
  def sort_sec(college)
    college.each do |key,value|
      value.each do |k,v|
        v.sort!
      end
    end
  end

  #Method for finding Department Roll No
  def find_depno(name,dep,college)
    depNo=0
    college[dep].each do |key,value|
      value.each do |x|
        if x<=name
          depNo+=1
        else break
        end
      end
    end
    if depNo < 9
      depNo="0"+depNo.to_s
    else
      depNo=depNo.to_s
    end
    return depNo
  end

  #Method for finding Section RollNo
  def find_sec(name,dep,sec,college)
    secNo=0
    college[dep][sec].each do |e|
      if e<=name
        secNo+=1
      else break
      end
    end
    if secNo < 9
      secNo="0"+secNo.to_s
    else
      secNo=secNo.to_s
    end
    return secNo
  end

  #Method to update RollNo of every student
  def update_rollno(name,dep,sec,college,stud)
    self.sort_sec(college)
    depNo=self.find_depno(name,dep,college)
    secNo=self.find_sec(name,dep,sec,college)
    dep = dep=="MECH" || dep=="CIVIL"  ? (dep=="MECH" ? "MEC" : "CVL" ) : dep
    rollNo= dep + depNo + sec + secNo
    stud[rollNo]=[name,dep,sec,depNo.to_i,secNo.to_i]
    return rollNo
  end

end