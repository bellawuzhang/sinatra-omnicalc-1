require "sinatra"
require "sinatra/reloader"

# Square Answer
get("/square/new") do
    erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

# Square Root Answer
get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
@the_num = params.fetch("users_number").to_f

@the_result = @the_num ** 0.5

erb(:square_root_results)
end

# Payments
get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payments/results") do
@the_apr_input = params.fetch("apr_input").to_f
@the_apr_input_converted = @the_apr_input.to_fs(:percentage, {:precision => 4})
@the_years_input = params.fetch("years_input").to_f
@the_principal_input = params.fetch("principal_input").to_f

@the_apr_output = @the_apr_input / (100 * 12)
@the_months_output = @the_years_input * 12
@the_numerator = @the_apr_output * @the_principal_input
@the_denominator = (1-(1 + @the_apr_output) ** -@the_months_output)
@the_result = (@the_numerator / @the_denominator).to_fs(:currency)

erb(:payment_results)
end

# Random Number Generatior
get("/random/new") do
  erb(:new_random_number_generator)
end

get("/random/results") do
@the_min_input = params.fetch("min_input").to_f
@the_max_input = params.fetch("max_input").to_f
@the_result = rand(@the_min_input..@the_max_input)

erb(:random_results)
end


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
