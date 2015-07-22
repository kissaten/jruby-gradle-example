require 'webrick'
require 'cowsay'

root = File.expand_path '~/public_html'
server = WEBrick::HTTPServer.new :Port => (ENV['PORT'] || 8000), :DocumentRoot => root

server.mount_proc '/' do |req, res|
  res.body = "<pre>#{Cowsay.say("Hello")}</pre>"
end

trap 'INT' do server.shutdown end

server.start

