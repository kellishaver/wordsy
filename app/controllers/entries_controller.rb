class EntriesController < ApplicationController
  def index
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(model_params)
    if @entry.save
      redirect_to root_path, notice: "#{@entry.word} Saved"
    else
      render :new
    end
  end

  def show
    @entry = Entry.find_by word: params[:id].upcase!
  end

  def destroy
    @entry = Entry.find params[:id]
    @entry.destroy
    redirect_to root_path, notice: "#{@entry.word} Deleted"
  end

  private

  def model_params
    params.require(:entry).permit(:word)
  end

end
