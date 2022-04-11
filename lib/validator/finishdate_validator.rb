class FinishdateValidator < ActiveModel::EachValidator
  
  def validate_each(record, attribute, value)
    unless value.blank? && record.startdate.blank?
     record.errors.add(attribute, options[:message]) if value < record.startdate
    end
  end
end
