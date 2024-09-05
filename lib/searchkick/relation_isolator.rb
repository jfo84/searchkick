module Searchkick
  module RelationIsolator
    module IsolatedLoad
      def load
        ActiveRecord::Base.transaction(isolation: :read_uncommitted) do
          super
        end
      end
    end

    def self.isolate(relation)
      relation.singleton_class.prepend(IsolatedLoad)
      relation
    end
  end
end
