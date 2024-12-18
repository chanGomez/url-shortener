class ViewsController < ApplicationController
  before_action :set_link

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to root_path, alert: "Not Found"
  end

  def show
    redirect_to @link.url, allow_other_host: true
    @link.views.create(ip: request.ip, user_agent: request.user_agent)
  end
end