require 'minitest/autorun'
require_relative 'pair_rank'

class PairRankTest < Minitest::Test
  include PairRank

  def test_score_is_zero_for_the_element_that_did_not_get_vote
    options = []
    pr = PairRank.new(options)
    result = pr.score_for('A')
    assert_equal 0, result
  end

  def test_first_combination
    options = ['A', 'B', 'C']
    pr = PairRank.new(options)
    result = pr.combination
    assert_equal ['A', 'B'], result
  end

  def test_second_combination
    options = ['A', 'B', 'C']
    pr = PairRank.new(options)
    pr.combination
    result = pr.combination
    assert_equal ['A', 'C'], result
  end

  def test_in_the_beginning_all_scores_are_zero_so_its_not_a_tie
    options = ['A', 'B', 'C', 'D']
    pr = PairRank.new(options)        
    result = pr.tied_pair    
    assert_equal [], result
  end    

  def test_complete_session_when_there_is_no_tie
    criteria = 'test'
    options = ['A', 'B', 'C']
    pr = PairRank.new(options)        
    pair = pr.combination
    choice = 'A'
    pr.make_rational_choice(pair, choice, criteria)
    pair = pr.combination
    choice = 'A'
    pr.make_rational_choice(pair, choice, criteria)
    pair = pr.combination
    choice = 'B'
    pr.make_rational_choice(pair, choice, criteria)

    assert_equal 2, pr.score_for('A')
    assert_equal 1, pr.score_for('B')
    assert_equal 0, pr.score_for('C')
  end

  def test_score_complete_session_where_there_are_ties
    criteria = 'test'
    options = ['A', 'B', 'C']
    pr = PairRank.new(options)        
    pair = pr.combination
    choice = 'A'
    pr.make_rational_choice(pair, choice, criteria)
    pair = pr.combination
    choice = 'C'
    pr.make_rational_choice(pair, choice, criteria)
    pair = pr.combination
    choice = 'B'
    pr.make_rational_choice(pair, choice, criteria)

    assert_equal 1, pr.score_for('A')
    assert_equal 1, pr.score_for('B')
    assert_equal 1, pr.score_for('C')    
  end

  def test_get_tie_for_a_complete_session_when_there_are_ties
    criteria = 'test'
    options = ['A', 'B', 'C']
    pr = PairRank.new(options)        
    pair = pr.combination
    choice = 'A'
    pr.make_rational_choice(pair, choice, criteria)
    pair = pr.combination
    choice = 'C'
    pr.make_rational_choice(pair, choice, criteria)
    pair = pr.combination
    choice = 'B'
    pr.make_rational_choice(pair, choice, criteria)

    assert_equal ['A', 'B'], pr.tied_pair
  end

  def test_process_ties_for_a_complete_session_when_there_are_ties
    criteria = 'test'
    options = ['A', 'B', 'C']
    pr = PairRank.new(options)        
    pair = pr.combination
    choice = 'A'
    pr.make_rational_choice(pair, choice, criteria)
    pair = pr.combination
    choice = 'C'
    pr.make_rational_choice(pair, choice, criteria)
    pair = pr.combination
    choice = 'B'
    pr.make_rational_choice(pair, choice, criteria)

    pr.break_tie(pr.tied_pair, 'A', criteria)   
    assert_equal ['B', 'C'], pr.tied_pair

    pr.break_tie(pr.tied_pair, 'B', criteria)
    assert_equal ['A', 'B'], pr.tied_pair    

    pr.break_tie(pr.tied_pair, 'A', criteria)
    assert_equal [], pr.tied_pair    
  end

  def test_rational_choice_custom_string
    rc = RationalChoice.new('pair', 'choice', 'criteria')
    expected = "You selected choice because of criteria for pair"  
    result = rc.to_s
    assert_equal expected, result
  end
end
