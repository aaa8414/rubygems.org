class Api::BaseController < ApplicationController
  skip_before_action :require_ssl

  private

  def find_rubygem_by_name
    @url      = params[:url]
    @gem_name = params[:gem_name] || params[:rubygem_name]
    @rubygem  = Rubygem.find_by_name(@gem_name)
    return if @rubygem || @gem_name == WebHook::GLOBAL_PATTERN
    render text: "This gem could not be found", status: :not_found
  end
end
