class Movie < ApplicationRecord
  def self.all_ratings
    %w[G PG PG-13 R]
  end

  # ratings_list is an array such as ['G', 'PG', 'R'] (any case).
  # If it's nil or empty, return ALL movies.
  def self.with_ratings(ratings_list)
    return all if ratings_list.blank?

    where("UPPER(rating) IN (?)", ratings_list.map(&:upcase))
  end
end
