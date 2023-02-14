class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    new_category = Group.new(name: params[:group][:name], icon: params[:group][:icon], author: current_user)
    if new_category.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def index; end
end
