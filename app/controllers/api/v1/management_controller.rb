class Api::V1::ManagementController < ApiController
  def get_member_id_from_user
    if request.headers['Authorization'].present?
      decoded_auth_token = JsonWebToken.decode request.headers['Authorization'].split(' ').last
      token = HashWithIndifferentAccess.new decoded_auth_token
      begin
        miembro = Member.where(user_id: token[:user_id]).first
        render json: {member_id: miembro.id}, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: {error: "User not found"}, status: :not_found
      end
    end
  end

  def announcement_by_members
    Announcement.where(member_id: params[:member_id])
  end

  def get_members_assigned_to_event
    Member.find(Assigment.where(event_id: params[:member_id]))
  end

  def get_registered_events
    array = []
    Assignment.where(member_id: params[:member_id]).each do |assigment|
      array.append assigment.task_id
    end
    array2 = []
    Task.find(array).each do |task|
      array2.append task.event_id
    end
    array3 = []
    Event.find(array2).each do |event|
      array3.append({event: event, tasks: Task.where(event_id: event.id)})
    end
    render :json => array3
  end
end