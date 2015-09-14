module Enotas
  class Util
    OBJECT_TYPES = {
    }

    def self.get_object_type(type)
      object_type = Enotas::EnotasObject
      object_type = OBJECT_TYPES[type] if OBJECT_TYPES[type]
      object_type
    end

    def self.symbolize_names(object)
      case object
        when Hash
          new = {}
          object.each do |key, value|
            key = (key.to_sym rescue key) || key
            new[key] = symbolize_names(value)
          end
          new
        when Array
          object.map { |value| symbolize_names(value) }
        else
          object
      end
    end
  end
end