# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')


first_post = Post.create(author: first_user, title: 'Hello 1', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello 2', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Hello 3', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hello 4', text: 'This is my fourth post')
fifth_post = Post.create(author: first_user, title: 'Hello 5', text: 'This is my fifth post')

Comment.create(post: first_post, author: first_user, text: 'Hi Tom!' )
Comment.create(post: second_post, author: first_user, text: 'Hi Jerry!' )
Comment.create(post: first_post, author: first_user, text: 'Hi Mickey!' )
Comment.create(post: first_post, author: first_user, text: 'Hi Donald!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Pluto!' )
Comment.create(post: first_post, author: second_user, text: 'Hi Scrooge!' ) 
Comment.create(post: first_post, author: second_user, text: 'Hi Dafey!' )