class Gollum::Filter::Transclusion < Gollum::Filter
  def extract(data)
    return data if @markup.format == :txt || @markup.format == :asciidoc
    @methods = Array.new
    data.gsub!(/\[method\](.+?)\[\/method\]/m) do
      method = $1
      id = Digest::SHA1.hexdigest(method)
      @methods.push method
      "#{method}"
    end
    data
  end

  def process(data)
    @methods.each do |method|
      data.gsub!(method) do
        "<span class=\"gettify\">#{method}</span>"
      end
    end
    data
  end
end
