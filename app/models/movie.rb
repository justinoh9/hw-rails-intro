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

  def self.sortable_columns
    %w[title release_date]
  end

  # Only sort by a column we know about; anything else leaves the order alone.
  def self.sorted_by(column)
    sortable_columns.include?(column) ? order(column => :asc) : all
  end
end
