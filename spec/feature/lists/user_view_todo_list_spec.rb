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
  end

  scenario 'and do not see personal lists' do
    user = create(:user)
    list = create(:list, user: user)
    other_user = create(:user, email: 'other@test.com')
    other_list = create(:list, name: 'other name', description: 'other description', user: other_user, status: :personal)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Lista de Tarefas'

    expect(page).to have_content(list.name)
    expect(page).to have_content(list.description)
    expect(page).to have_content(list.id)
    expect(page).not_to have_content(other_list.name)
    expect(page).not_to have_content(other_list.description)
    expect(page).not_to have_content(other_list.id)
  end
end
