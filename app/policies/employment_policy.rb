class EmploymentPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def create?
    @current_user.user?
  end

  def  new?
     @current_user.user?
  end

  def edit?
     @current_user.user?
  end

  def update?
     @current_user.user?
  end


  def schedule_interview?
   @current_user.organisation?
  end



end
