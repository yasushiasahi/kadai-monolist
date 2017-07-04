class ItemsController < ApplicationController
  before_action :require_user_logged_in

  def new
    @items = []

    @keyword = params[:keyword]
    if @keyword
      results_A = Amazon::Ecs.item_search(
        @keyword,
        search_index:  'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
        power: "Not kindle"
      )
      
      results_A.items.each do |item|
        item_A = Item.find_or_initialize_by(read_A(item))
        @items << item_A
      end

      results_R = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })

      results_R.each do |result|
        # 扱い易いように Item としてインスタンスを作成する（保存はしない）
        item = Item.find_or_initialize_by(read(result))
        @items << item
      end
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @want_users = @item.want_users
    @have_users = @item.have_users
  end

end
