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
end
