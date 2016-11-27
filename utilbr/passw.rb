
# reset passwords..

# to run this at the prompt..
# http://stackoverflow.com/questions/10313181/pass-ruby-script-file-to-rails-console
#
# usage:    rails r passw.rb


u=User.where(:email => 'a@e').first
u.password='a'
u.password_confirmation='a'
u.save!

u=User.where(:email => 'a').first
u.password='a'
u.password_confirmation='a'
u.save!