class TagsController < ApplicationController
  require 'httparty'

  def new
  end

  def create
    created_at = params[:tag][:created_after]
    @tag       = params[:tag][:tag]

    project_id  = '47f3a4ed7ec9c99cca37b307718d6c9b'
    acces_token = '6cf0d86d5dd404f6525663ee348ea6a26d438574995f6982a290f41aeee2466f'

    auth = { username: acces_token }

    phraseapp_api_url = "https://api.phraseapp.com/api/v2/projects/#{project_id}/keys/tag"

    @response = HTTParty.patch(
      phraseapp_api_url,
      headers: { 'Content-Type' => 'application/json' },
      basic_auth: auth,
      body: {
        q: "created_at:>=#{created_at}",
        tags: @tag
      }.to_json
    )

    render 'create'
  end
end
