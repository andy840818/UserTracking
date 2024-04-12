class SummaryMailer < ApplicationMailer
  default from: 'from@example.comd'

  def daily_summary(admin, metrics)
    @admin = admin
    @metrics = metrics
    mail(to: @admin.email, subject: 'Daily Summary for #{Date.yesterday}')
  end

  def weekly_summary(admin, metrics)
    @admin = admin
    @metrics = metrics
    week_range = "#{(Date.yesterday-6.days).strftime("%B %d, %Y")} - #{Date.yesterday.strftime("%B %d, %Y")}"
    mail(to: @admin.email, subject: "Weekly Summary for #{week_range}")
  end
end
