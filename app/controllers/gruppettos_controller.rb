class GruppettosController < ApplicationController
  before_action :set_gruppetto, only: [:show]

  def index
  end

  def show
    authorize @gruppetto
  end

  def new
  end

  def create
  end

  private

  def set_gruppetto
    @gruppetto = Gruppetto.find(params[:id])
  end
end
