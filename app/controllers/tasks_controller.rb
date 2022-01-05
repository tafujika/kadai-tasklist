class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end
    
    def show
        set_task
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)

        if @task.save
            flash[:success] = 'タスク　が正常に作成されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスク　の作成に失敗しました'
            render :new
        end
    end
    
    def edit
        set_task
    end
    
    def update
        set_task

        if @task.update(task_params)
            flash[:success] = 'タスク は正常に更新されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスク の更新に失敗しました'
            render :edit
        end
    end
    
    def destroy
        set_task
        @task.destroy
        
        flash[:success] = 'タスク は正常に削除されました'
        redirect_to tasks_url
    end
    
    private

    def set_task
    @task = Task.find(params[:id])
  end

    # Strong Parameter
    def task_params
        params.require(:task).permit(:content)
    end
end
