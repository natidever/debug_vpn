class ServerConfigs {
  static String chicago = '''''';
  static String frankfurt = '''''';
  static String london = '''''';
  static String losAngeles = '''''';
  static String newYork = '''''';
  static String seoul = '''''';
  static String singapore = '''''';
  static String sydney = '''''';
  static String tokyo = '''''';
  static String toronto = '''''';

  static void extractConfigs(Map<String, dynamic> serverConfigs) {
    chicago = formatConfig(serverConfigs['Chicago']);
    frankfurt = formatConfig(serverConfigs['Frankfurt']);
    london = formatConfig(serverConfigs['London']);
    losAngeles = formatConfig(serverConfigs['Los Angeles']);
    newYork = formatConfig(serverConfigs['New York']);
    seoul = formatConfig(serverConfigs['Seoul']);
    singapore = formatConfig(serverConfigs['Singapore']);
    sydney = formatConfig(serverConfigs['Sydney']);
    tokyo = formatConfig(serverConfigs['Tokyo']);
    toronto = formatConfig(serverConfigs['Toronto']);
  }

  static String formatConfig(Map<String, dynamic> config) {
    return '''
PrivateKey = ${config['private_key']}
Address = ${config['address']}
DNS = ${config['dns']}
PublicKey = ${config['public_key']}
Endpoint = ${config['endpoint']}
AllowedIPs = ${config['allowed_ips']}
PersistentKeepalive = ${config['persistent_keepalive']}
''';
  }

  // "private_key": "yDuhRGxjkZM1hvI6zS1w3K1GUhHSQGrQwVZCfA/qrHM",
//         "address": "10.64.65.172/32",
//         "dns": "8.8.8.8",
//         "public_key": "3HzXuHa6GZHgCDoW6xNPr8+iI2VjZqpBCqnAYW0hSgE",
//         "endpoint": "45.77.248.155:51820",
//         "allowed_ips": "0.0.0.0/0",
//         "persistent_keepalive": 25,
//         "device_id": "automatedTestDeviceId"
}
