COLLECTORS_SETTINGS = {
  log_file: Rails.root.to_s + '/log/collectors.log',
  collectors: { 
    facebook: {
      client_id: '163760763730014',
      secret: '7418ab547b48d3c332fa191951f12051',
      request_limit: 100
    },
    googleplus: {
      api_key: 'AIzaSyAtcM5LzU-c08EYP1zu-LLeobym1VBA5iI',
      client_id: '555964011827.apps.googleusercontent.com',
      secret: 'drpU40BNnDpKi3qMNDxQO9Qy',
      request_limit: 100
    } 
  }
}
