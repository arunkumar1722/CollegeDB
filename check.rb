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
l=0
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
