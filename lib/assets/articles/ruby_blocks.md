---
video_url: https://www.youtube.com/embed/qJuLdLIxvF0
name: "Learn Ruby: Blocks Explained"
premium: false
published_at: 11-09-2016
---

Here is the code example! 

```ruby
 def count(param)
	counter = 0
	while counter < param
		yield(counter)
		counter += 1
	end
end

count(5) { |n| puts "hello #{n}"}

```