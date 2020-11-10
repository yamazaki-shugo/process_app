class NoticesController < ApplicationController
  def index
    @notice = Notice.new
  end
end
