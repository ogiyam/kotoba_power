class GroupsController < ApplicationController
  before_action :authenticate_user!

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
      if @group.owner_id == current_user.id
        @group.destroy
        redirect_to groups_path, notice:"グループを削除しました"
      else
        @group.users.delete(current_user)
        redirect_to groups_path, notice:"グループを退会しました"
      end
  end

  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to groups_path, notice:"グループに参加しました"
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
