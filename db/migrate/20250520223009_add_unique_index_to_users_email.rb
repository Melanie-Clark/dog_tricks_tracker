class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[8.0]
  # db protection to enforce uniqueness:
  # - prevents duplicate emails even if application-level (model) validations are bypassed
  # - improves query performance when looking up users by email.
  def change
    add_index :users, :email, unique: true
  end
end
