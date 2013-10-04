class RolesController < ApplicationController
  def assign
    puts "ROLE ASSIGN CALLED"
    @users = User.order("username")
    @roles = Role.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roles }
    end
  end

  def new
    @new_role = Role.new
  end

  def index
    @roles = Role.all
    @new_role = Role.new
  end

  def create
    Role.create params[:role]
    redisplay_roles
  end

  def destroy
    Role.find(params[:id].destroy)
    redisplay_roles
  end

  private

  def redisplay_roles
    redirect_to roles_path
  end

end
