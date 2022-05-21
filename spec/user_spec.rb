require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validation' do
    subject { User.new(name: 'Esther Alice', post_counter: 0) }

    before { subject.save }

    context 'Name' do
      it 'name should be valid' do
        expect(subject).to be_valid
      end

      it 'name should be invalid if it is nil' do
        subject.name = nil
        expect(subject).to_not be_valid
      end
    end

    context 'Posts Counter' do
      it 'post_counter should be valid' do
        expect(subject).to be_valid
      end

      it 'post_counter should be invaild if it is string' do
        subject.post_counter = 'hello'
        expect(subject).to_not be_valid
      end

      it 'post_counter should be invalid if it is negative number' do
        subject.post_counter = -1
        expect(subject).to_not be_valid
      end
    end

    context 'Methods' do
      it 'return the last 3 comments' do
        (1..6).each do
          subject.posts.create(title: 'Alice in wonderlands', text: 'Beware the Jabberwock, my son!')
        end
        expect(subject.recent_posts).to eq(Post.order(created_at: :desc).limit(3))
      end
    end
  end
end
