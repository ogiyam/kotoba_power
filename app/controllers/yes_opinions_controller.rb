class YesOpinionsController < ApplicationController
  before_action :set_yse_opinion

  def create
    yes_opinion = @group_word.yes_opinions.new(user_id: current_user.id)
    yes_opinion.save
  end

  def destroy
    yes_opinion = @group_word.yes_opinions.find_by(group_word_id: params[:group_word_id], user_id: current_user.id)
    yes_opinion.destroy
  end

  private

  def set_yse_opinion
    @group_word = GroupWord.find(params[:group_word_id])
  end
end
