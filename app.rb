require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pg')
require('sinatra/activerecord')
require('./lib/division')
require('./lib/employee')


get '/' do
  erb(:index)
end

get '/divisions' do
  @divisions =  Division.all
  erb(:divisions)
end

post '/add_division' do
  department = params.fetch("department")
  new_division = Division.create({department: department})
  redirect('/divisions')
end

get '/division/:id' do
  id = params.fetch("id").to_i
  @division = Division.find(id)
  erb(:division_employee)
end

post '/division/:id/new' do
  id = params.fetch("division_id").to_i
  @division = Division.find(id)
  employee = params.fetch('name')
  new_employee = @division.employees.create({name: employee, division_id: id})
  erb(:division_employee)
end
