def destroy_message(message)
  i = 0
  alert_present = false
  output_string = ""

  while i < message.length
    if alert_present
      i += 1
    elsif alert_present == false
      output_string << message[i]
      if message[i] == ":"
        alert_present = true
      end
      i += 1
    end
  end
  output_string
end

def destroy_message!(message)
end
