require_relative '../this_message_will_self_destruct'

describe 'destroy_message' do
  it 'should not modify the provided string' do
    string = "this message will self-destruct: you can't hug every cat"
    original_string = string.dup
    expect(destroy_message(string)).to eq("this message will self-destruct:")
    expect(string).to eq(original_string)
  end

  it 'should not modify a string without a message' do
    string = "this has no message"
    original_string = string.dup
    expect(destroy_message(string)).to eq(string)
    expect(string).to eq(original_string)
  end
end

describe 'destroy_message!' do
  it 'should modify the original string' do
    string = "this message will self-destruct: you can't hug every cat"
    original_string = string.dup
    expect(destroy_message!(string)).to eq("this message will self-destruct:")
    expect(string).to_not eq(original_string)
  end
end
