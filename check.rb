college={
    "eee"=>{
        "A"=>["eeea","eeea1"],
        "B"=>["eeeeb","eeeb1"],
        "C"=>["eeec","eeec1"],
    },
    "mech"=>{
        "A"=>["ma"],
        "B"=>["mb"],
        "C"=>["mc"],
    },
    "cse"=>{
        "A"=>["ca"],
        "B"=>["cb"],
        "C"=>["cc"],
    },
    "civil"=>{
        "A"=>[],
        "B"=>[],
        "C"=>[],
    }
}
=begin
=0
x="eeea1"
college.each do |key,value|
  value.each do |k,v|
    if v.include?x
       v.delete(x)
      puts "deleted"
    end
  end
end
puts l

college["eee"]["A"].each do |x|
  puts x
end

college["civil"].each do |k,v|
  if v.empty? || v.length<10
    puts "sec " + k + " can be added"
  end
end

college.each do |k,v|
  v.each do |k1,v1|
    v1.each do |x|
      puts x,k,k1
    end
  end
end

a=[]
s="A"
puts a.length
=end
def to_2digit(number)
  if number < 9
    number="0"+number.to_s
  else
    number=number.to_s
  end
  return number
end
stud=Hash.new
college.each do |dep,sec|
  depNo=0
  #puts dep
  #puts sec
  sec.each do |sec_name,students|
    secNo=0
    #puts sec_name
    #puts students
    students.each do |name|
      #Utilities.new.update_rollno(x, k, k1, college, stud)
      depNo+=1
      secNo+=1
      dep = dep=="MECH" || dep=="CIVIL"  ? (dep=="MECH" ? "MEC" : "CVL" ) : dep
      rollNo= dep + to_2digit(depNo) + sec_name + to_2digit(secNo)
      stud[rollNo]=[name,dep,sec_name,depNo,secNo]
      #puts name
    end
  end
end
puts stud