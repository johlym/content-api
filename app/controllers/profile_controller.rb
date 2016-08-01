class ProfileController < ApplicationController
  before_filter :authenticate_user!
  def show

  end

  def regenerate
    # Explicitly setting this to the logged in user keeps user A from changing user B's key
    id = current_user.id
    @identity = Identity.find_by_user_id(id)
    @identity.destroy!

    @identity = Identity.new
    @identity.hashkey = SecureRandom.hex(n=8)
    @identity.user_id = id
    @identity.save

    redirect_to profile_path
  end
end
