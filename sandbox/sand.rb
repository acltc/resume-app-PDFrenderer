require 'prawn'

Prawn::Document.generate("implicit.pdf") do
  text "Hello World"
end