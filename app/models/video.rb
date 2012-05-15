require 'pp'
class Video < Model  
  attr_accessor :session_id, :description, :id, :thumbnail, :title, :url, :embed_code

  def self.all(session_id)
    videos = []
    page = 1

    begin
      results = list(session_id, page)
      videos << results
      page = page + 1
    end until results.empty?

    videos.flatten.collect do |v|
      Video.new(:description => v['description'], :id => v['id'], :thumbnail => v['thumbnail_url'], :title => v['title'], :url => v['url'] )
    end
  end

  def self.page(session_id, page, per_page)
    page = 1 unless page
    videos = list(session_id, page, per_page)
    videos.collect do |v|
      Video.new(:description => v['description'], :id => v['id'], :thumbnail => v['thumbnail_url'], :title => v['title'], :url => v['url'] )
    end
  end

  def self.list(session_id, page, per_page = 10)
    client.get('viddler.videos.getByUser', :sessionid => session_id, :page => page, :per_page => per_page)['list_result']['video_list']
  end

  def self.find(session_id, id)
    v = client.get('viddler.videos.getDetails', :sessionid => session_id, :video_id => id)['video']
    Video.new(:session_id => session_id, :description => v['description'], :id => v['id'], :thumbnail => v['thumbnail_url'], :title => v['title'], :url => v['url'] )
  end

  def self.destroy(session_id, id)
    client.post('viddler.videos.delete', :sessionid => session_id, :video_id => id)
  end
  
  def embed!
    v = client.get('viddler.videos.getEmbedCode', :sessionid => @session_id, :video_id => id)['video']
    @embed_code = v['embed_code']
    self
  end  
end
