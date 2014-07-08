class CommonSubstring

	def initialize(para)
		@paragraph_words = para.split(" ")
		
	end

	def makeAnagrams 
		@anagrams ={}
		@paragraph_words.each do |word|
			start=0
			count=0
			max=word.length
			while count < word.length 
				start=0

				while word.length >= start+count

					subWord = word[start..start+count]

						if @anagrams.has_key?  subWord
							@anagrams[subWord] << word unless @anagrams[subWord].include? word
									
						else
							@anagrams[subWord]=[]
							@anagrams[subWord] << word unless @anagrams[subWord].include? word
							
					
						end	
					
					start+=1	

				end	
				#puts "#{count} : #{@anagrams}"
				count+=1
			
			end
		end
	end

	def findLongestSubstring numOfStrings
		
		temp= @anagrams.sort_by {|key, value| key.length}
		 
		@sorted ={}
		temp.each {|pair| @sorted[pair[0]]=pair[1]}

		@sorted.reverse_each do|key,value|
		#puts "#{key} : #{key.length} : #{value}"

		if(value.count >= numOfStrings)
			value.each {|string| puts string}
			break
		end
		
		end

	end
end

temp=CommonSubstring.new("I am a test para. this para if for testing.")
temp.makeAnagrams 
temp.findLongestSubstring 3