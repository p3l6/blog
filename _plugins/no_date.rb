class Jekyll::PostReader
  # Override posts file matcher to use the same as drafts: DATELESS_FILENAME_MATCHER
  # Date will be set in yaml front matter instead
  def read_posts(dir)
    read_publishable(dir, "_posts", Jekyll::Document::DATELESS_FILENAME_MATCHER)
  end
end
