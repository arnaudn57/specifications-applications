class DashboardsController < ApplicationController
    before_action :authenticate_user!

    def index
        @specifications = Specification.all
    end
end
