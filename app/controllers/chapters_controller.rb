class ChaptersController < ApplicationController
  
  def index
    @chapters = Chapter.all
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      flash[:success] = "Chapter created!"
      redirect_to new_chapter_path
    end
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end


  private

  def chapter_params
    params.require(:chapter).permit!
  end

end