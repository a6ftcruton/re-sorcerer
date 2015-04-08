require 'rails_helper'

describe 'Tag' do
  
  it 'displays all tags' do
    tag = Tag.create(title: "rails")
    
    visit root_path

    expect(page).to have_content tag.title 
  end

  it 'can add a tag' do
          
  end
end
