class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def favorite_text
    @favorite_exists ? 'UnFavorite' : 'Favorite'
  end

  helper_method :favorite_text
end
