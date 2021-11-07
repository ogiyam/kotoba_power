class NoOpinionsController < ApplicationController
   before_action :set_no_opinion

  def create
    no_opinion = @group_word.no_opinions.new(user_id: current_user.id)
    no_opinion.save
  end

  def destroy
    no_opinion = @group_word.no_opinions.find_by(group_word_id: params[:group_word_id], user_id: current_user.id)
    no_opinion.destroy
  end

  private

  def set_no_opinion
    @group_word = GroupWord.find(params[:group_word_id])
  end
end
