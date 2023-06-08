class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  layout 'landing', only: [:landing]

  def landing
  end

  def home
  end
end
