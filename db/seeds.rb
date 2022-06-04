# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(
  name: 'Tom',
  photo: 'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
  bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  postsCounter: 0)
second_user = User.create(
  name: 'Lilly',
  photo: 'https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
  bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  postsCounter: 0)

# POSTS
first_post = Post.create(user_id: first_user, title: 'Hello first post',
text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
commentsCounter: 0, likesCounter: 0)
second_post = Post.create(user_id: first_user, title: 'Hello second post',
text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
commentsCounter: 0, likesCounter: 0)
third_post = Post.create(user_id: first_user, title: 'Hello third post',
text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
commentsCounter: 0, likesCounter: 0)
fourth_post = Post.create(user_id: first_user, title: 'Hello fourth post',
text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
commentsCounter: 0, likesCounter: 0)
fifth_post = Post.create(user_id: second_user, title: 'Hello fifth posts',
text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
commentsCounter: 0, likesCounter: 0)
sixth_post = Post.create(user_id: second_user, title: 'Hello sixth post',
text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
commentsCounter: 0, likesCounter: 0)
seventh_post = Post.create(user_id: second_user, title: 'Hello seventh post',
text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
commentsCounter: 0, likesCounter: 0)
eighth_post = Post.create(user_id: second_user, title: 'Hello eighth post',
text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
commentsCounter: 0, likesCounter: 0)
ninth_post = Post.create(user_id: second_user, title: 'Hello ninth post',
text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
commentsCounter: 0, likesCounter: 0)



# COMMENTS
Comment.create(post: first_post, user_id: second_user, text: 'In tincidunt odio vel turpis auctor, at gravida lacus semper. Maecenas aliquet ac eros vel accumsan. Vestibulum tristique dolor quis.' )

Comment.create(post: first_post, user_id: second_user, text: 'Maecenas varius vehicula imperdiet. Praesent eu blandit urna. Vestibulum porttitor semper augue, nec mollis ligula commodo ut. Nulla et aliquet.' )

Comment.create(post: first_post, user_id: second_user, text: 'Maecenas varius vehicula imperdiet. Praesent eu blandit urna. Vestibulum porttitor semper augue, nec mollis ligula commodo ut. Nulla et aliquet.' )

Comment.create(post: second_post, user_id: second_user, text: 'Vestibulum venenatis suscipit tellus sed molestie. Phasellus ullamcorper odio at leo tempor placerat. Ut a pretium lorem. Nam mollis sagittis.' )

Comment.create(post: fifth_post, user_id: first_user, text: 'Sed nibh ipsum, gravida placerat nunc nec, auctor porttitor nisi. Donec elementum condimentum arcu eu lobortis. Morbi dictum efficitur mattis.')

Comment.create(post: seventh_post, user_id: second_user, text: 'Integer aliquam sollicitudin viverra. Integer id finibus ante. Vivamus auctor enim in purus malesuada eleifend. Donec in turpis accumsan, egestas.')

Comment.create(post: fourth_post, user_id: second_user, text: 'In tincidunt odio vel turpis auctor, at gravida lacus semper. Maecenas aliquet ac eros vel accumsan. Vestibulum tristique dolor quis.' )

Comment.create(post: fourth_post, user_id: second_user, text: 'Maecenas varius vehicula imperdiet. Praesent eu blandit urna. Vestibulum porttitor semper augue, nec mollis ligula commodo ut. Nulla et aliquet.' )

Comment.create(post: fourth_post, user_id: second_user, text: 'Maecenas varius vehicula imperdiet. Praesent eu blandit urna. Vestibulum porttitor semper augue, nec mollis ligula commodo ut. Nulla et aliquet.' )
