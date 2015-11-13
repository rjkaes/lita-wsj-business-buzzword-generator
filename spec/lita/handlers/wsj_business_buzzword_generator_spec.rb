require 'spec_helper'

describe Lita::Handlers::WsjBusinessBuzzwordGenerator, lita_handler: true do
  it { is_expected.to route('buzzword').to(:buzzword) }
  it { is_expected.to route('buzzwords').to(:buzzword) }
  it { is_expected.to route('buzz words').to(:buzzword) }
  it { is_expected.to route('buzz-words').to(:buzzword) }

  it 'returns a phrase without the **WORD** mark up' do
    send_message('yet another buzzword')
    expect(replies.last).not_to include('**')
  end
end
