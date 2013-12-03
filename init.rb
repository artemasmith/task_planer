Redmine::Plugin.register :task_planner do
  name 'Task Planner plugin'
  author 'Artem Kuznetsov'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  project_module :planned_tasks do
   permission :views_my_plans, plans: [:index, :show]
  end
  menu :project_menu, :planned_tasks, {:controller => 'plans', :action => 'index'}, :caption=> :planned_tasks, :last=>true, :param =>:project_id
end

module UserPatch
    def self.included(base)
        base.class_eval do
            has_many :plan, foreign_key: :id_owner
            has_many :plan,  foreign_key: :id_performer
            has_many :task
        end
    end
end
module GroupPatch
    def self.included(base)
        base.class_eval do
            has_one :department
        end
    end
end

User.send(:include, UserPatch)
Group.send(:include, GroupPatch)

