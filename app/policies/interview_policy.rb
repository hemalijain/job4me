class InterviewPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def create?
    @current_user.organisation?
  end

  def  new?
     @current_user.organisation?
  end

  def edit?
     @current_user.organisation?
  end

  def update?
     @current_user.organisation?
  end

end
