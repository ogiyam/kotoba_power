class GroupWordsController < ApplicationController

  def index
    @groups = Group.find(params[:group_id])
    @group_words = GroupWord.where(group_id: @group_id)
  end

  def new
    @group = Group.find(params[:group_id])
    @group_word = GroupWord.new
  end

  def create
    @group = Group.find(params[:group_id])
    @group_word = GroupWord.new(group_word_params)
    if @group_word.save
      redirect_to group_groupword_path, notice: "ことばを追加しました"
    else
      render 'new'
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @group_word = GroupWord.find(params[:id])
    if @group.owner_id == current_user.id
      @group_word.destroy
      redirect_to group_groupword_path, notice: "ことばを削除しました"
    else
      render 'index'
    end
  end

  private

  def group_word_params
    params.require(:group_word).permit(:user_id, :group_id, :word)
  end
end
