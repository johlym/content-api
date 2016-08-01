class NodesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :validate_user_provided_token

  def index
    node = Node.find_by_id(params[:id])
    if node_created_by_token(node.user.identity.hashkey, params[:token])
      render json: node, status: 200
    else
      render json: {}, status: 403
    end
  end

  def create
    node = Node.new(node_params)
    node.user_id = get_user_for_provided_token(params[:token])
    if node.save
      render :nothing => :true, status: 204
    else
      render json: {errors: node.errors.full_messages}, status: 422
    end
  end

  def update
    node = Node.find(params[:id])
    if node_created_by_token(node.user.identity.hashkey, params[:token])
      if node.update(node_params)
        render :nothing => :true, status: 204
      else
        render json: {errors: node.errors.full_messages}, status: 422
      end
    else
      render json: {}, status: 403
    end
  end

  def destroy
    begin
      node = Node.find(params[:id])
      if node_created_by_token(node.user.identity.hashkey, params[:token])
        node.destroy
        render :nothing => :true, status: 204
      else
        render json: {}, status: 403
      end
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: 404
    end

  end

  private

  def get_identity_object_by_hashkey(t)
    Identity.find_by_hashkey(t)
  end

  def validate_user_provided_token
    t = params[:token]
    unless get_identity_object_by_hashkey(t)
      false
    end
  end

  def get_user_for_provided_token(t)
    get_identity_object_by_hashkey(t).user_id
  end

  def node_created_by_token(n, t)
    if n == t
      true
    else
      false
    end
  end

  def node_params
    params.require(:node).permit(:identifier, :name, :data)
  end

end
