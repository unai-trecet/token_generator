module TokenGenerator
  extend ActiveSupport::Concern

  included do
  end

  DEFAULT_SETTINGS = { block_length: 4, separator: '-', blocks_number: 2, attribute: 'identify' }
  CHARSET = Array('A'..'Z')

  module ClassMethods
    def set_token(settings=nil)
      before_validation do |new_element|
        settings = settings ? settings.reverse_merge(DEFAULT_SETTINGS) : DEFAULT_SETTINGS
        new_element.send("#{ settings[:attribute] }=", create_unique_token(settings)) if new_element.send("#{ settings[:attribute] }").blank?
      end
    end
  end

  def create_unique_token settings

    loop do
      random_token = create_blocks(settings)
      break random_token unless self.class.exists?("#{ settings[:attribute].to_sym }": random_token)
    end
  end

  def create_blocks(settings)
    blocks = []
    settings[:blocks_number].times{ blocks << create_block(settings[:block_length]) }
    blocks.join(settings[:separator])
  end

  def create_block(length)
    Array.new(length) { CHARSET.sample }.join
  end

end
