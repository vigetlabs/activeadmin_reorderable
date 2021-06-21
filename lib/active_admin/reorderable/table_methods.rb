module ActiveAdmin
  module Reorderable
    module TableMethods

      def reorder_column
        column '', :class => 'reorder-handle-col' do |resource|
          reorder_handle_for(resource)
        end
      end

      private

      def reorder_handle_for(resource)
        aa_resource   = active_admin_namespace.resource_for(resource.class)
        url = aa_resource.route_builder.member_action_path(:reorder, resource)

        span(reorder_handle_content, :class => 'reorder-handle', 'data-reorder-url' => url, 'data-reorder-id' => resource.id)
      end

      def reorder_handle_content
        '&equiv;&equiv;'.html_safe
      end

    end

    ::ActiveAdmin::Views::TableFor.send(:include, TableMethods)
  end
end

