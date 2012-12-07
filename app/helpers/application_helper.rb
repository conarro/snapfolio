module ApplicationHelper
  def row
    content_tag(:div, :class => "row-fluid") do
      yield
    end
  end
  
  def databox(title, options={})
    content_tag(:div, :class => "box #{options[:class]}", :id => options[:id], :style => options[:style]) do
      content_tag(:div, content_tag(:h2, raw(title)), :class => "box-header") <<
      content_tag(:div, :class => "box-content", :style => "#{options[:inner_style]}") do
        yield
      end
    end
  end
  
  def settings_icon object, page_type
    table = (object.class.to_s + "Item").constantize
    key_id = (object.class.to_s.downcase + '_id').to_sym
    if page_type == 'web'
      icon = table.where(key_id => object.id).first.is_web_visible ? "<i class='icon-minus-sign'></i>" : "<i class='icon-plus-sign'></i>"
    else
      icon = table.where(key_id => object.id).first.is_print_visible ? "<i class='icon-minus-sign'></i>" : "<i class='icon-plus-sign'></i>"
    end
    raw(icon)
  end
  
  def settings_text object, page_type
    table = (object.class.to_s + "Item").constantize
    key_id = (object.class.to_s.downcase + '_id').to_sym
    if page_type == 'web'
     table.where(key_id => object.id).first.is_web_visible ? "Hide on web folio" : "Show on web folio"
    else
     table.where(key_id => object.id).first.is_print_visible ? "Hide on print folio" : "Show on print folio"
    end
  end
  
end
