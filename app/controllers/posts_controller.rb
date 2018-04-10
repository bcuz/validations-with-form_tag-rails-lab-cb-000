class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)

      # If--and only if--the post is valid, do what we usually do.
      # @post.save
      # This returns a status_code of 302, which instructs the browser to
      # worry about re-reading it from the database)
      redirect_to post_path(@post)
    else
      # If the post is invalid, hold on to @post, because it is now full of
      # useful error messages, and re-render the :new page, which knows how
      # to display them alongside the user's entries.
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
