class HomeController < ApplicationController 
  
  # TODO: move this require directive where it belongs!
  require Rails.root.join('lib','photoselect')

  # FIXME: extend instead? What's the difference?
  # Should PhotoSelect just be a class instead of a module?
  include PhotoSelect
  
  def index
    @render = false
    if session[:token]
      @sort_by = params[:sort_by] || :total_likes
      @photos = PhotoSelect::batch(session[:token], @sort_by)
      @render = true
    end
  end

end
