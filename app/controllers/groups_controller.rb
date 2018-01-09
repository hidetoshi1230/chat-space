class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    binding.pry
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました。"
    else
      flash.now[:alert] = "グループ作成に失敗しました。"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: "グループを更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def index
    @groups = current_user.groups
  end

  private
  def group_params
    tmp_params = params.require(:group).permit(:group_name, :user_ids => [])
    if tmp_params[:user_ids].nil?
      tmp_params[:user_ids] = []
    end
    tmp_params[:user_ids] << "#{current_user.id}"
    return tmp_params
  end
end
