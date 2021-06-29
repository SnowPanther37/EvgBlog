ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  #parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Возвращает true, если тестовый пользователь осуществил вход.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Осуществляет вход тестового пользователя
  def log_in_as(user)
    session[:user_id] = user.id
    end
    
  end

  private

    # Возвращает true внутри интеграционных тестов
    class ActionDispatch::IntegrationTest
      def log_in_as(user, password: 'password', remember_me: '1')
      post login_path, params: { session: { email: user.email,
      password: password,
      remember_me: remember_me } }
      end
      end
