class ProfileController < ApplicationController
  before_filter :authenticate_user!
  def show
    @hashkey = check_for_hashkey
  end

  def regenerate
    # Explicitly setting this to the logged in user keeps user A from changing user B's key
    id = current_user.id
    begin
      @identity = Identity.find_by_user_id(id).destroy
    rescue
      puts ''
    end

    @identity = Identity.new
    @identity.hashkey = SecureRandom.hex(n=8)
    @identity.user_id = id
    @identity.save

    redirect_to profile_path
  end

  def check_for_hashkey
    begin
      return current_user.identity.hashkey
    rescue
      return false
    end
  end

  private

  def create_hashkey

  end
end
