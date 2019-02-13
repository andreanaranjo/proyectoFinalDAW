class API::V1::UploadController < ApiController
  def image
    blob = ActiveStorage::Blob.create_after_upload!(
      io: params[:file],
      filename: params[:file].original_filename,
      content_type: params[:file].content_type
    )
    render json: {filelink: url_for(blob)}
  end

  def upload_profile_pic
    # Get User from TOKEN
    if request.headers['Authorization'].present?
      decoded_auth_token = JsonWebToken.decode request.headers['Authorization'].split(' ').last
      token = HashWithIndifferentAccess.new decoded_auth_token
      begin
        miembro = Member.where(user_id: token[:user_id]).first

        blob = ActiveStorage::Blob.create_after_upload!(
          io: params[:file],
          filename: params[:file].original_filename,
          content_type: params[:file].content_type,
        )
        if miembro.profile_pic.attached?
          miembro.profile_pic.purge
        end
        miembro.profile_pic.attach blob 
        render json: {}, status: :created
      rescue ActiveRecord::RecordNotFound
        render json: {error: "User not found"}, status: :bad_request
      end
    else
      debugger
      render json: {"error": "Unauthorized"}, status: :unauthorized
    end

    # Associate the profile picture to the model.

    # Return the URL to check if the file has uploaded successfully.

  end
end