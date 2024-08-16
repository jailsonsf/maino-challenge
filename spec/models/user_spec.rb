require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when user is not valid' do
    it 'when params is empty' do
      user = build(:user, email: '', password: '')
      expect(user).to_not be_valid
      expect(user.errors.added?(:email, :blank))
      expect(user.errors.added?(:password, :blank))
    end

    it 'when password and password_confirmation is invalid' do
      user = build(:user, password: 'pass')
      expect(user).to_not be_valid
      expect(user.errors.added?(:password, I18n.t('activerecord.errors.models.user.attributes.password.too_short')))
      expect(user.errors.added?(:password_confirmation, I18n.t('activerecord.errors.models.user.attributes.password_confirmation.confirmation')))
    end
  end
end
