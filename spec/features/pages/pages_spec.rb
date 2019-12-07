require "rails_helper"

RSpec.describe 'home page', type: :feature do
  describe 'texts in home page' do
  	
  	before { visit root_path }

  	context 'match texts in home page' do
      it 'expect correct title' do
	    expect(page).to have_content('Projeto Carambolo!')
	  end

	  it 'expect correct description' do
	    expect(page).to have_content('Um projeto pela vida')
	  end

	  it 'expect correct section about' do
	    expect(page).to have_content('Sobre')
	  end

	  it 'expect correct section projects' do
	    expect(page).to have_content('Projetos')
	  end

	  it 'expect correct article' do
	    expect(page).to have_content('Artigo sobre a técnica das três colunas')
	  end
	end
  end
end
