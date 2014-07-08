# author: humayun 
#Code for finidng common longest substrings using annagrams


class CommonSubstring
	#-- initalization : takes the paragraph and converts it to a list of words
	def initialize(para)
		@paragraph_words = para.split(" ")
		
	end
    #-- makes anagrams of the words that will later be used for finding longest common substrings
	def makeAnagrams 
		@anagrams ={}
		@paragraph_words.each do |word|
			start=0
			count=0
			word=word.downcase
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
				count+=1
			
			end
		end
	end
	#-- this methods finds the longest substrings simply by going through the anagrams longest to smallest while looking for the
	#required number of strings
	def findLongestSubstring numOfStrings
		
		temp= @anagrams.sort_by {|key, value| key.length}
		@sorted ={}
		temp.each {|pair| @sorted[pair[0]]=pair[1]}
		max=-1
		@sorted.reverse_each do|key,value|
		if(value.count >= numOfStrings)
			max = key.length if max == -1 
			
			if (key.length == max)
				print "\nFound for #{key}: "
				value.each {|string| print string+"\t"}
				print "\n"+"-"*70+"\n"
			end			
		end
		
		end

	end
end
require "benchmark"
t=Benchmark.measure do 

temp=CommonSubstring.new("Alexander Cameron Rutherford was a Canadian lawyer and politician who served as the first Premier of Alberta from 1905 to 1910. He began his political career in the Legislative Assembly of the Northwest Territories. When the province of Alberta was created, Rutherford was asked to form its first government, and then won the 1905 election. The apparatus of provincial government was ")
temp.makeAnagrams 
temp.findLongestSubstring 4

end
puts "Time taken to run the code #{t}"