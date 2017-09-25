class Roulette
  def play(num)
    sample = (1..10).to_a.sample
    results_history(num, sample)
    print num == sample ? 'win' : 'lose'
  end

  def results_history(play, random)
    File.open('roulette_history.txt', 'a') { |f| f.puts random }
    File.open('winners.txt', 'a') {|f| f.puts play} if random == play
  end

end
