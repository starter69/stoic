class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    binding.pry
    @users = User.all
  end

end
