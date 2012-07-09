require 'spec_helper'
require 'cerbero'

describe 'cerbero' do
  def stub_uniqueness_validation!
    ActiveRecord::Relation.any_instance.stub(:exists?) {
      ActiveRecord::Relation.any_instance.unstub :exists?
      false
    }
  end

  it 'gives validation error when database constraint throws error' do
    User.create! :email => 'test@mailinator.com', :company_id => 25

    stub_uniqueness_validation!
    user = User.create :email => 'test@mailinator.com', :company_id => 25

    user.errors[:email].should_not be_blank
  end
end
