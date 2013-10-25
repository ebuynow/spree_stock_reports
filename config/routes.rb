Spree::Core::Engine.routes.draw do
  get 'admin/reports/stock', controller: 'admin/reports', action: 'stock', as: 'stock_admin_reports'
  post 'admin/reports/stock', controller: 'admin/reports', action: 'stock'
end
