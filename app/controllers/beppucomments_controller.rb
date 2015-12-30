class BeppucommentsController < ApplicationController



  	def create
  		@beppupost = Beppupost.find(params[:beppupost_id])
  		@beppucomment = @beppupost.beppucomments.create(params[:beppucomment].permit(:comment))
  		@beppucomment.student = current_student if current_student
  		@beppucomment.save

  		if @beppucomment.save
  			redirect_to beppupost_path(@beppupost)
  		else
  			render 'new'
  		end
  	end

  	def destroy
  		@beppupost = Beppupost.find(params[:beppupost_id])
  		@beppucomment = @beppupost.beppucomments.find(params[:id])
  		@beppucomment.destroy
  		redirect_to beppupost_path(@beppupost)
  	end
  	def edit
  		@beppupost = Beppupost.find(params[:beppupost_id])
  		@beppucomment = @beppupost.beppucomments.find(params[:id])
  	end

  	def update
  		@beppupost = Beppupost.find(params[:beppupost_id])
  		@beppucomment = @beppupost.beppucomments.find(params[:id])

  		if @beppucomment.update(params[:beppucomment].permit(:comment))
  			redirect_to beppupost_path(@beppupost)
  		else
  			render 'edit'
  		end
  	end


end
