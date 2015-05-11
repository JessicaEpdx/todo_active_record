require('sinatra')
require('sinatra/reloader')
require('./lib/list')
require('./lib/task')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => "to_do"})

get('/') do
  @all_lists = List.all()
  erb(:index)
end

post('/') do
  new_list = List.new({:name => params.fetch("name"), :id => nil})
  new_list.save()
  @all_lists = List.all()
  erb(:index)
end

get('/lists/:id') do
  @id = params.fetch("id")
  @list = List.find(@id)
  erb(:list)
end

post('/lists/:id') do
  @id = params.fetch("id").to_i
  @list = List.find(@id)
  new_task = Task.new({:description => params.fetch("description"), :list_id => @id, :id => nil})
  new_task.save
  erb(:list)
end
