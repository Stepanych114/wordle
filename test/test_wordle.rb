# frozen_string_literal: true
require "minitest/autorun"
require_relative "../lib/wordle_my_game"
require_relative "../lib/wordle/word_list"

class WordleTest < Minitest::Test

  def test_create_word
    word = WordList::WORDS.sample
    assert_equal word.nil?, false
  end

  def test_start_game
    assert_output ("Добро Пожаловать в игру Wordle! Длина слова: 5. Попыток осталось: 6\nВведите слово:\n") {Wordle.new("СЛОВО")}
  end

  def test_wrong_length
    game = Wordle.new("слово")
    assert_equal "Неверная длина слова. Попробуйте еще раз.", game.try("слог")
    assert_equal "Неверная длина слова. Попробуйте еще раз.", game.try("словосочетание")
  end

  def test_correct_answer
    word = WordList::WORDS.sample
    game = Wordle.new(word)
    assert_equal "Ответ найден, Вы победили!", game.try(word)
  end

  def test_normal_game
    game = Wordle.new("лошадь")
    assert_equal "Попыток осталось: 5 | Результат: ⬛🟩⬛⬛⬛🟨", game.try("корова")
    assert_equal "Попыток осталось: 4 | Результат: ⬛🟩⬛🟩🟩⬛", game.try("пощада")
    assert_equal "Ответ найден, Вы победили!", game.try("лошадь")
  end
  def test_check_positions
    game = Wordle.new("слово")
    assert_equal "Попыток осталось: 5 | Результат: 🟨🟨⬛⬛⬛", game.try("ооооо")
    assert_equal "Попыток осталось: 4 | Результат: 🟨🟨🟩🟨🟨", game.try("оволс")
  end
  def test_no_attempts
    game = Wordle.new("сложно")
    for i in 1..5 do
      game.try("просто")
    end
    assert_equal "Попыток не осталось. Ответом было слово: 'СЛОЖНО'. Вы проиграли!", game.try("просто")
    assert_equal "Попыток не осталось. Ответом было слово: 'СЛОЖНО'. Вы проиграли!", game.try("сложно")
  end
end