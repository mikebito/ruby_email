require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'English'
require 'pony'
require 'sinatra/activerecord'
require './models'


get "/" do
    @number = 1
    erb :index
end
post "/answers" do
    History.create(
        name: params[:name],
        email: params[:email],
        inside: params[:inside],
        )
    @name = params[:name]
    @email = params[:email]
    @inside = params[:inside]
    
    Pony.mail(:to => "miki0302sin@gmail.com",
        :from => @email,
        :body => @inside,
        :subject => @name,
#        :from => "#{:name}<#{:email}>",
        :via => :smtp,
        :via_options => {
            :enable_starttls_auto => true,
            :address => "smtp.gmail.com",
            :port => "587",
            :user_name => "miki0302sin@gmail.com",
            :password => "fojgbaljpfeseooj",
            :authentication => :plain,
            :domain => "gmail.com"
            })
    redirect '/'
end

get '/answers' do
#    @answers =Answer.all
    erb '/'
end



#class SampleMailer < ActionMailer::Base
#    def first_example(body)
#        mail(
#            to:     'miki0302sin@outlook.com',
#            from: '@answer.email',
#            subject:'mail from samplemailer',
#            body:    '@answer.inside'
#        )
#    end
#end
#
#mail.delivery_method :smtp, {   address:   'smtp.gmail.com',
#                                port: 587,
#                                domail: 'example',
#                                user_name: '@answer.email',
#                                password: 'marchtwo0302sin' }
