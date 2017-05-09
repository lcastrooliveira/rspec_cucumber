module GameHelpers
  def start_new_game
    set_rafflable_words(%w(hi mom game fruit)) if @raffable_words.nil?

    run_interactive("forca \"#{@raffable_words}\"")
  end

  def set_rafflable_words(words)
    @raffable_words = words
  end
end

World(GameHelpers)
