require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/config_file'
require 'pony'
require 'slack'

# Load yml setting file
config_file 'config/settings.yml'

get '/' do
  erb :index
end

# メールを送信 & Slack通知
post '/' do
  name = params[:name]
  email_address = params[:email]
  message=params[:message]

  EMAIL_ADDRESS = settings.email
  EMAIL_SECRET = settings.secret
  SLACK_TOKEN = settings.slack_token
  SLACK_CHANNEL = settings.slack_channel

  # 有効なメールアドレスかを確認する正規表現
  valid_address = /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/

  if valid_address =~ email_address 

    @isSuccessSendingEmail = 
      Pony.mail(:to => EMAIL_ADDRESS,
                :body => message,
                :subject => "Contact from Web Site of Techlab",
                :from => "#{name}<#{email_address}>",
                :via => :smtp, 
                :via_options => {
                  :enable_starttls_auto => true,
                  :address => "smtp.gmail.com",
                  :port => "587",
                  :user_name => EMAIL_ADDRESS,
                  :password => EMAIL_SECRET,
                  :authentication => :plain,
                  :domain => "gmail.com"
                }
      )

    erb :index

  else 
    # メールアドレスが有効でない場合はエラーを表示
    @isSuccessSendingEmail = false;
    erb :index
  end

  # Slack通知設定
  Slack.configure do |config|
    config.token = SLACK_TOKEN
  end

  Slack.chat_postMessage(text: 
    "てくらぼホームページからメッセージがありました＾＾
  --------------------
  "+ message, channel: SLACK_CHANNEL, username: 'OTL HP')
end
