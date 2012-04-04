class DevisePasswordValidator < ActiveModel::EachValidator  
  def validate_each record, attribute, value
    if (record.password.blank? || record.password_confirmation.blank?) && (record.id.blank? || (!record.id.blank? && !record.reset_password_token.blank?))
      record.errors[:password] << "is required"
    elsif (!record.password.blank? || !record.password_confirmation.blank?) && record.password_confirmation != record.password
      record.errors[:password] << "does not match Password Confirmation"
      record.errors[:password_confirmation] = nil
    elsif (!record.password.blank? || !record.password_confirmation.blank?) && record.password.length < 6
      record.errors[:password] << "must be longer than 6 characters"
    elsif record.password
      if (record.password.include?(' ') || record.password_confirmation.include?(' '))
        record.errors[:password] << 'cannot include spaces' 
      end
    end
  end
end