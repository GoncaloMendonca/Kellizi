class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @resource = User.new
  end

  def dashboard
  end

end
