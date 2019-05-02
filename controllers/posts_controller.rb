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

#1
  get "/" do

    @title = "Welcome to the blog"

    @posts = $posts
    erb :'posts/index'

  end

  # 2

  get "/new" do

    @post = {
      id: "",
      title: "",
      body: ""
    }

    erb :'posts/new'

  end


    post  '/' do

      # puts params
    new_post = {
        id: $posts.length,
        title: params[:title],
        body: params[:body]
    }
    $posts.push(new_post)

    redirect "/"
    end




  get '/:id' do
    id = params[:id].to_i

    @post = $posts[id]

    erb :'posts/show'

  end


  get '/:id/edit' do

    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/edit'
  end

# 6

  put '/:id' do

    id = params[:id].to_i

    post = $posts[id]

    post[:title] = params[:title]
    post[:body] = params[:body]

    $posts[id] = post

    redirect "/"

  end


# 7
  delete '/:id' do

    id = params[:id].to_i
    $post.delete_at(id)

    redirect '/'
  end




end
