require 'rails_helper'

feature 'User view lists' do
  scenario 'Successfully' do
    user = create(:user)
    list = create(:list, user: user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Tarefas'

    expect(page).to have_content(list.name)
    expect(page).to have_content(list.description)
    expect(page).to have_content(list.task.name)
    expect(page).to have_content(list.task.description)
  end
end
