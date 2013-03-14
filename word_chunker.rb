# encoding: utf-8

class WordChunker

  attr_reader :stack, :limit, :string
  attr_accessor :current_chunk
  
  def initialize(str, limit)
    @string = str
    @limit = limit
    @stack = []
    @current_chunk = ''
  end

  def chunk
    words.each do |word|
      process_word(word)
    end
    add_to_chunk(current_chunk)
  end
  
  def process_word(word)
    if add_this_word_to_current_chunk?(word)
      current_chunk << "#{spacer}#{word}"
    else
      add_to_chunk(current_chunk)
      self.current_chunk = make_word_addable(word)
    end
  end
  
  def spacer
    current_chunk.empty? ? "" : " "
  end

  def self.chunk str, limit
    chunker = self.new(str, limit)
    chunker.chunk
  end

  private

  def add_this_word_to_current_chunk?(word)
    current_chunk.length + word.length + 1 <= limit
  end

  def add_to_chunk(chunk)
    if !chunk.empty?
      stack << chunk
    end
  end


  def words
    string.split(/\s+/)
  end

  def make_word_addable (word)
    if word.length  <= limit
      word
    else
      word[0..limit-2] + "…"
    end
  end
end


class String
  def split_by_chunk_size(limit)
    chunker = WordChunker.new(self, limit)
    chunker.chunk
  end
end
