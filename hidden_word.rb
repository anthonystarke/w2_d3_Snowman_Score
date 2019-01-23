

class HiddenWord

  def initialize(secret_word)
    # @secret_word = secret_word
    @guessed_letters = []
    @star_version = ""
    @converted_secret_word = ""
    @secret_word = load_random_words()
    initialize_stars_for_letters()
  end

  def load_random_words
    random_words = []
    line_counter = 0
    f = File.open("./random_words.txt", "r")
    f.each_line do |line|
      random_words << line.gsub("\n","")
    end
    f.close
    return random_words[rand(line_counter)]
  end

  def initialize_stars_for_letters
    @secret_word.each_char do |letter|
      if letter == " "
        @converted_secret_word += " "
      else
        @converted_secret_word += "*"
      end
    end
    return @converted_secret_word
  end

  def return_full_word
    return @secret_word
  end

  def replace_correct_letter(letter_to_replace, full_collection_of_guesses)
     @guessed_letters << letter_to_replace.downcase
     @converted_secret_word = ""
     @secret_word.each_char do |letter|
       if @guessed_letters.include? letter.downcase
        @converted_secret_word += letter
      else
        @converted_secret_word += "*"
       end
     end
  end

  def letter_check(letter_to_check,full_collection_of_guesses)
    if @secret_word.downcase.include? letter_to_check.downcase
      replace_correct_letter(letter_to_check,full_collection_of_guesses)
      return true
    else
      return false
    end
  end

  def return_star_version
    return @converted_secret_word
  end

  def is_word_finished
    if !@converted_secret_word.include? "*"
      return true
    else
      return false
    end
  end

end
