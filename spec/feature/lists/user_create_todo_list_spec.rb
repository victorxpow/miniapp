require 'rails_helper'

feature 'User create todo list' do
  scenario 'Successfully' do
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Tarefas'
    click_on 'Nova Lista de Tarefa'
    fill_in 'Name', with: 'Tarefas de casa'
    fill_in 'Description', with: 'Tarefas que serão realizadas diariamente.'
    select 'Collective', from: 'Status'
    fill_in 'Title', with: 'Viagem dos boyles - aruba'
    click_on 'Salvar'

    expect(page).to have_content('Tarefas de casa')
    expect(page).to have_content('Tarefas que serão realizadas diariamente.')
    expect(page).to have_content('collective')
    expect(page).to have_content('Viagem dos boyles - aruba')
  end
end
