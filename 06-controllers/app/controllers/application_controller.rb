class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  protected

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  # Token-based authentication based on suggestions from
  # https://github.com/thoughtbot/clearance/wiki/API-Authentication

  def require_login_via_token
    authenticate_via_token

    unless signed_in?
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def authenticate_via_token
    logger.info "TOKEN: #{api_token}"

    return unless api_token
    user = User.find_by(api_token: api_token)
    sign_in user if user
    cookies.delete :remember_token
  end

  private

  def api_token
    pattern = /^Bearer /
    header  = request.env["HTTP_AUTHORIZATION"]
    header.gsub(pattern, "") if header && header.match(pattern)
  end
end
