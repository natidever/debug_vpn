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

  static String chicagoConf = "chicago.conf";
  static String frankfurtConf = "frankfurt.conf";
  static String londonConf = "london.conf";
  static String losAngelesConf = "los_angeles.conf";
  static String newYorkConf = "new_york.conf";
  static String seoulConf = "seoul.conf";
  static String singaporeConf = "singapore.conf";
  static String sydneyConf = "sydney.conf";
  static String tokyoConf = "tokyo.conf";
  static String torontoConf = "toronto.conf";

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
[Interface]
PrivateKey = ${config['private_key']}
Address = ${config['address']}
DNS = ${config['dns']}
[Peer]
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
