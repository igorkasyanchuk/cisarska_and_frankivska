class ExtendedFormBuilder < ActionView::Helpers::FormBuilder
  def label(method, text = nil, options = {})
    #Check to see if text for this label has been supplied and humanize the field name if not.
    text = text || method.to_s.humanize
    #Get a reference to the model object
    if options[:required]
      text += "<abbr>*</abbr>"
      options.delete(:required)
    end
    super(method, text, options)
  end
end