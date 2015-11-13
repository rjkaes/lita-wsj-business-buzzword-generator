require 'spec_helper'

describe Lita::Handlers::WsjBusinessBuzzwordGenerator, lita_handler: true do
  it { is_expected.to route_command('buzzword').to(:buzzword) }

  it 'returns a phrase without the **WORD** mark up' do
    send_command('buzzword')
    expect(replies.last).not_to include('**')
  end
end
