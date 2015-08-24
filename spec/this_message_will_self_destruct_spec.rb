require_relative '../this_message_will_self_destruct'

describe 'destroy_message' do
  context 'message contains an alert' do
    let(:message) { 'This message will self-destruct: You can\'t hug every cat.' }

    it 'returns the message prompt' do
      expect(destroy_message(message)).to eq 'This message will self-destruct:'
    end

    it 'does not modify its argument' do
      expect { destroy_message(message) }.to_not change { message }
    end
  end

  context 'message does not contain an alert' do
    it 'returns the whole message' do
      message = 'This has no alert.'
      expect(destroy_message(message)).to eq "This has no alert."
    end

    it 'does not modify its argument' do
      expect { destroy_message(message) }.to_not change { message }
    end
  end
end

describe 'destroy_message!' do
  context 'message contains an alert' do
    let(:message) { 'Important: Learn how to learn.' }

    it 'returns the message prompt' do
      expect(destroy_message(message)).to eq 'Important:'
    end

    it 'modifies its argument be be just the prompt' do
      expect { destroy_message(message) }.to change { message }.to { 'Important:' }
    end
  end

  context 'message does not contain an alert' do
    it 'returns the whole message' do
      message = 'No alert here.'
      expect(destroy_message(message)).to eq 'No alert here.'
    end

    it 'does not modify its argument' do
      expect { destroy_message(message) }.to_not change { message }
    end
  end
end
