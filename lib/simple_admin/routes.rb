module ActionDispatch::Routing
  class Mapper
    # Contain built-in routes
    #
    # @example
    #
    #   # config/routes.rb
    #
    #   Rails.application.routes.draw do
    #     mount_for_simple_admin
    #   end
    #
    # @since 0.1.2-alpha

    def mount_for_simple_admin
      scope module: :simple_admin do
        namespace :admin do
          root 'system/entities#index'

          get :search, to: 'search#index'

          SimpleAdmin.mount_entities!(self) if ActiveRecord::Base.connection.table_exists?(:simple_admin_entities)

          namespace :system do
            resources :entities
            resources :entity_field_types
            resources :entity_fields, only: %i[create update destroy]
          end
        end
      end
    end
  end
end
