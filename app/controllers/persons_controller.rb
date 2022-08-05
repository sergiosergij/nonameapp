class PersonsController < ApplicationController
  def profile
    @person = current_user
  end
end
