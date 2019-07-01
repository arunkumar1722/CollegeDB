class DepEee
  def initialize(name)
    puts "Name is " + name
  end

  def enroll(name,eee,stud,data)
    puts "EEE Enroll"
    if eee.length<=30
      eee<<name
    else
      puts "Department full"
    end
    eee.sort!
    depNo=eee.find_index(name)+1
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
    rollNo= "EEE" + depNo.to_s + sec + secNo.to_s
    puts "You have been enrolled to EEE " + sec + " with roll no " + rollNo
    stud[rollNo]=[name,"EEE","Section " + sec]
    data["EEE"][sec][name]=rollNo
  end

  def check_vacancy(eee)
    return (eee.length+1)<=30
  end

  def deroll(name,eee)
    if eee.include?(name)
      eee.delete_at(eee.index(name))
    end
  end
end