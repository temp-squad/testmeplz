namespace :init do
  desc "TODO"
  task :company, [:company_name, :email, :password] => [:environment] do |t,args|
    ActiveRecord::Base.transaction do
      company = Company.create(name: args[:company_name])
      company.members.create(
        user: User.new(email: args[:email], password: args[:password])
      )
    end
  end
end
