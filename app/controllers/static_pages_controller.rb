class StaticPagesController < ActionController::Base
 #include is inheritence to get the contents of the helper. 
 #This is to avoid writing repetative code and is therefore achieveing DRYness
 include UsersHelper

   
  #if index is requeste from the browser and it is routed in routs it will run index in views

  def home
  # @time = Time.now.strftime("%B %e, %Y at %I:%M %p")

    
   @task = Task.new
   @tasks = Task.all

 user_email=@user_email 
 @time = Time.now.strftime("%e")

 
 
      
 if session[:user_id]  != nil 
  @user_email = User.find_by(id: session[:user_id]).email
   @user_language = User.find_by(id: session[:user_id]).last_name
   
   @tasks_default = [
       @user_language, "ENHANCED_TEXT_CREATIVE", 
       @user_language, "TEXT", 
       @user_language, "IMAGE" , 
       @user_language, "MOVING_IMAGE",
       @user_language, "DISPLAY_TEMPLATE", 
       @user_language, "TANGRAM_EXPANDED_CREATIVES", 
       @user_language, "TANGRAM_AD_PLACEHOLDER",
       @user_language,"TANGRAM_SITE_LINKS_EXTENSION",
       @user_language,"TANGRAM_LOCATION_EXTENSION",
       @user_language, "TANGRAM_TABLE_EXTENSION",
       @user_language,"TANGRAM_CALLOUT_EXTENSION",
       @user_language, "VIDEO",
       @user_language,"YOUTUBE_PYV",
       @user_language,"VIDEO_CTD",
       @user_language,"APP_DOWNLOAD_IN_PLAY",
       @user_language,"DIGITAL_MEDIA",
       @user_language, "HTML5_CTD",
       @user_language,"TANGRAM_APP_EXTENSION", 
       @user_language,"CALL_ONLY_CREATIVE", 
       @user_language,"GMAIL_REMARKETING_ADS", 
       @user_language,"GMAIL_DURIAN_BRIDGE", 
       @user_language,"LIGHTBOX",
       @user_language,"TANGRAM_DYNAMIC_STRUCTURED_SNIPPETS_EXTENSION", 
       @user_language,"TANGRAM_STRUCTURED_SNIPPETS_EXTENSION", 
       @user_language,"TANGRAM_MESSAGING_EXTENSION",
       @user_language,"TANGRAM_MESSAGING_EXTENSION", 
       @user_language,"TANGRAM_PROMOTION_EXTENSION", 
       @user_language,"TANGRAM_DISPLAY_CREATIVE_AUTOMATION_MEDIA_ASSETS", 
       @user_language,"TANGRAM_DISPLAY_CREATIVE_AUTOMATION_TEXT_ASSETS",
       @user_language,"APP_ASSETS_FOREGROUND_IMAGE", 
       @user_language,"APP_ASSETS_BACKGROUND_IMAGE", 
       @user_language,"APP_ASSETS_TEXT", 
       @user_language, "APP_ASSETS_CORE", 
       @user_language, "APP_ASSETS_DESTINATION", 
       @user_language, "APP_ASSETS_VIDEO", 
       @user_language,"IMAGE_DURIAN_BRIDGE",
       @user_language,"MOVING_IMAGE_DURIAN_BRIDGE", 
       @user_language,"MOVING_IMAGE_DURIAN_BRIDGE", 
       @user_language,"DIGITAL_MEDIA_DURIAN_BRIDGE", 
       @user_language, "VIDEO_DURIAN_BRIDGE", 
       @user_language,"VIDEO_CTD_DURIAN_BRIDGE", 
       @user_language,"MRA_ASSET_TEXT", 
       @user_language,"MRA_ASSET_IMAGE", 
       @user_language,"MRA_CREATIVE", 
       @user_language,"MRA_CREATIVE_INSTANCE", 
       @user_language,"ENHANCED_DISPLAY_CREATIVE", 
       @user_language, "KEYWORD", 
       @user_language, "TANGRAM_DYNAMIC_SITE_LINKS_EXTENSION"]
 
 
    #____________________________________________________

    
 user_email=@user_email
 
     
#here the task should be the last task for this user to cinfirm with their ldap automatically filled

if user_email == 'TaskMaster@vadim.cool'
   @task = Task.new
   @tasks = Task.all.order(:created_at => :desc).limit(100) 
   
   
else   
  @task = Task.where(["ldap = ?", user_email]).last
 @tasks= Task.where("ldap like (?) ",@user_email).order(:created_at => :desc).limit(100) 
 @single_last_task = Task.where(["ldap = ?", user_email]).last.read_attribute("created_at").strftime("%e")
 #@single_last_task.now
 

  
  
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
      params.require(:task).permit(:ldap, :instruction, :status, :done)
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
