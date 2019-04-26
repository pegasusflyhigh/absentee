class UsersController < ApplicationController
  before_action :authentiicate_user!
end
