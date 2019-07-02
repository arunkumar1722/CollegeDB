
require_relative 'department_change'
require_relative 'section_change'
require_relative 'display_details'
require_relative 'data_manager'

#CLass for Utility functions
class Util

  #Method to find strength of Department
  def calc_length()
    l=0
    $college.each do |key,value|
      value.each do |k,v|
        l+=v.length
      end
    end
    return l
  end

  #Method for Sorting each section of dep
  def sort_sec()
    $college.each do |key,value|
      value.each do |k,v|
        v.sort!
        #puts "Sorted"
        #puts v
      end
    end
  end

  #Method for finding Department Roll No
  def find_depno(name,dep)
    depNo=1
    $college[dep].each do |key,value|
      value.each do |x|
        if x!=name
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
  def find_sec(name,dep,sec)
    secNo=1
    $college[dep][sec].each do |e|
      if(e!=name)
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
  def update_rollno(name,dep,sec)
    depNo=self.find_depno(name,dep)
    secNo=self.find_sec(name,dep,sec)
    rollNo= dep + depNo + sec + secNo
    $stud[rollNo]=[name,dep,sec]
    return rollNo
  end
end