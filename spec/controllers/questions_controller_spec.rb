require 'rails_helper'
include RandomData

RSpec.describe QuestionsController, type: :controller do
  let (:my_question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  it "assigns questions" do
    get :index
    expect(assigns(:questions)).to eq([my_question])
  end


  describe "GET show" do
      it "returns http success" do
        get :show, {id: my_question.id}
        expect(response).to have_http_status(:success)
      end
      it "renders the #show view" do
        get :show, {id: my_question.id}
        expect(response).to render_template :show
      end

      it "assigns my_post to @post" do
        get :show, {id: my_question.id}
        expect(assigns(:question)).to eq(my_question)
      end
    end
#CreateTestsCompleted#
  describe "GET #create" do
      it "increases the number of Questions by 1" do
        expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false}}.to change(Question,:count).by(1)
      end
    end
#DeleteTestsCompleted#
    describe "DELETE destroy" do
         it "deletes the post" do
           delete :destroy, {id: my_question.id}
     # #6
           count = Question.where({id: my_question.id}).size
           expect(count).to eq 0
         end

         it "redirects to posts index" do
           delete :destroy, {id: my_question.id}
     # #7
           expect(response).to redirect_to questions_path
         end
       end
#EditTestsCompleted#
       describe "GET edit" do
            it "returns http success" do
              get :edit, {id: my_question.id}
              expect(response).to have_http_status(:success)
            end

            it "renders the #edit view" do
              get :edit, {id: my_question.id}

              expect(response).to render_template :edit
            end

            it "assigns post to be updated to question" do
              get :edit, {id: my_question.id}
              question_instance = assigns(:question)
              expect(question_instance.id).to eq my_question.id
              expect(question_instance.title).to eq my_question.title
              expect(question_instance.body).to eq my_question.body
              expect(question_instance.resolved).to eq my_question.resolved
            end
          end

  # describe "GET #delete" do
  #   it "returns http success" do
  #     get :delete
  #     expect(response).to have_http_status(:success)
  #   end
end
