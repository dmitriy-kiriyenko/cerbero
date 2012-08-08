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

  it 'is not pokemon exception handling' do
    User.create! :email => 'test@mailinator.com', :company_id => 25

    stub_uniqueness_validation!
    Proc.new {
      UserWithSaveError.create :email => 'test@mailinator.com', :company_id => 25
    }.should raise_error(RuntimeError)
  end

  it 'supports saving with options' do
    lambda {
      user = User.new :email => 'test@mailinator.com', :company_id => 25
      user.save(:validation => true)
    }.should_not raise_error
  end
end
