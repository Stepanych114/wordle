# frozen_string_literal: true
class Wordle
  def initialize(word)
    @word = word.upcase
    @attempts = 6
    puts "Добро Пожаловать в игру Wordle! Длина слова: #{@word.length}. Попыток осталось: #{@attempts}"
    puts "Введите слово:"
  end
  def try(attempt)
    alrwas = ""
    if attempt.length != @word.length
      return "Неверная длина слова. Попробуйте еще раз."
    end
    s = attempt.upcase
    result = ""
    if @attempts > 0
      @attempts -= 1
      if s == @word
        return "Ответ найден, Вы победили!"
      end
      @word.chars.each_with_index do |c, i|
        if c == s[i] && alrwas.count(s[i]) < @word.count(s[i])
          result += "🟩"
          alrwas += s[i]
        elsif @word.include?(s[i]) && alrwas.count(s[i].upcase) < @word.count(s[i])
          result += "🟨"
          alrwas += s[i]
        else
          result += "⬛"
        end
      end
      if result == "🟩"*@word.length
        return "Ответ найден, Вы победили!"
      elsif @attempts < 1
        return "Попыток не осталось. Ответом было слово: '#{@word}'. Вы проиграли!"
      end
      return "Попыток осталось: #{@attempts} | Результат: #{result}"
    else
      return "Попыток не осталось. Ответом было слово: '#{@word}'. Вы проиграли!"
    end
  end
end