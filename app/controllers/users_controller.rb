
class UsersController < Clearance::UsersController
    
#  before_action :find_user, only: [:show, :edit, :update]
# def index
#     @users = User.all
# end
def profile
    redirect_to user_path(current_user)
end
  
def create
   # @user = User.new(user_params)
# byebug
   @user = user_from_params
   
   if @user.save
     sign_in @user
     redirect_back_or url_after_create
   else
     render template: "users/new"
   end
end

 def show
   @user = User.find_by_id(params[:id])
 end

 def edit
    @user = User.find_by_id(params[:id])
 end

 def update
   @user = User.find_by_id(params[:id])
   if @user.update_attributes(user_params)
     flash[:notice] = "Successfully Updated"
   else
     flash[:notice] = @user.errors.full_messages
   end
     render 'edit'
 end

private

 # def user_params
 #   params.require(:user).permit(:username, :email, :password, :name, :encrypted_password, :confirmation_token)
 # end #
 
  def user_from_params
   # byebug
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    username = user_params.delete(:username)
    name = user_params.delete(:name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.username = username
      user.name = name
    end
  end

  def user_params
   # byebug
    params[Clearance.configuration.user_parameter] || Hash.new
  end

 
end
