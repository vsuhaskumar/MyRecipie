# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
chefs = [{:chefname => 'masterchef', :email => 'master@chef.com',:password_digest => 'master'}]
                  
chefs.each do |chef|
  Chef.create!(chef)
end