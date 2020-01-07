class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @entries = current_user.entries.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = current_user.entries.new(entry_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @entry.save
        flash[:success] = 'Entry was successfully created.'
        format.html { redirect_to @entry }
        format.json { render :show, status: :created, location: @entry }
      else
        flash.now[:error] = 'Sorry, an error has occured'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        flash[:success] = 'Entry was successfully updated.'
        format.html { redirect_to @entry }
        format.json { render :show, status: :ok, location: @entry }
      else
        flash.now[:error] = 'Sorry, an error has occured'
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      flash[:success] = 'Entry was successfully destroyed.'
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:feeling, :description, :day, :hour)
    end
end
