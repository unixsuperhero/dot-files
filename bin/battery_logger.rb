#!/Users/MacbookPro/.rbenv/shims/ruby

require 'date'

class BatteryLogger
  def self.check
    log = `pmset -g log`
    last_type = nil
    last_time = nil
    log.lines.last(300).map{|l|
      time = l[0,24]
      domain = l[25,20]
      info = l[48,999]
      #puts time.sub(/\s*E[SD]T?\s*/, '')
      next unless time[/^\d+\/\d+\/\d+/]
      dt = DateTime.strptime(time.sub(/\s*E[SD]T?\s*/, ''), '%m/%d/%y, %H:%M:%S %p')
      charge = info[/Charge:\d+%/]
      power_type = info[/Using (AC|Batt)/]

      if domain[/Sleep/]
        next [
          dt,
          last_time && '%dsec' % (dt - last_time),
          power_type || last_type
        ]
        last_time = nil
      end

      if domain[/Wake\s*$/]
        next [
          dt,
          last_time && '%dsec' % (dt - last_time),
          power_type || last_type
        ]
        last_time = dt
      end

      if domain[/Start\s*$/]
        next [
          dt,
          last_time && '%dsec' % (dt - last_time),
          power_type || last_type
        ]
        last_time = dt
      end

      if power_type
        next [
          dt,
          last_time && '%dsec' % (dt - last_time),
          power_type || last_type
        ]
        last_time = dt
      end

      if power_type && power_type != last_type
        last_type = power_type
        next [
          dt,
          power_type,
          domain,
          charge
        ]
      end
      #next unless domain.strip[/Start$|Wake$|Sleep$/]
      #[
      #  dt,
      #  last_type,
      #  domain,
      #  charge
      #]
    }.compact
  end
end

puts BatteryLogger.check
# vim: ft=ruby
