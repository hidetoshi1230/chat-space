class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash.now[:success] = "グループを作成しました。"
      redirect_to root_path
    else
      flash.now[:alert] = "グループ作成に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :user_ids => [])
  end

end
