require 'oga'

module H2E
  class Converter
    attr_accessor :html_base_url

    def from(html)
      doc = remove_attr(Oga.parse_html(html))
      doc = replace_pre_to_code(doc)

      content = "#{ENML_HEADER}"
      content << "<en-note>"
      content << doc.to_xml.to_s
      content << "</en-note>"
      return content
    end



    private

    def remove_attr(doc)
      if doc.respond_to?(:children)
        doc.children.each do |doc_c|
          remove_attr(doc_c)
        end
      end
      if doc.respond_to?(:attribute)
        ENML_PROHIBITED_ATTRIBUTES.each do |attr|
          doc.unset(attr) if doc.attribute(attr)
        end
        if not @html_base_url.nil?
          if doc.name == "a"
            href = doc.attribute("href")&.value
            if href =~ %r(^/.+)
              doc.set("href", "#{@html_base_url}#{href}")
            elsif (href =~ %r(^(http|https)://.+)).nil?
              doc.set("href", "#{@html_base_url}/#{href}")
            end
          end
        end
      end
      return doc
    end

    def escape_filter_word(word)
      if doc.respond_to?(:children)
        doc.children.each do |doc_c|
          remove_attr(doc_c)
        end
      end
      if doc.respond_to?(:attribute)
        ENML_PROHIBITED_ATTRIBUTES.each do |attr|
          doc.unset(attr) if doc.attribute(attr)
        end
        if doc.name == "a"
          href = doc.attribute("href").value
          if href =~ %r(^/.+)
            doc.set("href", "https://qiita.com#{href}")
          elsif (href =~ %r(^(http|https)://.+)).nil?
            doc.set("href", "https://qiita.com/#{href}")
          end
        end
      end
      return doc
    end

    def replace_pre_to_code(doc)
      if doc.respond_to?(:children)
        doc.children.each do |doc_c|
          replace_pre_to_code(doc_c)
        end
      end

      return doc unless doc.respond_to?(:name)

      if doc.name == "pre" && doc.parent.respond_to?("name")
        doc.name = "code"
        doc.set("style", CODE_BLOCK_STYLE.map{|k,v| "#{k}: #{v}"}.join(";"))
        doc.parent.set("style", P_CODE_BLOCK_STYLE.map{|k,v| "#{k}: #{v}"}.join(";"))
      end
      return doc
    end

  end
end
