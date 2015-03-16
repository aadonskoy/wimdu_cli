class Place < ActiveRecord::Base
  after_save :ready_check

  def property_type_str
    case property_type.to_i
    when 1
      "holiday home"
    when 2
      "apartment"
    when 3
      "private room"
    else
      "undefined type"
    end
  end

  def render_info
    puts <<-TXT
    Title:                 #{title}
    Property type:         #{property_type_str}
    Address:               #{address}
    Nightly rate (in EUR): #{nightly_rate}
    Max guests:            #{max_guests}
    Email:                 #{email}
    Phone number:          #{phone_number}
    ========================================

    TXT
  end

  private

  def ready_check
    self.update_attribute(:ready, true) if !ready && title && property_type && address && nightly_rate && max_guests && email && phone_number
  end
end
