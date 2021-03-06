require 'acceptance_helper'

class CaseSensitivenessTest < AcceptanceTest
  def test_adding
    stub_github_api_repo('Rails/Rails', full_name: 'rails/rails')
    stub_github_api('rails/rails', porras: 1)
    
    visit '/'
    
    fill_in 'repo', with: 'Rails/Rails'
    click_button 'Add'
    
    visit '/porras'
    
    assert page.has_content?('rails/rails 1 commit')
  end
end