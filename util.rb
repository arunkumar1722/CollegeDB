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

  #Method for converting single digit to 2 digit
  def to_2digit(number)
    if number < 9
      number="0"+number.to_s
    else
      number=number.to_s
    end
    return number
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
    return to_2digit(depNo)
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
    return to_2digit(secNo)
  end

  #Method to shrink Department
  def shrink_dep(dep)
    dep = dep=="MECH" || dep=="CIVIL"  ? (dep=="MECH" ? "MEC" : "CVL" ) : dep
    return dep
  end

  #Method to update RollNo of every student
  def update_rollno(name,dep,sec,college,stud)
    self.sort_sec(college)
    depNo=self.find_depno(name,dep,college)
    secNo=self.find_sec(name,dep,sec,college)
    dep=self.shrink_dep(dep)
    rollNo= dep + depNo + sec + secNo
    stud[rollNo]=[name,dep,sec,depNo.to_i,secNo.to_i]
    return rollNo
  end

end