require 'features/helper'

feature 'User navigates to a directory and sees its contents', js: true do
  let(:path_root) { FileBrowser::ROOT_PATH }
  let(:path_not_exists) { 'directory_not_exists' }
  let(:root) { '' }
  let(:subfolder) { 'subfolder' }
  let(:subsubfolder) { 'subfolder/sub_sub_folder' }
  let(:empty_folder) { 'empty_folder' }

  scenario 'User navigates to the root directory' do
    entries_count = Dir.glob("#{path_root}/*").size

    visit file_browser_root_path
    expect(page).to have_css('.directory_entry', count: entries_count)
  end

  scenario 'User navigates to a subdirectory' do
    entries_count = Dir.glob("#{path_root}/#{subfolder}/*").size

    visit file_browser_path(subfolder)
    expect(page).to have_css('.directory_entry', count: entries_count)
  end

  scenario 'User navigates to a sub-sub-directory' do
    entries_count = Dir.glob("#{path_root}/#{subsubfolder}/*").size

    visit file_browser_path(subsubfolder)
    expect(page).to have_css('.directory_entry', count: entries_count)
  end

  scenario 'User navigates to an empty directory' do
    visit file_browser_path(empty_folder)
    expect(page).to_not have_css('.directory_entry')
  end

  scenario 'User can not navigate to a non-existent folder' do
    visit file_browser_path(path_not_exists)
    expect(page.status_code).to eq 404
  end
end
