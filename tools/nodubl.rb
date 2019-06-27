require 'json'

items = JSON.parse(IO.read('../quotes.json'))

lines = {}
uniq = []

items.each do |item|
	t = item['quoteText'].force_encoding("ISO-8859-1").encode("UTF-8")
	a = item['quoteAuthor'].force_encoding("ISO-8859-1").encode("UTF-8")

  key = "#{t}#{a}"

	next if lines[key]

  lines[key] = true
	uniq << item
end

IO.write('./uniq.json', JSON.pretty_generate(uniq))