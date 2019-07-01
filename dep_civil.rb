class DepCivil
  def initialize(name)
    puts "Name is " + name
  end

  def enroll(name,civil,stud,data)
    puts "CIVIL Enroll"
    if civil.length<=30
      civil<<name
    else
      puts "Department full"
    end
    civil.sort!
    depNo=civil.find_index(name)+1
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
    rollNo= "CVL" + depNo.to_s + sec + secNo.to_s
    puts "You have been enrolled to CIVIL " + sec + " with roll no " + rollNo
    stud[rollNo]=[name,"CIVIL","Section " + sec]
    data["CIVIL"][sec][name]=rollNo
  end
end