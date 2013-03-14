class WordChunker

  def initialize(str, limit)
    @string = str
    @limit = limit
  end

  def chunk
    stack = []
    @current_chunk = ""
    p "#chunked:words", words
    words.each do |word|
      if add_to_existing?(word)
        @current_chunk << " " + word
      else
        stack << @current_chunk
        @current_chunk = ""
      end
    end
    stack
  end

  def add_to_existing?(word)
    @current_chunk.length + word.length + 1  <= @limit
  end

  def words
    @string.split(/\s+/)
  end
end





class String
  def split_by_chunk_size(limit)
    chunkie = WordChunker.new(self, limit)
    chunkie.chunked
  end
end
