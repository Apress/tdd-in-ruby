module PairRank
  # Value Object
  # - Pair - Consists of two options
  # - Choice - Selected option from a given pair
  # - Criteria - Rationale for the preference. Why the choice was made?
  class RationalChoice
    attr_reader :choice, :criteria, :pair

    def initialize(pair, choice, criteria)
      @choice = choice  
      @criteria = criteria
      @pair = pair
    end  

    def to_s
      "You selected #{@choice} because of #{@criteria} for #{@pair}"
    end
  end

  class Combination
    def initialize(options)
      @list = options.combination(2).to_a
      @index = -1
    end  

    def pair
      @index += 1
      @list[@index]
    end
  end

  class PairRank
    attr_reader :decisions

    def initialize(options)
      @options = options
      @decisions = []
      @votes = Hash.new(0)
      @combination = Combination.new(@options)
    end

    def combinations
      @options.combination(2).to_a
    end    

    def combination
      @combination.pair
    end

    def score_for(choice)
      @votes[choice]
    end

    def tied_pair
      return [] if zeros?

      find_tie
    end

    def break_tie(pair, choice, criteria)
      make_rational_choice(pair, choice, criteria)
    end

    def make_rational_choice(pair, choice, criteria)
      rc = RationalChoice.new(pair, choice, criteria)
      make(rc)
    end

    private

    # All choices with 0 scores mean the Pair Ranking process has not begun
    def zeros?
      list = @options.collect{|choice| score_for(choice)} 
      list.uniq == [0]
    end

    def tie(combination)
      first = score_for(combination[0])
      second = score_for(combination[1])
      first == second
    end

    def make(rational_choice)
      store(rational_choice)
      vote_for(rational_choice)
    end

    def has_tie?
      !tied_pair.empty?  
    end

    def vote_for(rational_choice)
      @votes[rational_choice.choice] += 1
    end

    # For display at the end of the Pair Ranking process
    def store(rational_choice)
      @decisions << rational_choice
    end

    def find_tie
      result = []
      combinations.each do |combination|
        if tie(combination)
          result = combination
          break
        end
      end
      result
    end
  end
end
