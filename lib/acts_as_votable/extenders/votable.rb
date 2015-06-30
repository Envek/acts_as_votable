module ActsAsVotable
  module Extenders

    module Votable

      def votable?
        false
      end

      def acts_as_votable(options={})

        default_options = {
          allow_anonymous: ActsAsVotable.allow_anonymous,
        }

        class_attribute :votable_options
        self.votable_options = default_options.merge!(options)

        require 'acts_as_votable/votable'
        include ActsAsVotable::Votable

        class_eval do
          def self.votable?
            true
          end
        end

      end

    end

  end
end
