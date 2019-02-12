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
    render :json => Announcement.where(member_id: params[:member_id])
  end

  def get_members_assigned_to_event
    render :json => Member.find(Assigment.where(event_id: params[:member_id]))
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

  def get_users_registered_event
    render :json => Task.where(event_id: params[:event_id]).joins('join assignments on task.id = assignments.task_id ')
  end

  def get_member_metrics
    # numberAssignment with tasks completed
    relation = Assignment.where(member_id: params[:member_id]).joins('join tasks on tasks.id = assignments.task_id')
    num_assignments_task_completed = relation.where('tasks.completed = true').count
    num_assignments_task_total = relation.count
    num_events_participated = Assignment.where(member_id: params[:member_id]).joins('join tasks on tasks.id = assignments.task_id join events on tasks.event_id = events.id').count()
    promedio_calificaciones = Assignment.where(member_id: params[:member_id]).average(:score)
    anuncios_publicados = Announcement.where(member_id: params[:member_id]).count
    render :json => {
      eventos_participados: num_events_participated,
      tareas: {
        cumplidas: num_assignments_task_completed,
        pendientes: num_assignments_task_total - num_assignments_task_completed
      }, calificacion_promedio: promedio_calificaciones,
      anuncios_publicados: anuncios_publicados
    }

  end

  def get_tasks_for_event
    render :json => Task.where(event_id: params[:event_id])
  end
end