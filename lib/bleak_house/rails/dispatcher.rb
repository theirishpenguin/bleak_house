
# Override Dispatcher#prepare and Dispatcher#reset_after_dispatch so that each request makes before-and-after usage snapshots.
class Dispatcher
  class << self

    def prepare_application_with_bleak_house
      prepare_application_without_bleak_house
      BleakHouse::Rails::MEMLOGGER.snapshot(BleakHouse::Rails::LOGFILE, 'core rails', BleakHouse::Rails::WITH_SPECIALS)
    end
    alias_method_chain :prepare_application, :bleak_house
    
    def reset_after_dispatch_with_bleak_house
      BleakHouse::Rails::MEMLOGGER.snapshot(BleakHouse::Rails::LOGFILE, BleakHouse::Rails.last_request_name || 'unknown', BleakHouse::Rails::WITH_SPECIALS)
      reset_after_dispatch_without_bleak_house
    end
    alias_method_chain :reset_after_dispatch, :bleak_house

  end
end