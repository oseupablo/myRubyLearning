require 'line_analyzer'

class FileAnalyzer
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize
    @analyzers = []
  end

  def analyze_file
    @analyzers = line_analyzers
  end

  def calculate_line_with_highest_frequency
    @highest_count_across_lines = @analyzers.max_by(&:highest_wf_count).highest_wf_count
    @highest_count_words_across_lines = @analyzers.select { |la| la.highest_wf_count == @highest_count_across_lines }
  end
  
  def print_highest_word_frequency_across_lines
    puts 'The following words have the highest word frequency per line:'
    @analyzers.each do |a|
      puts "#{a.highest_wf_words} (appears in line #{a.line_number})"
    end
  end

  private

  def line_analyzers
    File.readlines('test.txt').map(&:chomp).map!.with_index(1) do |la, index|
      LineAnalyzer.new(la, index)
    end
  end
end
