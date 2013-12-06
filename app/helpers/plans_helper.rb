module PlansHelper
#  def javascript url
#    raw "<script type =\"application/x-javascript\">" +
#	render "#{url}.js" +
#	"</script>"
 # end 
 
  #project_id - str, current_user - id of user
  def get_possible_performers(project_id,current_user)
    result = []
    Project.find(project_id).members.each do |m|
      result << [m.name, m.user_id]
    end
    result
  end
  
  def get_departments
    result = []
    Department.all.each {|d| result << [d.title,d.id]}
    result
  end
  
end
