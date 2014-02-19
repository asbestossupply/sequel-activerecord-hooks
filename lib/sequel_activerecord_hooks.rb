module Sequel
  module Plugins
    module ActiverecordHooks
      def self.apply(model)
         model.plugin :hook_class_methods
      end
      module ClassMethods
        Model::HOOKS.each{|h| class_eval("def #{h}(method = nil, params = nil, &block); add_hook(:#{h}, method, params, &block) end", __FILE__, __LINE__)}

        private
        def add_hook(hook, tag, params = OPTS, &block)
          unless block
            (raise Error, 'No hook method specified') unless tag
            block = proc { send tag }
          end

          block = proc { block if !params[:if] || send(params[:if])}

          h = @hooks[hook]
          if tag && (old = h.find{|x| x[0] == tag})
            old[1] = block
          else
            if hook.to_s =~ /^before/
              h.unshift([tag,block])
            else
              h << [tag, block]
            end
          end
        end
      end
    end
  end
end