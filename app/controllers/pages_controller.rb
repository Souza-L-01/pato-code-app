class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[landing dashboard]
  layout 'landing', only: [:landing]
  

  def landing
  end

  def dashboard
  end
end
