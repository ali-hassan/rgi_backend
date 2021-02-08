# config valid only for current version of Capistrano
lock "3.8.0"

set :application, 'National Resources Governance Index'
set :repo_url, 'git@github.com:Vizzuality/nrgi-backoffice-api.git'
set :branch, 'master'
set :keep_releases, 5
set :use_sudo, true

set :default_env, {
    'PATH' => "/home/ubuntu/.rvm/gems/ruby-2.4.0/bin:/home/ubuntu/.rvm/bin:$PATH",
    'RUBY_VERSION' => 'ruby-2.4.0',
    'GEM_HOME'     => '/home/ubuntu/.rvm/gems/ruby-2.4.0',
    'GEM_PATH'     => '/home/ubuntu/.rvm/gems/ruby-2.4.0',
    'BUNDLE_PATH'  => '/home/ubuntu/.rvm/gems/ruby-2.4.0'
}

set :passenger_restart_with_touch, true
set :resque_environment_task, true

set :rvm_type, :user
set :rvm_ruby_version, '2.4.0'
set :rvm_roles, [:app, :web, :db]

set :keep_releases, 5

set :linked_files, %w{.env}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

set :rvm_map_bins, fetch(:rvm_map_bins, []).push('rvmsudo')

namespace :deploy do
  after :finishing, 'deploy:cleanup'
  after 'deploy:publishing', 'deploy:symlink:linked_files', 'deploy:symlink:linked_dirs', 'deploy:restart', 'resque:restart'
end


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
