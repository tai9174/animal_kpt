class TopsController < ApplicationController  
  
  def index
    if user_signed_in?
      redirect_to kpts_path
    end
  end
  
  def help
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to controller: :tops, action: :index
    end
  end
end