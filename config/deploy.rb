#$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
require "bundler/capistrano"
load 'deploy/assets'

set :application, "friendly-octo-lamp"
set :repository, "git@github.com:pasvd/friendly-octo-lamp.git"

set :scm, :git


set :branch, "master"
set :keep_releases, 10
set :ssh_options, {:forward_agent => true}
set :deploy_via, :remote_cache
set :use_sudo, false
default_run_options[:pty] = true
set :rvm_ruby_string, '2.2.5@friendly-octo-lamp'

task :main do
  set :env, task_call_frames.first.task.fully_qualified_name
  set :user, "deploy-test" #uzivatel pod kterym se hlasime na server

  role :web, "10.0.10.144" # Your HTTP server, Apache/etc
  role :app, "10.0.10.144" # This may be the same as your `Web` server
  role :db, "10.0.10.144"

  set :rvm_type, :user
  set :deploy_to, "/home/#{user}/#{application}" #cesta k aplikaci na serveru
end

task :devel do
  set :env, task_call_frames.first.task.fully_qualified_name
  set :user, "deploy-test" #uzivatel pod kterym se hlasime na server

  role :web, "10.0.10.144" # Your HTTP server, Apache/etc
  role :app, "10.0.10.144" # This may be the same as your `Web` server
  role :db, "10.0.10.144"

  set :rvm_type, :user
  set :deploy_to, "/home/#{user}/#{application}" #cesta k aplikaci na serveru
end
