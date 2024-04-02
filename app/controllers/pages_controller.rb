class PagesController < ApplicationController
  def home
    if current_user
      track_activity('Visit', 'visit home page')
    end
  end

end
