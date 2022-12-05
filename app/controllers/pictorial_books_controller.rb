class PictorialBooksController < ApplicationController

def index
  
end

  def new
    @pictorialbook = PictorialBook.new
  end

  def create
    @pictorialbook = PictorialBook.new(pictorialbook_params)
    if  @pictorial_book.save
      redirect_to root_path
    else
      render 'new'
    end
  end


 def edit
 end
 

  def destroy
  end

  private

  def pictorialbook_params
    params.require(:pictorialbook).permit(:plant_name, :image, :type_id, :difficulty_id, :cultivation, :data).merge(user_id: current_user.id)
  end
end
