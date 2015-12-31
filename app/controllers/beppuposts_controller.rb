class BeppupostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]
  	before_action :authenticate_student!, except: [:index, :show]

    def index
      @beppuposts = Beppupost.all.order("created_at DESC")
    end

    def show
    end

    def new
      @beppupost = current_student.beppuposts.build
    end
    def create
      @beppupost = current_student.beppuposts.build(post_params)

      if @beppupost.save
        redirect_to @beppupost
      else
        render 'new'
      end
    end
    def edit
    end

    def update
  		if @beppupost.update (post_params)
  			redirect_to @beppupost
  		else
  			render 'edit'
  		end

  	end


    def destroy
      @beppupost.destroy
      redirect_to beppuposts_path
    end

    private

    def find_post
      @beppupost = Beppupost.find(params[:id])
    end


    def post_params
      params.require(:beppupost).permit(:title, :content, :photo)
    end
end
