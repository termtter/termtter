module Termtter::Client
  register_command(
    :name => %s{mute create},
    :exec_proc => lambda {|arg|
      arg.strip.split(' ').each do |arg|
        user_name = normalize_as_user_name(arg)
        user = Termtter::API::twitter.create_mute(:screen_name => user_name)
        puts "muted #{user.screen_name}"
      end
    },
    :help => ['mute create USER', 'Mute user']
  )

  register_command(
    :name => %s{mute destroy},
    :exec_proc => lambda {|arg|
      arg.strip.split(' ').each do |arg|
        user_name = normalize_as_user_name(arg)
        user = Termtter::API::twitter.destroy_mute(:screen_name => user_name)
        puts "unmuted #{user.screen_name}"
      end
    },
    :help => ['mute destroy USER', 'Un-mute user']
  )

  register_command(
    :name => 'mute list',
    :exec => lambda {|arg|
      users = Termtter::API.twitter.list_mute.users
      puts users.map{|i| i.screen_name}.join("\n")
    },
    :help => ["mute list", "List muted users"]
  )
end
