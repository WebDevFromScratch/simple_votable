module SimpleVotable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
  end
  
  def total_votes
    up_votes - down_votes
  end

  def up_votes
    votes.where(vote: true).size
  end

  def down_votes
    votes.where(vote: false).size
  end
end