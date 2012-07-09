class User < ActiveRecord::Base
  validates :email, :uniqueness => {:scope => :company_id}
end

class UserWithSaveError < ActiveRecord::Base
  self.table_name = 'users'

  validates :email, :uniqueness => {:scope => :company_id}
  before_save { raise RuntimeError }
end

ActiveRecord::Schema.define(:version => 1) do
  create_table :users do |t|
    t.string :email
    t.integer :company_id
  end

  add_index :users, [:email, :company_id], :unique => true
end
