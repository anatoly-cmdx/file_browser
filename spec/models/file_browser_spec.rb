RSpec.describe FileBrowser, type: :model do
  let(:path_absolute) { '/absolute/path' }
  let(:path_refs_parent) { '../log' }
  let(:path_not_exists) { 'directory_not_exists' }
  let(:root) { '' }
  let(:subfolder) { 'subfolder' }
  let(:empty_folder) { 'empty_folder' }

  describe '.browse' do
    context 'with invalid path' do
      it 'fails if directory contains absolute path' do
        expect { FileBrowser.browse(path_absolute) }.to raise_error ArgumentError
      end

      it 'fails if directory contains ".." (parent folder traversing)' do
        expect { FileBrowser.browse(path_refs_parent) }.to raise_error ArgumentError
      end

      it 'fails if directory does not exist' do
        expect { FileBrowser.browse(path_not_exists) }.to raise_error Exceptions::PathNotFoundError
      end
    end

    context 'with "root" directory' do
      let(:entries_count) { Dir.glob("#{FileBrowser::DIRECTORY_ROOT}/*").size }

      it 'returns array of directory entries' do
        expect(FileBrowser.browse(root).size).to eq entries_count
      end
    end

    context 'with subfolder' do
      let(:entries_count) { Dir.glob("#{FileBrowser::DIRECTORY_ROOT}/#{subfolder}/*").size }

      it 'returns array of directory entries' do
        expect(FileBrowser.browse(subfolder).size).to eq entries_count
      end
    end

    context 'with empty folder' do
      it 'returns empty array' do
        expect(FileBrowser.browse(empty_folder).size).to eq 0
      end
    end
  end
end
