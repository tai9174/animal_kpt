class KptsController < ApplicationController
  before_action :set_kpt, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create,:index]

  def index
    @kpts = current_user.kpts.order(start_time: :desc)
    @kpts = @kpts.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @kpt = Kpt.new
  end

  def edit
  end

  def create
    @kpt = current_user.kpts.build(kpt_params)

    respond_to do |format|
      if @kpt.save
        format.html { redirect_to kpt_url(@kpt), notice: "Kptは作成されました！" }
        format.json { render :show, status: :created, location: @kpt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kpt.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @kpt.update(kpt_params)
        format.html { redirect_to kpt_url(@kpt), notice: "Kptは更新されました!" }
        format.json { render :show, status: :ok, location: @kpt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kpt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kpt.destroy
    respond_to do |format|
      format.html { redirect_to kpts_url, notice: "Kptは削除されました!" }
      format.json { head :no_content }
    end
  end

  
  def favorits
    @kpts = current_user.kpts 
    @favorite_kpts=[]
    @kpts.each do |kpt|
      if kpt.favorite == true
        @favorite_kpts<< kpt
      end
    end
  end

  def day_kpt
  end
  
  private
  def set_kpt
    @kpt = Kpt.find(params[:id])
  end

  def kpt_params
    params.require(:kpt).permit(:keep_content, :keep_status, :problem_content, :problem_status, :try_content, :try_status, :favorite,:start_time)
  end
end
