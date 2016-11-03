
SparkPostRails.configure do |c|
  c.api_key = ENV['SPARKPOST_API_KEY']
  c.return_path = 'hello@publicbnb.com'  # default: nil
  c.transactional = true                          # default: false
	c.inline_css = true                             # default: false
	c.html_content_only = true 
end