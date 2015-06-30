module MST
  module Persistable
    extend ActiveSupport::Concern

    included do

      field :deleted, type: Boolean, default: false
      field :deleted_at, type: Time
      field :recovered_at, type: Time

      default_scope -> { where(:deleted.in => [nil, false]) }

      scope :with_deleted, -> { self.unscoped.where(:deleted.in => [nil, false, true]) }
      scope :only_deleted, -> { self.unscoped.where(deleted: true) }

      def destroy
        self.set(:deleted => true)
        self.set(:deleted_at, Time.now)
      end

      def recover
        self.set(:deleted => false)
        self.set(:recovered_at, Time.now)
      end

    end
  end
end
