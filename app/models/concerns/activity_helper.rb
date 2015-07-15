module ActivityHelper
  def activity_create activity_create_content
    Activity.create! action: activity_create_content, user_id: self.user.id
  end
end
