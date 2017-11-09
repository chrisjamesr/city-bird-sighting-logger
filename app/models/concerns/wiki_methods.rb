module Wiki

  module InstanceMethods

    def set_wiki_info
      self.update(summary: summary, image_url: main_image_url)
    end  

    def wiki_scrape
      Wikipedia.find( self.species ) 
    end
      
    def main_image_url
      wiki_scrape.main_image_url
    end

    def summary
      wiki_scrape.summary
    end

    def summary_parse
      sum_array = wiki_scrape.summary.split(". ")
      sum_array[0..4].join(". ")
    end

  end  #  End of Module
  
  module ClassMethods

    # def find_by_slug(slug)
    #    self.all.find {|s| s.slug == slug}
    # end

  end  #  End of Module


end  #  End of Module