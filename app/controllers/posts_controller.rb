class PostsController < ApplicationController
    load_and_authorize_resource
     def index
    @posts=Post.all
    end

    def new 
        @post =Post.new
    end


    def show
        @post=Post.find(params[:id])
    end

   

    def create
       # render plain:params[:post].inspect
       #@post = Post.new(post_params)
       @post=Post.new(post_params)
       @post.author_id = current_user.id
      if(@post.save)
       redirect_to @post
      else
        render 'new'
      end
    end
    private def post_params
    params.require(:post).permit(:title,:body)
    end


    def edit
    @post=Post.find(params[:id])
    end

    def update
        @post=Post.find(params[:id])

        if(@post.update(post_params))
            redirect_to @post
        else
          render 'edit'
        end

    end


def destroy
   
    @post=Post.find(params[:id])
    
     @post.destroy
    redirect_to posts_path
end


end
