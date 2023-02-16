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

  def index
    @groups = Group.where(author_id: current_user.id)
    @budgets = Budget.all
  end

  def show
    @budgets = Budget.where(group_id: params[:id]).order('created_at DESC')
    @total_price = 0
    @budgets.each do |budget|
      @total_price += budget.amount
    end
  end
end
