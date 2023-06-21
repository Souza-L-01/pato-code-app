class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[landing dashboard],
  layout 'landing', only: %i[landing dashboard ]
  

  def landing
  end

  def dashboard
  end
end
