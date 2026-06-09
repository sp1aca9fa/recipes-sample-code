require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "generates associated data from factory" do
    puts "Before creation:\n\n"
    puts "Comments: #{Comment.all.pluck(:id).inspect}"
    puts "Recipes: #{Recipe.all.pluck(:id).inspect}"
    puts "Users: #{User.all.pluck(:id).inspect}\n"

    comment = FactoryBot.create(:comment)

    puts "\nAfter creation:\n\n"
    puts "Comments: #{Comment.all.pluck(:id).inspect}"
    puts "Recipes: #{Recipe.all.pluck(:id).inspect}"
    puts "Users: #{User.all.pluck(:id).inspect}\n"

    puts "The new comment's recipe is #{comment.recipe.inspect}"
    puts "The new comment's user is #{comment.user.inspect}\n\n"
    puts "And the recipe's user is #{comment.recipe.user.inspect}"
  end
end
