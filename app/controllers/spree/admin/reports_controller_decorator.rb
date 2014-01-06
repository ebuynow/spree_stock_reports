Spree::Admin::ReportsController.class_eval do
  def stock
    params[:q] = { } unless params[:q]

    if params[:q][:count_on_hand_gteq].blank?
      params[:q][:count_on_hand_gteq] = -1000
    end

    if params[:q][:count_on_hand_lteq].blank?
      params[:q][:count_on_hand_lteq] = 100000
    end

    @search = Spree::StockItem.joins(:variant, :stock_location).order('spree_variants.sku ASC').ransack(params[:q])
    @stock_items = @search.result
  end
end

Spree::Admin::ReportsController.add_available_report!(:stock)
