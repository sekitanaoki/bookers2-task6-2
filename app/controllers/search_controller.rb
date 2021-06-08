class SearchController < ApplicationController

  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		@records = search_for(@model, @content, @method)
	end
	  private
  def search_for(model, content, method)
    # 選択したモデルがuserだったら
    if model == 'user'
      # 選択した検索方法がが完全一致だったら
      if method == 'perfect'
        User.where(name: content)
      # 選択した検索方法がが部分一致だったら
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    # 選択したモデルがpostだったら
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content)
      else
        book.where('title LIKE ?', '%'+content+'%')
      end
    end
  end

end
