module ActionView
  if defined? PartialRenderer
    PartialRenderer.class_eval do
      def render_partial
        locals, view, block = @locals, @view, @block
        object, as = @object, @variable

        if !block && (layout = @options[:layout])
          layout = find_template(layout)
        end

        object ||= locals[as]
        locals[as] = object

        content = @template.render(view, locals) do |*name|
          view._layout_for(*name, &block)
        end

        content = layout.render(view, locals){ content } if layout
        content << "#{@template.inspect}"
      end
    end
  end

  Base.class_eval do
    def render_partial options = {}
      local_assigns = options[:locals] || {}

      case partial_path = options[:partial]
      when String, Symbol, NilClass
        if options.has_key?(:collection)
          render_partial_collection(options)
        else
          partial_template = _pick_partial_template(partial_path)
          partial_content = partial_template.render_partial(self, options[:object], local_assigns)
          partial_content << "app/views/#{partial_template.to_s}"
        end
      when ActionView::Helpers::FormBuilder
        builder_partial_path = partial_path.class.to_s.demodulize.underscore.sub(/_builder$/, '')
        local_assigns.merge!(builder_partial_path.to_sym => partial_path)
        render_partial(:partial => builder_partial_path, :object => options[:object], :locals => local_assigns)
      else
        if Array === partial_path ||
          (defined?(ActiveRecord) &&
           (ActiveRecord::Associations::AssociationCollection === partial_path ||
            ActiveRecord::NamedScope::Scope === partial_path))
          render_partial_collection(options.except(:partial).merge(:collection => partial_path))
        else
          object = partial_path
          render_partial(
            :partial => ActionController::RecordIdentifier.partial_path(object, controller.class.controller_path),
            :object => object,
            :locals => local_assigns
          )
        end
      end
    end
  end
end
