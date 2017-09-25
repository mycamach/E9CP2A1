class Roulette
  def play(num)
    sample = (1..10).to_a.sample
    results_history(num, sample)
    print num == sample ? 'Winner!' : 'Loser!', "\n"
  end

  def results_history(play, random)
    File.open('roulette_history.txt', 'a+') { |f| f.puts random }
    File.open('winners.txt', 'a+') { |f| f.puts play } if random == play
  end

  def best_bet
    lines = File.open('roulette_history.txt', 'r').readlines
    numbers = lines.to_a.map(&:to_i)
    best = numbers.group_by(&:itself).values.max_by(&:size).first
    puts "The best number to bet on is #{best}."
  end
end

bet = (1..10).to_a.sample

Roulette.new.play(bet)
Roulette.new.best_bet
