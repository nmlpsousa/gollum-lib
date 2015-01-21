class Gollum::Filter::Section < Gollum::Filter
  def extract(data)
    return data if @markup.format == :txt || @markup.format == :asciidoc
    # data.gsub!(/\[weaki-section (.+?)\](.*?)\[\/weaki-section\]/m) do
    #   title = $1
    #   content = $2
    #   id = Digest::SHA1.hexdigest(title)
    #   @map[id] = [title,content]
    #   "#{id}"
    # end
    data.gsub!(/\[section (.+?)\]/) do |tag|
      title = $1
      id = Digest::SHA1.hexdigest(title+rand(100).to_s)
      @map[id] = title
      "#{id}"
    end
    data
  end

  def process(data)
    # @map.each do |id, tag|
    #   title = tag[0]
    #   content = tag[1]
    #   data.gsub!(id) do
    #     "<span id=\"#{title}\" class=\"weaki-section\">#{content}<\/span>"
    #   end
    # end
    @map.each do |id, title|
      data.gsub!(id) do
        "<span id=\"#{title}\" class=\"weaki-section\">"
      end
    end
    data
  end
end