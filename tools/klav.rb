require 'json'


items = JSON.parse(IO.read('../quotes.json'))

texts = []

items.each do |item|
	t = item['quoteText'].strip.gsub(/\.+$/, '.')
	unless t[-1].match(/[\.\?\!]/)
		t = t + '.'
	end

	if item['quoteAuthor'].strip.length > 0
		a = item['quoteAuthor'].strip.gsub(/\.*$/, '.')
	else
		a = 'Unknown Author.'
	end
	
	line = "#{t} #{a}"
  line.gsub!('é', 'e')

	texts << line
end

IO.write('klavogonki.txt', texts.sort.join("\n"))



