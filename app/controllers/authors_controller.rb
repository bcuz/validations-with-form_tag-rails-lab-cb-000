class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
  @author = Author.new(author_params)

  if @author.valid?
    # If--and only if--the post is valid, do what we usually do.
    @author.save
    # This returns a status_code of 302, which instructs the browser to
    # worry about re-reading it from the database)
    redirect_to author_path(@author)
  else
    # If the post is invalid, hold on to @post, because it is now full of
    # useful error messages, and re-render the :new page, which knows how
    # to display them alongside the user's entries.
    render :new
  end

end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
