class FavoritsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @kpts = current_user.kpts
    @favorite_kpts =[]
    @kpts.each do |kpt|
      if kpt.favorite == true
        @favorite_kpts << kpt
      end
    end
  end
end