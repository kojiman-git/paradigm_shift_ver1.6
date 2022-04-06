# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )


Rails.application.config.assets.precompile += %w(
  app_explanation.css
  home.css
  top.css
  applicaton.css
  quiz.css
  search.css
  post_search.css
  post.css
  app_detailed_description.css
  follows_list.css
  followers_list.css
  quiz_list.css
  profile.css
  custom.scss
  edit.css
  show.css
  notice.css
  direct.css
  message_partner.css
  post_details.css
  reviews.scss
  reviews.js
  reviewers.scss
  reviewers_list.css
  operation.css
  user-list.css
  posts.css
  quiz.js
  new.css
)