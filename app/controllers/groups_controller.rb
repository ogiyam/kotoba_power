class GroupsController < ApplicationController
  before_action :authenticate_user!
  # before_action:ensure_correct_user, only: [:destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
    if @group.save
      redirect_to groups_path, notice:"新しいグループを作成しました"
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.users.delete(current_user)
      redirect_to groups_path, notice:"グループを退会しました"
    else
      render 'show'
    end
  end

  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  # def ensure_correct_user
  #   @group = Group.find(params[:id])
  #   unless @group.owner_id == current_user.id
  #     redirect_to groups_path
  #   end
  # end
end
