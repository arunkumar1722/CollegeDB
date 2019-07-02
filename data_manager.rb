require_relative 'util.rb'
require_relative 'department_change'
require_relative 'section_change'
require_relative 'display_details'
class DataManager
  $college={
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
  $stud=Hash.new
  def enroll(name,dep)
    sec=nil
    $college[dep].each do |k,v|
      if v.empty? || v.length<10
        v<<name
        sec=k
        break
      end
    end
    Util.new.sort_sec()
    rollNo=Util.new.update_rollno(name,dep,sec)
    puts name + " have been enrolled to " + dep + " " + sec + " with roll no " + rollNo
  end
end