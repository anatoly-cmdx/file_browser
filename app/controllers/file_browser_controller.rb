class FileBrowserController < ApplicationController
  def show
    @route_prefix = '/browse'
    @path = params[:directory].presence
    @entries = FileBrowser.browse(@path)

  rescue Exceptions::PathNotFoundError
    respond_to do |format|
      format.html {
        render file: 'public/404', layout: false, status: :not_found
      }
      format.any { head :not_found }
    end
  end
end
