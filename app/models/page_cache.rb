# FIXME: This whole class seems deprecated. Remove?
class PageCache
  def self.logger
    ::Rails.logger
  end

  def logger
    ::Rails.logger
  end

  def self.public_path
    ActionController::Base.page_cache_directory
  end

  # Delete all file save in path_cache by page_cache system
  def self.sweep_all
    self.zap_pages(%w{*})
  end

  def self.sweep_theme_cache
    self.zap_pages(%w{images/theme/* stylesheets/theme/* javascripts/theme/*})
  end

  def self.zap_pages(paths)
    # Ensure no one is going to wipe his own blog public directory
    # It happened once on a release and was no fun at all
    return if public_path == "#{::Rails.root.to_s}/public"
    srcs = paths.inject([]) { |o,v|
      o + Dir.glob(public_path + "/#{v}")
    }
    return true if srcs.empty?
    trash = ::Rails.root.to_s + "/tmp/typodel.#{UUIDTools::UUID.random_create}"
    FileUtils.makedirs(trash)
    FileUtils.mv(srcs, trash, :force => true)
    FileUtils.rm_rf(trash)
  end

end
