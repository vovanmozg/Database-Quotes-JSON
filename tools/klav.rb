require 'json'


items = JSON.parse(IO.read('../quotes.json'))

texts = []


items.each do |item|
	#p item
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

	if line.count('.') < 2
		#p line
	end

	
	
	texts << line
	#if text.length > 300
	#	texts << text
	#	text = ''
	#end

	#text += line
end

IO.write('out.txt', texts.sort.join("\n"))



