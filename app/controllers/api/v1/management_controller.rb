class ManagementController < ApiController
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
end