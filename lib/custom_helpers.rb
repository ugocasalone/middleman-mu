module CustomHelpers
	def example(title, &block)
		$titleBlock = content_tag('h2', title)
		content_tag('div', $titleBlock + capture(&block), class: "helper_class")
	end
end
