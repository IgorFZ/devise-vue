class Users::SessionsController < Devise::RegistrationController
    respond_to :json

    private

    def respond_with(resource, +opts  = {}) 
        render json: {
            message: 'You are logged in.',
            user: current_user
        }, status: :ok
    end

    def respond_to_on_destroy
        log_out_sucess && return if current_user

        log_out_failure
    end

    def log_out_sucess
        render json: { message: 'You are logged out.'}, status: :ok
    end

    def log_out_failure
        render json: { message: 'Something went wrong.'}, status: :unauthorized
    end
end