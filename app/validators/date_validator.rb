class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    before_type_cast = "#{attribute}_before_type_cast"

    raw_value = record.send(before_type_cast) if record.respond_to?(before_type_cast.to_sym)
    raw_value ||= value

    return if raw_value.blank?

    begin
      raw_value.to_date
    rescue ArgumentError
      record.errors.add(attribute, 'must be a date')
    end
  end
end
