class Gollum::Filter::SectionEnd < Gollum::Filter
  def extract(data)
    return data if @markup.format == :txt || @markup.format == :asciidoc
    # data.gsub!(/\[weaki-section (.+?)\](.*?)\[\/weaki-section\]/m) do
    #   title = $1
    #   content = $2
    #   id = Digest::SHA1.hexdigest(title)
    #   @map[id] = [title,content]
    #   "#{id}"
    # end
    data.gsub!(/\[\/section\]/) do |tag|
      "<\/span>"
    end
    data
  end

  def process(data)
    data
  end
end