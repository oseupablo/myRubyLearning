class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency
  end

  def calculate_word_frequency
    @highest_wf_words = highest_words
  end

  private

  def highest_words
    wf = word_frequency
    @highest_wf_count = wf.values.max
    wf.select { |k, v| v == @highest_wf_count }.keys
  end

  def word_frequency
    word_frequency = Hash.new(0)

    @content.split.each do |word|
      word_frequency[word.downcase] += 1
    end

    word_frequency
  end
end
