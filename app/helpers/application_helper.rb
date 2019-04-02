module ApplicationHelper
  def full_title page_title
    base_title = t("base.base_title")
    page_title.blank? ? base_title : page_title + " | " + base_title
  end

  def get_role_name
    if current_user.admin?
      t "generals.admins"
    else
      t "generals.client"
    end
  end

  def render_side_bar
    if logged_in?
      if current_user.admin?
        render "layouts/admin_sidebar"
      else
        render "layouts/client_sidebar"
      end
    else
      render "layouts/guest_sidebar"
    end
  end
end
