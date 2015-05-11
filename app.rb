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
  redirect('/division/'.concat(id.to_s))
end

patch '/division/:id/edit' do
  id = params.fetch('division_edit').to_i
  @division = Division.find(id)
  new_name = params.fetch('new_name')
  @division.update({department: new_name})
  redirect('/division/'.concat(id.to_s))
end

get '/employee/:id/edit' do
  @employee = Employee.find(params.fetch("id").to_i)
  erb(:employee_form)
end

patch '/employees/:id/edit' do
  id = params.fetch("employee_id").to_i
  employee = Employee.find(id)
  new_name = params.fetch("new_name")
  employee.update({:name => new_name})
  division = employee.division
  division_id = division.id.to_s
  redirect('/division/'+ division_id) # "+" is being used in place of .concat(division_id); it's the same thing
end
