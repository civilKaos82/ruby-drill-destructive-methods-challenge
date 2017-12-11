def destroy_message(message)
  #refactored civilKaos code
  colon_index = message.index(':')

  if colon_index
    return message[0..colon_index]
  elsif !colon_index
    return message
  end

  #original civilKaos code
  # i = 0
  # alert_present = false
  # output_string = ""
  #
  # while i < message.length
  #   if alert_present
  #     i += 1
  #   elsif alert_present == false
  #     output_string << message[i]
  #     if message[i] == ":"
  #       alert_present = true
  #     end
  #     i += 1
  #   end
  # end
  # output_string
end

def destroy_message!(message)
  #refactored civilKaos code
  colon_index = message.index(':')
  if colon_index
    message.slice!((colon_index + 1)..(message.length - 1))
    return message
  elsif !colon_index
    return message
  end

  #original civilKaos code
  # i = 0
  # alert_present = false
  #
  # while i < message.length
  #   if alert_present
  #     message.slice!( (i)..(message.length - 1) )
  #     i = message.length
  #   elsif alert_present == false
  #     if message[i] == ":"
  #       alert_present = true
  #     end
  #     i += 1
  #   end
  # end
  # message
end
