class TodoListsController < ApplicationController
  before_action :set_project, only: [:create, :update]

  # POST /projects
  # POST /projects.json
  def create
    @project.todo_lists.new(todo_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Todo added successfully.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @todo = @project.todo_lists.find(params[:id])
    @todo.finished = !@todo.finished

    respond_to do |format|
      if @todo.save
        format.json { render json: :ok, status: :ok }
      else
        format.json { render json: :error, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo_list).permit(:todo)
    end
end
