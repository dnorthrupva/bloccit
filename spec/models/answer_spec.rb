require 'rails_helper'

RSpec.describe Answer, type: :model do
    let(:question) { Question.new(title: "New Post Title", body: "New Post Body", resolved: false) }
    let(:answer) { Answer.new(question: question, body: "New Answers") }
    
    it "should respond to Body" do
        expect(answer).to respond_to(:body)
    end
end
