class StoryController < ApplicationController




  def create
    @story = Story.new(story_params)

    @story.save
    redirect_to story_index_path
  end

  def update
    @story = Story.find(params[:id])

    if @story.update(story_params)
      redirect_to story_index_path
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def index
    @stories = Story.all
    @dictionary = Dictionary.all

    
     # @dictionary = Dictionary.order('created_at DESC')
     @stories_total_count = Story.all.count
     #http://stackoverflow.com/questions/12988543/grouping-created-at-by-date-only
     # @created_ats = @dictionary.group_by { |c| c.created_at.beginning_of_day }
  end


  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    redirect_to story_index_path
  end

  private
    def story_params
      params.require(:story).permit(:content)
    end

end
