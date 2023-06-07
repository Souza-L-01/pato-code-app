class LanguagesController < ApplicationController
  def index
    @language = Language.all
  end

  def show
    @language = Language.find(:id)
  end
end
