require 'rack'
require 'rack/lobster'

request_info = lambda do |env|
  request = Rack::Request.new(env)
  method = request.request_method
  path = request.path
  # request_body = request.body.read
  request_params = request.params


  body = "Method: #{method}\nPath: #{path}\nRequest Params: #{request_params}\n"
  [200, {"Content-Type" => "text/plain"}, [body]]
end


map '/lobster' do
  run Rack::Lobster.new
end
map '/request_info' do
  run request_info
end
