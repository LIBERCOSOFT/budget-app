class BudgetsController < ApplicationController
  def new
    @budget = Budget.new
    @categories = Group.where(author_id: current_user.id)
  end

  def create
    new_budget = Budget.new(name: params[:budget][:name], amount: params[:budget][:amount], group_id: params[:budget][:group_id], author: current_user)
    if new_budget.save
      redirect_to budgets_path
    else
      render :new
    end
  end
end
