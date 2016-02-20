class FileBrowserController < ApplicationController
  def show
    @directory = params[:directory]
    @entries = FileBrowser.browse(@directory)

  rescue Exceptions::PathNotFoundError
    respond_to do |format|
      format.html {
        render file: "#{Rails.root}/public/404", layout: false, status: :not_found
      }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
