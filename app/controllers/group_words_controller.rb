class GroupWordsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_group_user

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
      redirect_to  group_group_words_path, notice: "テーマを追加しました"
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
    if @group.users.include?(current_user)
      @group_word.destroy
      redirect_to  group_group_words_path, notice: "テーマを削除しました"
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

  def ensure_correct_group_user
    @group = Group.find(params[:group_id])
    if !@group.users.include?(current_user)
      redirect_to groups_path
    end
  end
end
