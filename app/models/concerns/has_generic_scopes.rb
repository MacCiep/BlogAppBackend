
module HasGenericScopes
  extend ActiveSupport::Concern

  module ClassMethods
    def generate_default_ilike_scopes(*fields)
      fields.each do |field|
        scope "with_#{field}", -> (param) { where("#{field} ILIKE :value", value: "%#{param}%")}
      end
    end
  end
end
