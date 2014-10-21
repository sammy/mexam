class ChaptersController < ApplicationController
  
  def index
    @exams = Exam.all
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

  def update
    @chapter = Chapter.find(params[:id])
    if @chapter
      @chapter.update_attributes(chapter_params)
      flash[:success] = "Chapter has been updated!"
      redirect_to chapters_path
    end
  end

  def get_exam_chapters
    @chapters = Chapter.where(exam_id: params[:id])
    render partial: "chapters", locals: {chapters: @chapters} 
  end

  def show_subchapters
    @subchapters = Chapter.find(params[:id]).subchapters
    render partial: "subchapters", locals: {subchapters: @subchapters}
  end

  private

  def chapter_params
    params.require(:chapter).permit!
  end

end