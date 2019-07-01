class DepMech
  def initialize(name)
    puts "Name is " + name
  end

  def enroll(name,mech,stud,data)
    puts "MECH Enroll"
    if mech.length<=30
      mech<<name
    else
      puts "Department full"
    end
    mech.sort!
    depNo=mech.find_index(name)+1
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
    rollNo= "MEC" + depNo.to_s + sec + secNo.to_s
    puts "You have been enrolled to MECH " + sec + " with roll no " + rollNo
    stud[rollNo]=[name,"MECH","Section " + sec]
    data["MECH"][sec][name]=rollNo
  end
end