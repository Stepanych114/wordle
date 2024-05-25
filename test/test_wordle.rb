# frozen_string_literal: true
require "minitest/autorun"
require_relative "../lib/wordle_my_game"
require_relative "../lib/wordle/word_list"

class WordleTest < Minitest::Test
  def test_create_word
    word=WordList::WORDS.sample
    assert_equal word.nil?, false
  end
end