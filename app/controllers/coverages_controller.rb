class CoveragesController < ApplicationController
def index
end

def show
  @coverage = coverage.find(params[:id])
end
end
