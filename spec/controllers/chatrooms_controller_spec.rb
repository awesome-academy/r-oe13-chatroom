require "rails_helper"

RSpec.describe ChatroomsController, type: :controller  do
  describe "GET index" do
    before {get :index}
    it "populates an array of chatrooms" do
      chatroom = FactoryBot.create(:chatroom)
      expect(assigns(:chatrooms)).to eq([chatroom])
    end
    it "renders the index view" do
      expect(response).to render_template :index
    end
    it "success" do
      expect(response).to have_http_status :success
    end
  end

  describe "POST create" do
    it "saves the new chatroom in the database" do
      expect{
        FactoryBot.create(:chatroom)}.to change(Chatroom, :count).by(1)
    end
    it "success" do
      chatroom = FactoryBot.create(:chatroom)
      expect(response).to have_http_status :success
    end
  end

end
