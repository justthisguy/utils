# encoding: utf-8

require_relative '../word_chunker'

# p "the quick brown fox jumped over the lazy brown dog".split_by_chunk_size(10)
#   #=> ["the quick", "brown fox", "jumped over", "the lazy", "brown dog"]


describe WordChunker do

	it "returns the word if there is only one word" do
		chunker = WordChunker.new "quick", 6
		chunker.chunk.should == ["quick"]
	end

  it "words with lenght 1 less than limit breaks into individual chunks" do
    chunker = WordChunker.new "quick brown", 6
		chunker.chunk.should == ["quick", "brown"]
	end

	it "small test" do
   chunker = WordChunker.new "the quick brown fox ", 10
	 chunker.chunk.should ==  ["the quick", "brown fox"]
  end

	it "big test" do
   chunker = WordChunker.new "the quick brown fox jumped over the lazy brown dog", 11
	 chunker.chunk.should ==  ["the quick", "brown fox", "jumped over", "the lazy", "brown dog"]
  end

	it "doesn't split spaces into chunks" do
   chunker = WordChunker.new "the       quick       brown      fox", 10
	 chunker.chunk.should ==  ["the quick", "brown fox"]
  end

	it "if the word is longer than the chunk, shorten word using ellipse - only" do
   chunker = WordChunker.new "antidisestabilishmentterianism", 22
	 chunker.chunk.should ==  ["antidisestabilishment…"]
  end

	it "if the word is longer than the chunk, shorten word using ellipse - last" do
   chunker = WordChunker.new "bob loves antidisestabilishmentterianism", 22
	 chunker.chunk.should ==  ["bob loves", "antidisestabilishment…"]
	end

	it "if the word is longer than the chunk, shorten word using ellipse middle" do
		chunker = WordChunker.new "bob loves antidisestabilishmentterianism every day", 22
		chunker.chunk.should ==  ["bob loves", "antidisestabilishment…", "every day"]
	end

	describe "class methods" do
		it "chunks the string with a class method" do
			chunks = WordChunker.chunk "the quick brown fox jumped over the lazy brown dog", 11
	 		chunks.should ==  ["the quick", "brown fox", "jumped over", "the lazy", "brown dog"]
		end
	end

	describe "String method" do
		it "chunks the string with a class method" do
			chunks = "the quick brown fox jumped over the lazy brown dog".split_by_chunk_size 11
	 		chunks.should ==  ["the quick", "brown fox", "jumped over", "the lazy", "brown dog"]
		end
	end
end