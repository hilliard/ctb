class AdminController < ApplicationController
  def users
    @users = User.all
  end

  def delete_user
    if params[:id] == current_user.id.to_s
      flash.now[:error] = 'You cannot delete yourself!'
      @users = User.all
      render :action => :users
    else
      User.find_by_id(params[:id]).delete
      @users = User.all
      render :action => :users
    end
  end

  def roles
    @roles = Role.all
  end

  def delete_roles
    if params[:id] == current_role.id.to_s
      flash.now[:error] = 'You cannot delete your last role!'
      @roles = roles.all
      render :action => :roles
    else
      Role.find_by_id(params[:id]).delete
      @roles = Role.all
      render :action => :roles
    end
  end

  def update
    params[:user] ||= User.find(params[:id])
    params[:user][:role_ids] ||= []
    @user = User.find(params[:id])
    puts "Update Attibutes"
    @user.role_ids = params[:user][:role_ids]
    respond_to do |format|
      if @user.save
        format.html { redirect_to(role_assign_path, :notice => 'Role was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

end