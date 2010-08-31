module FactoryGirl
  class Proxy #:nodoc:
    class Create < Build #:nodoc:
      def result
        run_callbacks(:after_build)
        if @instance.respond_to?(:save!)
          @instance.save!
        else
          @instance.save or raise RuntimeError.new("Could not save #{@instance.inspect}")
        end
        run_callbacks(:after_create)
        @instance
      end
    end
  end
end
