require 'rails_helper'
include RandomData
RSpec.describe AdvertisementsController, type: :controller do
  let (:my_ads) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(0..100)) }

  describe "POST create" do

    it "increases the number of Ads by 1" do
      expect{ advertisements :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(0..100)}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new post to @post" do
      advertisements :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(0..100)}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

  end



end
