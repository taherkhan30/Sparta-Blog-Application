class PostController < Sinatra::Base

  puts File.join(File.dirname(__FILE__), '..')
  puts ("------------------")

  #set the root of the parent directory of the current file

  set :root, File.join(File.dirname(__FILE__), '..')

#sets the views directory correctly
  set :views, Proc.new {File.join(root, "views")}

  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
    id: 0,
    title: "post0",
    body: "this is the pre-post"
  },

  {
    id: 1,
    title: "post1",
    body: "this is the first post"
  },

  {
    id: 2,
    title: "post2",
    body: "this is the second post"
  } ]


  get "/" do

    @title = "Welcome to the blog"

    # @posts = $posts
    @posts = Post.all
    erb :'posts/index'

  end

  # 2

  get "/new" do

    @post = Post.new

    erb :'posts/new'

  end


    post  '/' do

      post = Post.new
      post.title = params[:title]
      post.body = params[:body]

      post.save

    redirect "/"
    end




  get '/:id' do
    id = params[:id].to_i
    #
    # @post = $posts[id]
    @post = Post.find(id)

    erb :'posts/show'

  end


  get '/:id/edit' do

    id = params[:id].to_i
    # @post = $posts[id]
    @post = Post.find(id)

    erb :'posts/edit'
  end



  put '/:id' do

    id = params[:id].to_i

    post = Post.find(id)

    post.title = params[:title]
    post.body = params[:body]
    #
    # $posts[id] = post

    post.save

    redirect "/"

  end


  delete '/:id' do
    
    Post.destroy(id)
    id = params[:id].to_i
    # $post.delete_at(id)

    redirect '/'
  end




end
