module ApplicationHelper
  
  def test
    a = "hello"
  end
  
  #retourne les utilisateurs avec le statut (position) "responsable" mais pas pour un projet donné
  def getresponsableUser
    array =Array.new
    
    User.all.each do |u|
      if u.position == "responsable"
         array.push(u.name)
      end
                  end
  return array
  end
  
  
 
  
end
