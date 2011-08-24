module LayoutHelper
  
  def display_paginationBar(collection)
    collection.total_pages > 1 ? true : false
  end

  def pagination_entries_info(collection, options = {})
      entry_name = options[:entry_name] ||
        (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))
  
      if collection.total_pages < 2
        case collection.size
        when 0; ""
        when 1; "<b>1</b> #{entry_name}"
        else;   "<b>#{collection.size}</b> #{entry_name.pluralize}"
        end
      else
        %{#{entry_name.pluralize} <b>%d&nbsp;-&nbsp;%d</b> of <b>%d</b>} % [
          collection.offset + 1,
          collection.offset + collection.length,
          collection.total_entries
        ]
      end
  end
  
end