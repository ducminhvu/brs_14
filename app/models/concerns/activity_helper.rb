module ActivityHelper
  def activity_create action_type, user
    Activity.create! action_type: action_type, object_relative_id: self.id, user_id: user.id
  end

  def activity_destroy action_type
    activity = Activity.find_by object_relative_id: self.id,
      action_type: Settings.action_type.index(action_type)
    activity.destroy
  end
end
