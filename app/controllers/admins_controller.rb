class AdminsController < ApplicationController
  before_action :authenticate_admin!
  layout "admins"

  def daily_statistic
    @daily_statistics = DailyStatistic.all.order(date: :desc)
  end

  def weekly_statistic
    @weekly_statistics = WeeklyStatistic.all.order(start_date: :desc)
  end
  
end
