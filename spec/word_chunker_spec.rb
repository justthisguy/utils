require_relative '../word_chunker'

# p "the quick brown fox jumped over the lazy brown dog".split_by_chunk_size(10)
#   #=> ["the quick", "brown fox", "jumped over", "the lazy", "brown dog"]


describe WordChunker do

	it "returns the word if there is only one word" do
		chunks = WordChunker.new "quick", 6
		chunks.should == ["quick"]
	end

	#
  #
  #it "words with lenght 1 less than limit breaks into individual chunks" do
  #  chunks = WordChunker.new "quick brown", 6
		#chunks.count.should == 2
  #end


end