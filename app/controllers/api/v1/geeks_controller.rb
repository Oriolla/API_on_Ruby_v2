class Api::V1::ApplyController < ApplicationController
  before_action :set_apply, only: [:show, :update, :destroy]


  # все заявления, фильтр по признакам прочтения и приглашения (GET);
  def index
    if params[:read] and params[:invited]
      @applies = Apply.where(read:params[:read], invited:params[:invited])
    else
      @applies = Apply.all
    end
    render json: { apply: @applies }, except: [:id, :created_at, :updated_at]
  end

  # создать новое заявление - от одного соискателя на вакансию (POST);
  def create
    @apply = Apply.new(apply_params)
    if @apply.save
      render json: @apply.as_json, status: :created
    else
      render json: {user: @apply.errors, status: :no_content}
    end
  end

  # прочитать заявление соискателя компанией (PUT);
  # пригласить соискателя компанией (PUT);
  # редактировать данные о заявлении (PUT);
  def update
    if params[:geek_id] and params[:company_id] and params[:read]
      @apply = Apply.where(geek_id:params[:geek_id])
    elsif @apply.update(apply_params)
      render json: @apply
    else
      render json: @apply.errors, status: :unprocessable_entity
    end
  end

  private
  def set_apply
    @apply = Apply.find(params[:id])
  end

  def apply_params
    params.permit(:job_id, :geek_id, :read, :invited)
  end
end

