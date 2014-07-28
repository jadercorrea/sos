require 'spec_helper'

describe SosMailer do
  let(:user) { FactoryGirl.create(:user, email: 'jadercorrea.hv@gmail.com') }
  let(:service_order) { create(:service_order) }
  let(:welcome) { SosMailer.welcome_email(user) }

  context 'sends an welcome mail' do
    it 'renders the subject' do
      expect(welcome.subject).to eq('Bem vindo ao SOS Cloud App')
    end

    it 'renders the receiver email' do
      expect(welcome.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(welcome.from).to eql(['sos.cloudapp@gmail.com'])
    end

    it 'assigns @name' do
      expect(welcome.body.encoded).to match(user.name)
    end

    it 'assigns @access_url' do
      expect(welcome.body.encoded).to match('http://sos-app.cloudapp.net')
    end
  end
end
