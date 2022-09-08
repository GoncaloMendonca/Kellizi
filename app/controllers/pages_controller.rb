class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @resource = User.new
  end

  def dashboard
    @categories = Category.all
  end

  def my_profile
    current_user.save
  end

end
