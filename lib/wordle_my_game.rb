# frozen_string_literal: true
require_relative 'wordle/word_list'
class Wordle
  def initialize(word)
    @word =word.upcase
    @attempts = 6
    "_"*word.length
  end
  def try(attempt)
    alrwas=""
    if attempt.length != @word.length
      return "Неверная длина слова. Попробуйте еще раз."
    end
    s=attempt.upcase
    result=""
    if s==@word
      return "Ответ найден, Вы победили!"
    end
    @attempts-=1
    @word.chars.each_with_index do |c, i|
      if c == s[i] && alrwas.count(s[i].upcase)<@word.count(s[i].upcase)
        result+="🟩"
        alrwas+=s[i].upcase
      elsif @word.include?(s[i]) && alrwas.count(s[i].upcase)<@word.count(s[i].upcase)
        result+="🟨"
        alrwas+=s[i].upcase
      else
        result+="⬛"
      end
    end
    if result=="🟩"*@word.length
      return "Ответ найден, ты победил!"
    elsif @attempts<=0
      return "Попыток не осталось. Ответом было слово: '#{@word}'. Вы проиграли!"
    end
    return "Попыток осталось: #{@attempts} | Результат: #{result}"
  end
end