class UsersGroup < ApplicationRecord
  attr_reader :user_id, :groups
  belongs_to :user, optional: true

  def readonly?
    true
  end

  def self.refresh
    Scenic.database.refresh_materialized_view(table_name, concurrently: true, cascade: true)
  end
end