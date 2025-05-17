function auth() {
  var username = 'user';
  var password = 'pass';
  var encoded = java.util.Base64.getEncoder().encodeToString((username + ':' + password).getBytes());
  return 'Basic ' + encoded;
}
