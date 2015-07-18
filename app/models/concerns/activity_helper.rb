module ActivityHelper
  def activity_create action_type, user
    Activity.create! action_type: action_type, object_relative_id: self.id, user_id: user.id
  end

  def activity_destroy
    Activity.find_by(object_relative_id: self.id).destroy
  end
end
