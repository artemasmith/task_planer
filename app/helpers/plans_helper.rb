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
    Department.all.each { |d| result << [d.title,d.id] }
    result
  end
  
  #check if user have permission in the project
  #data = {project_id:,user_id,permission}
  def have_permission?(data)
    result = false
    User.find(data[:user_id]).roles_for_project(Project.find(data[:project_id])).each do |r|
      if r.permissions.include?(data[:permission])
        result = true
        break
      end
    end
    result
  end
  
end
