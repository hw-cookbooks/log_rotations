node[:log_rotations].each do |log|
  log = Mash.new(log)
  skip = false

  %w(name path).each do |required|
    if(log[required].to_s.empty?)
      Chef::Log.warn "Log Rotations: Missing required field for log rotate: #{required}"
      skip = true
    end
  end

  next if skip

  logrotate_app log[:name] do
    path log[:path]
    template        log[:template] || "logrotate.erb"
    cookbook        log[:cookbook] || "logrotate"
    frequency       log[:frequency] || "weekly"
    rotate          log[:rotate] || 30
    create          log[:create] || "644 root root"
    sharedscripts   log[:sharedscripts] || false
    postrotate      log[:postrotate] unless log[:postrotate].nil?
    options log[:options] || ["missingok", "compress", "delaycompress", "copytruncate", "notifempty"]
    template_mode   log[:template_mode] || "0644"
    size            log[:size] || "300k"
  end
end
