String formatCustomerId(String customerId) {
  // Check if the ID length is 7 digits
  if (customerId.length == 7) {
    return '**** **** *${customerId.substring(0, 3)} ${customerId.substring(3)}';
  } else if (customerId.length > 7) {
    // Mask extra digits with '*' and format it
    String masked =
        '*' * (customerId.length - 4); // Mask all digits except the last 7
    String lastSeven = customerId.substring(customerId.length - 7);
    return '$masked*${lastSeven.substring(0, 3)} ${lastSeven.substring(3)}';
  } else {
    // If it's less than 7 digits, pad with '*' at the start
    return '*' * (7 - customerId.length) + customerId;
  }
}
