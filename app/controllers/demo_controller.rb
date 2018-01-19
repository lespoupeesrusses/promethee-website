class DemoController < ApplicationController
  before_action :load
  layout 'application_with_nav'

  protected

  def load
    @data = Demo.data
    @localization = Demo.localization
  end
end
