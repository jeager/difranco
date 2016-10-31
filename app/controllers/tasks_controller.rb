class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  autocomplete :product, :name

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    search = params[:search].nil? ? '' : params[:search].downcase
    @tasks = Task.where("LOWER(client_name) LIKE ?", "%#{search}%")
    respond_to do |format|
      format.js {}
      format.html {}
    end

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.status = Task.status.first
    # task_params[:tasks_products_attributes].each do |p|
    #   puts p[:product_id]
    # end

    respond_to do |format|
      if @task.save
        @task.tasks_products.each do |t|
          product = Product.find_by_id(t.product)
          product.update(quantity_in_stock: product.quantity_in_stock - t.quantity)
        end
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:client_name, :value, :discount, :final_value, :status, tasks_products_attributes:[:id, :product_id, :task_id, :file_name, :quantity, :obs])
    end
end
