class DatabasesController < ApplicationController
  before_action :set_database, only: [:show, :edit, :update, :destroy]
  respond_to :html
 


  def index
    @databases = Database.all
    respond_with(@databases)
  end

  def show
    respond_with(@database)
  end

  def new
    @database = Database.new
    respond_with(@database)
  end

  def edit
  end

  def create
    @database = Database.new(database_params)
    @database.save
    respond_with(@database)
  end

  def update
    @database.update(database_params)
    respond_with(@database)
  end

  def destroy
    @database.destroy
    respond_with(@database)
  end

  private
    def set_database
      @database = Database.find(params[:id])
    end

    def database_params
      params.require(:database).permit(:name, :address, :comment)
    end
end
