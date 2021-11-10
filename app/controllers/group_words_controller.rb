class GroupWordsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_owner, only: [:new, :create, :edit, :update, :destroy]

  def index
    @group = Group.find(params[:group_id])
    @group_words = @group.group_words.where(group_id: @group_id)
  end

  def show
    @group = Group.find(params[:group_id])
    @group_word = @group.group_words.find(params[:id])
  end

  def new
    @group = Group.find(params[:group_id])
    @group_word = GroupWord.new
  end

  def create
    @group = Group.find(params[:group_id])
    @group_word = @group.group_words.new(group_word_params)
    if @group_word.save
      redirect_to  group_group_words_path, notice: "ことばを追加しました"
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @group_word = @group.group_words.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @group_word = @group.group_words.find(params[:id])
    if @group_word.update(group_word_params)
      redirect_to  group_group_words_path, notice: "ステータスを変更しました"
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @group_word = @group.group_words.find(params[:id])
    if @group.owner_id == current_user.id
      @group_word.destroy
      redirect_to  group_group_words_path, notice: "ことばを削除しました"
    else
      render 'index'
    end
  end

  def result
    @group = Group.find(params[:group_id])
    @group_word = @group.group_words.find(params[:id])
  end

  private

  def group_word_params
    params.require(:group_word).permit(:word, :status)
  end

  def ensure_correct_owner
    @group = Group.find(params[:group_id])
    unless @group.owner_id == current_user.id
      redirect_to group_group_words_path
    end
  end
end
