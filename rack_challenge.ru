require 'rack'
require 'rack/backstage'

request_info = lambda do |env|
  request = Rack::Request.new(env)
  method = request.request_method
  path = request.path
  source_code = Rack::Backstage.new(__FILE__)

  # request_body = request.body.read
  request_params = request.params


  body = "Method: #{method}\nPath: #{path}\nRequest Params: #{request_params}\nSource: #{source_code}"
  [200, {"Content-Type" => "text/plain"}, [body]]
end

run request_info
