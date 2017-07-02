feature 'Sign up' do
  scenario 'Signing up for a user account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome back, Example McExampler'
    expect(User.first.username).to eq 'Example McExampler'
    expect(User.first.email).to eq 'example@example.com'
  end

  scenario 'Require a matching confirmation password' do
    expect { sign_up_wrong_password }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Sorry, your passwords don\'t match!'
  end

  scenario 'Require email to sign up' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'Require valid email address to sign up' do
    expect { sign_up(email: 'invalid@email')}.not_to change(User, :count)
  end
end
