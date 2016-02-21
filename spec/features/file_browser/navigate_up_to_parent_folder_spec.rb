require 'features/helper'

feature 'User navigates up to a parent directory', js: true do
  let(:level2_subdirectory) { 'subfolder' }
  let(:level3_subdirectory) { 'subfolder/sub_sub_folder' }
  let(:level4_subdirectory) { 'subfolder/sub_sub_folder/deep_nested_folder' }

  scenario 'User can navigate up to any parent folder from a subfolder using breadcrumbs' do
    visit file_browser_path(level4_subdirectory)
    within '.breadcrumb' do
      expect(page).to have_content 'ROOT'
      expect(page).to have_content 'subfolder'
      expect(page).to have_content 'sub_sub_folder'
    end
  end

  scenario 'User navigates up from level 4 to level 3 subdirectory' do
    visit file_browser_path(level4_subdirectory)
    within '.breadcrumb' do
      click_link 'sub_sub_folder'
    end
  end

  scenario 'User navigates up from level 3 to level 2 subdirectory' do
    visit file_browser_path(level3_subdirectory)
    within '.breadcrumb' do
      click_link 'subfolder'
    end
  end

  scenario 'User navigates up from level 2 to root directory' do
    visit file_browser_path(level2_subdirectory)
    within '.breadcrumb' do
      click_link 'ROOT'
    end
  end

  scenario 'User can not navigate higher then the root directory' do
    visit file_browser_root_path
    within '.breadcrumb' do
      expect(page).to_not have_link('ROOT')
    end
  end
end
