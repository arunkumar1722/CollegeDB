class DepCse
  def initialize(name)
    puts "Name is " + name
  end

  def enroll(name,cse,stud,data)
    puts "CSE Enroll"
    if cse.length<=30
      cse<<name
    else
      puts "Department full"
    end
    cse.sort!
    depNo=cse.find_index(name)+1
    if depNo>=1 and depNo<=10
      sec="A"
      secNo=depNo
      if secNo<10
        depNo="0"+depNo.to_s
        secNo="0"+secNo.to_s
      end
    elsif depNo>=11 and depNo<=20
      sec="B"
      secNo=depNo-10
    else
      sec="C"
      secNo=depNo-20
    end
    rollNo= "CSE" + depNo.to_s + sec + secNo.to_s
    puts "You have been enrolled to CSE " + sec + " with roll no " + rollNo
    stud[rollNo]=[name,"CSE","Section " + sec]
    data["CSE"][sec][name]=rollNo
  end
end