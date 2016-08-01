class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
    @identity = Identity.new
    @identity.hashkey = SecureRandom.hex(n=8)
    @identity.user_id = user.id
    @identity.save
    '/profile' # Or :prefix_to_your_route
  end
end