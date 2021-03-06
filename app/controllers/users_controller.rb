class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

      @currentuser = User.find_by name: session[:user]


      if params[:profile] != "True"
      if @currentuser != @user      
      if !@currentuser.friends_with?(@user)
         if @user.name != session[:user]
        @currentuser.friend_request(@user) 
        #@user.accept_request(@currentuser)
        flash[:notice]="Request sent!"
        end
      else
        @currentuser.remove_friend(@user)
      end
      end

     
       if params[:accept] == "True"
        @currentuser.accept_request(@user)
        flash[:notice]="Request accepted!"
      end

      if params[:decline] == "True"
        @currentuser.decline_request(@user)
        flash[:notice]="Request declined!"
      end
    else

    end

  end


  

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
    redirect_to root_url, :notice => "Signed up!"
    else
    render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if session[:user] == @user.name
      session[:user] = nil
      redirect_to :root, :notice => "Logged out!"
      @user.destroy
    else
    @user.destroy
    respond_to do |format|
      format.html { redirect_to notes_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
