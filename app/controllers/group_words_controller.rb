class GroupWordsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:new, :create]

  def index
    @group = Group.find(params[:group_id])
    @group_words = @group.group_words.where(group_id: @group_id)
  end

  def new
    @group = Group.find(params[:group_id])
    @group_word = GroupWord.new
  end

  def create
    @group = Group.find(params[:group_id])
    @group_word = @group.group_words.new(group_word_params)
    if @group_word.save
      redirect_to  group_groupword_index_path(@group), notice: "ことばを追加しました"
    else
      render 'new'
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @group_word = GroupWord.find(params[:id])
    if @group.owner_id == current_user.id
      @group_word.destroy
      redirect_to  group_groupword_index_path, notice: "ことばを削除しました"
    else
      render 'index'
    end
  end

  private

  def group_word_params
    params.require(:group_word).permit(:word)
  end

  def ensure_correct_user
    @group = Group.find(params[:group_id])
    unless @group.owner_id == current_user.id
      redirect_to group_groupword_index_path
    end
  end
end
