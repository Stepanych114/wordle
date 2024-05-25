# frozen_string_literal: true
require_relative 'wordle/word_list'
class Wordle
  def initialize(word)
    @word =word.upcase
    @attempts = 6
    "_"*word.length
  end
  def try(attempt)
    attempt=attempt.upcase
    result=""
    if attempt==@word
      return "Ответ найден, Вы победили!"
    end
    if @attempts>0
      @attempts-=1
      @word.chars.each_with_index do |c, i|
        if c == attempt[i]
          result<<"🟩"
        elsif @word.include?(attempt[i])
          result<<"🟨"
        else
          result<<"⬛"
        end
      end
      if result=="🟩"*@word.length
        return "Ответ найден, ты победил!"
      end
      return "Попыток осталось: #{@attempts} | Результат: #{result}"
    else
      return "Попыток не осталось. Ответом было слово: '#{@word}'. Вы проиграли!"
    end
  end
end