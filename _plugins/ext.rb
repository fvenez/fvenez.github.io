 
require 'latex/decode'


# Disable the Math module of latex-decode as it interferes with MathJax
module LaTeX
  module Decode
    class Maths < Decoder
      def self.decode! (string)
        string
      end
    end
  end
end




module Base
  module_function 
  def strip_braces (string)

    original_inline_math = string.scan(/\$[^\$]*\$/)

    string.gsub!(/(^|[^\\])([\{\}]+)/, '\1')
    string.gsub!(/\\(\{|\})/, '\1')
    
    stripped_inline_math = string.scan(/\$[^\$]*\$/)

    stripped_inline_math.zip(original_inline_math).each do |stripped, original|
      string.sub!(stripped, original)
    end
    string
  end
end


