module DashboardsHelper

  def full_name user
    if user.first_name.nil?
      return user.email
    else
      return user.full_name
    end
  end
end
