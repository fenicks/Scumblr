# Default User
u = User.new
u.email = 'admin@scumblr.net'
u.password = 'scumblr'
u.password_confirmation = 'scumblr'
u.admin = true
u.save
