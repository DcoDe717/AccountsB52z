List<String> extractNumbersAsString(List<dynamic> inputList) {
  List<String> result = [];

  for (String item in inputList) {
    // Split the string using '|' as a separator
    List<String> parts = item.split('|');

    // Extract the part after '|' and trim to remove leading/trailing spaces
    if (parts.length > 1) {
      result.add(parts[1].trim());
    }
  }

  return result;
}