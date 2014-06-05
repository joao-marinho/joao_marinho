class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show

  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_param)
    @group.save
    redirect_to @group
  end

  def edit

  end

  def update
    @group.update(group_param)
    redirect_to @group
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_param
    params.require(:group).permit(:title, :description)
  end

end
