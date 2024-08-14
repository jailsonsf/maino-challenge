class PagesController < ApplicationController
  include ApplicationHelper

  before_action :require_login
end
