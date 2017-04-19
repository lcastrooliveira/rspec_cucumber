require 'spec_helper'
require 'loan_checker'
require 'client'
require 'weather'

describe LoanChecker do
  describe '#can_lend_to?' do
    it 'returns true when the client has not debt' do
      client = Client.new
      allow(client).to receive(:has_debt?).and_return(false)
      loan_checker = LoanChecker.new

      loan_evaluation = loan_checker.can_lend_to?(client)

      expect(loan_evaluation).to be_true
    end

    it 'returns true when the client has not debt (same text but with pure a double)' do
      client = double('client')
      allow(client).to receive(:has_debt?).and_return(false)
      loan_checker = LoanChecker.new

      loan_evaluation = loan_checker.can_lend_to?(client)

      expect(loan_evaluation).to be_true
    end

    it 'returns nil when it\'s not possible to check the clients\'s debt' do
      client = Client.new
      allow(client).to receive(:has_debt?).and_raise(RuntimeError)
      loan_checker = LoanChecker.new

      loan_evaluation = loan_checker.can_lend_to?(client)
      expect(loan_evaluation).to be_nil
    end

    it 'demonstrates the use of allow_any_instance_of' do
      allow_any_instance_of(Client).to receive(:has_debt?).and_return(false)
      # com o stub acima, qualquer instancia que voce fizer da classe
      # Client vai responder a mensagem has_debt? com o retorno false
      client_instance = Client.new
      another_client_instance = Client.new

      expect(client_instance.has_debt?).to be_false
      expect(another_client_instance.has_debt?).to be_false
    end
  end
end

describe Weather do
  describe '#today' do
    it 'returns "good" for a sunny day' do
      api_client = ApiClient.new
      allow(api_client).to receive(:today).and_return('sunny')
      weather = Weather.new(api_client)
      expect(weather.today).to eq('good')
    end
  end
end
