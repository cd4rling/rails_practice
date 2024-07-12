class PostsController < ApplicationController
    def create
      post = Post.new(post_params)
      if post.save
        render json: { status: 'Post created successfully', post: post }, status: :created
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def index
      posts = Post.all
      render json: posts
    end
  
    def update
      post = Post.find(params[:id])
      if post.update(post_params)
        render json: { status: 'Post updated successfully', post: post }, status: :ok
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      post = Post.find(params[:id])
      if post.destroy
        render json: { status: 'Post deleted successfully' }, status: :ok
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
  end
  