class RelationshipsController < ApplicationController
  def create
    user = User.find_by_id(params[:follow_id])
    if user
      current_user.follow(params[:follow_id]) unless current_user.following?(user)
    end
    redirect_to request.referer
  end

  def destroy
    Relationship.find(params[:id]).destroy
    redirect_to request.referer
  end
  
  
end
