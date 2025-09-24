module Jekyll
  # Override posts file matcher to use the same as drafts: DATELESS_FILENAME_MATCHER
  # Date will be set in yaml front matter instead
  class PostReader
    def read_posts(dir)
      read_publishable(dir, '_posts', Jekyll::Document::DATELESS_FILENAME_MATCHER)
    end
  end
end
