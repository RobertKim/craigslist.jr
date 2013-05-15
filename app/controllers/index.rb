get '/' do
  # Look in app/views/index.erb
  @category = Category.all
  erb :index
end

get '/post/create' do
  @category = Category.find_or_create_by_name(name: params[:name])
  erb :create_post
end

post '/createpost' do
  
  @category = Category.find_or_create_by_name(params[:name])
  @post = Post.new(title: params[:title], text: params[:text], category_id: @category.id)
  @post.make_secure_hex
  @post.save
  
  redirect to "/post/#{@post.id}" 
end

get '/post/:post_id' do
  @post = Post.find(params[:post_id])
  erb :post
end

get '/category/:category_id' do
  @category = Category.find(params[:category_id])
  @posts = Post.where(category_id: params[:category_id])
  erb :category
end

get '/edit/:post_id' do
  @post = Post.find_by_id(params[:post_id])

  erb :edit
end

post '/edit/:post_id' do
  @post = Post.find(params[:post_id])
  @post.update_attributes(title: params[:title], text: params[:text])

  redirect to "/post/#{@post.id}"  
end


get '/delete/:post_id' do
  @post = Post.find(params[:post_id])
  @post.destroy

  redirect "/category/#{@post.category_id}"
end
