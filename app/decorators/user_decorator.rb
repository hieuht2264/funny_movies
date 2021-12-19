# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def welcome
    "Welcome #{object.email}"
  end
end
