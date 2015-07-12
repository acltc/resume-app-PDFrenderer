# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf


# I think this make a directory called application that will save the pdf file.
# Mime::Type.register "application/pdf", :pdf >> changed this line to below per
# http://stackoverflow.com/questions/10944399/warning-already-initialized-constant-pdf
Mime::Type.register "application/pdf", :pdf unless Mime::Type.lookup_by_extension(:pdf)