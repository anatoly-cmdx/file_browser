class FileBrowser
  include ActiveModel::Model
  DIRECTORY_ROOT = Pathname("#{Rails.root}/public")

  # Returns directory entries (folders and files) for a given path
  def self.browse(path = '')
    relative_path = path.to_s
    raise ArgumentError, 'Absolute path is not allowed' if %r{^\/} =~ relative_path
    raise ArgumentError, 'Traversing to parent folder is not allowed' if /\.\./ =~ relative_path

    directory = DIRECTORY_ROOT + relative_path
    raise Exceptions::PathNotFoundError, "Path not found: #{directory}" unless Dir.exist? directory

    sort_directory_entries directory.children
  end

  # Returns ordered array of directory entries
  # directories first, then files, ordered by an entry name
  def self.sort_directory_entries(entries)
    entries.
      map { |entry|
        {
          path: entry.relative_path_from(DIRECTORY_ROOT).to_s,
          dir: entry.directory?,
          ord: entry.file? ? 1 : 0, # for sorting only
          name: entry.basename.to_s
        }
      }.
      sort { |a, b|
        (a[:ord] <=> b[:ord]).nonzero? || a[:name] <=> b[:name]
      }.
      map { |entry|
        entry.delete(:ord)
        entry
      }
  end
  private_class_method :sort_directory_entries
end
