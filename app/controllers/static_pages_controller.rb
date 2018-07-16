class StaticPagesController < ActionController::Base
 #include is inheritence to get the contents of the helper. 
 #This is to avoid writing repetative code and is therefore achieveing DRYness
 include UsersHelper

   
  #if index is requeste from the browser and it is routed in routs it will run index in views

  def home
   @time = Time.now.strftime("%B %e, %Y at %I:%M %p")
   
   @task = Task.new
   @tasks = Task.all
 
      
  if session[:user_id]  != nil 
  @user_email = User.find_by(id: session[:user_id]).email
  
  
  
 
    #____________________________________________________

    
 user_email=@user_email

#here the task should be the last task for this user to cinfirm with their ldap automatically filled

if user_email == 'TaskMaster@vadim.cool'
   @task = Task.new
   @tasks = Task.all.order(:created_at => :desc).limit(100) 
   
   
else   
  @task = Task.where(["ldap = ?", user_email]).last
 @tasks= Task.where("ldap like (?) ",@user_email).order(:created_at => :desc).limit(100) 
  
  
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

end  
    
    @ldaps||= User.all
    
    @status||= User.all
 



 

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:ldap, :instruction, :status)
    end
      #____________________________________________________
      
  
   else
     
     
       #
     #@helper ="helper works"
  end


   #now compare that filter name with student
  # @myUser = current_user
  # st = "vadimmalakhovski@hotmail.com" #@user_email
  
  
 
      
  
  end

 def about
 
 end
 
 

      

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
