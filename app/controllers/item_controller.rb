class ItemController < AppController

  get '/items' do
    if logged_in?
      @items = current_user.items
      erb :'items/index'
    else
      redirect to('/login')
    end
  end

  get '/items/new' do
    if logged_in?
      @current_user
      erb :'items/create_item'
    else
      redirect to('/login')
    end
  end

  post '/items' do
    if logged_in?
      @item = current_user.items.build(params)
      if !@item.save
        @errors = @item.errors.full_messages
        erb :'/items/create_item'
      else
        redirect to('/items')
      end
    else
      redirect to('/login')
    end
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    if logged_in? && @item.user == current_user
      erb :'items/show_item'
    else
      redirect to('/login')
    end
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    if logged_in? && @item.user == current_user
      @item = Item.find(params[:id])
      @user = User.find(session[:user_id])
      erb :'items/update_item'
    else
      redirect to('/login')
    end
  end

  patch '/items/:id' do
    @item = Item.find(params[:id])
    @item.title = params[:title]
    @item.description = params[:description]
    @item.date = params[:date]
    @item.character = params[:character]
    if !@item.save
      @errors = @item.errors.full_messages
      erb :'/items/update_item'
    else
      redirect to("/items/#{@item.id}")
    end
  end

  delete '/items/:id/delete' do
    @item = item.find(params[:id])
    if logged_in? && @item.user == current_user
      @item.destroy
      redirect to('/items')
    else
      redirect to('/login')
    end
  end


end