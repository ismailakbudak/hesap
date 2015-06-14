class Hq::DashboardController < Hq::ApplicationController

  add_breadcrumb I18n.t('dashboard.index'), :hq_dashboard_index_path

  def index
  end

end