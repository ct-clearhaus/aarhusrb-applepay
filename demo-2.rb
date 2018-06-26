#!/usr/local/env ruby

pp   t = JSON.parse(File.read('/tmp/demo/token.json')); nil

puts r = File.read('/tmp/demo/backend/ca-certificate.pem'); nil

pp   c = Pedicel::DEFAULT_CONFIG.merge(trusted_ca_pem: r).merge(replay_threshold_seconds: 999999999); nil

pp   p = Pedicel::EC.new(t, config: c); nil

puts p.decrypt(private_key: File.read('/tmp/demo/client/client-key.pem'), certificate: File.read('/tmp/demo/client/client-certificate.pem')); nil
