class CalculatorController < ApplicationController
  def square_new
    render({ :template => "calculator_templates/square_new"})
  end
  def square_results
    @input = params.fetch(:number).to_f
    @result = @input ** 2
    render({ :template => "calculator_templates/square_results"})
  end
  def square_root_new
    render({ :template => "calculator_templates/square_root_new"})
  end
  def square_root_results
    @input = params.fetch(:number).to_f
    @result = @input ** 0.5
    render({ :template => "calculator_templates/square_root_results"})
  end
  def payment_new
    render({ :template => "calculator_templates/payment_new"})
  end
  def payment_results
    require "active_support/all"
    @apr = params.fetch(:user_apr).to_f
    @rate = @apr / 100 / 12
    @period = params.fetch(:user_years).to_f 
    @principal = params.fetch(:user_pv).to_f
    @numerator = @rate * @principal
    @denominator = 1 - (1 + @rate) ** (-@period * 12)
    @result = @numerator / @denominator
    render({ :template => "calculator_templates/payment_results"})
  end
  def random_new
    render({ :template => "calculator_templates/random_new"})
  end
  def random_results
    @min = params.fetch(:user_min).to_f
    @max = params.fetch(:user_max).to_f
    @result = rand(@min..@max).to_f
    render({ :template => "calculator_templates/random_results"})
  end
end
