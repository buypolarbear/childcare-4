class ReportsController < ApplicationController

  #############################################
  # This method will be available at the url
  # /reports/test_action. It will prepare variables
  # needed by the view that will be rendered next
  # (test_action.html.erb)
  ##############################################
  def test_action
	@variable_the_view_can_access = User.find(all)
  end
end
