Factory.define :user do |user|
	user.name	"Jerry Huo"
	user.email	"333@333.com"
	user.password	"foobar"
	user.password_confirmation	"foobar"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end