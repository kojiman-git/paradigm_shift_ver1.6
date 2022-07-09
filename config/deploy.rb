# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

# アプリケーションの指定
set :application, 'paradigm_shift_ver1.6'
set :repo_url,  'git@github.com:kojiman-git/paradigm_shift_ver1.6.git'

# sharedディレクトリに入れるファイルを指定
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"



# SSH接続設定
set :ssh_options, auth_methods: ['publickey'],
                              keys: ['~/.ssh/id_rsa_15f2e08358752eec4fff61158e3bcb96'] 

# 保存しておく世代の設定
set :keep_releases, 5

# rbenvの設定
set :rbenv_type, :user
set :rbenv_ruby, '3.1.0'

# ここからUnicornの設定
# Unicornのプロセスの指定
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの指定
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.conf.rb" }

# Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

set :branch, "main"

set :linked_files, %w{config/master.key}