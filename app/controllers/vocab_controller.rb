class VocabController < ApplicationController
  def create
    @dictionary = Dictionary.new(dictionary_params)

    @dictionary.save
    redirect_to root_url
  end

  def update
    @dictionary = Dictionary.find(params[:id])

    if @dictionary.update(dictionary_params)
      redirect_to root_url
    end
  end

  def edit
    @dictionary = Dictionary.find(params[:id])
  end

  def index
     @dictionary = Dictionary.order('created_at DESC')
     @dictionary_total = Dictionary.all
     #http://stackoverflow.com/questions/12988543/grouping-created-at-by-date-only
     @created_ats = @dictionary.group_by { |c| c.created_at.beginning_of_day }
  end

  def reset
    @dictionary = Dictionary.find(params[:id])
    @dictionary.update_attributes(:created_at => Time.now, :revise_phase1 => nil,
        :revise_phase2 => nil,
        :revise_phase3 => nil,
        :revise_phase4 => nil )
    redirect_to(:back)
  end

  def destroy
    @dictionary = Dictionary.find(params[:id])
    @dictionary.destroy

    redirect_to root_url
  end

  private
    def dictionary_params
      params.require(:dictionary).permit(:name, :remark)
    end

end
