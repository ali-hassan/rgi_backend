# frozen_string_literal: true
ActiveAdmin.register CountrySector do
  menu parent: 'Global', priority: 3
  #navigation_menu :admin

  belongs_to :country, optional: true
  belongs_to :sector, optional: true
  includes :country, :sector

  permit_params :score, :description, :rank, :performance_title, :performance_highlights_top,
                :performance_highlights_bottom, :graph_type, :graph_text, :comparison_title,
                :comparison_description, :footnote,
                special_institutions_attributes: [:id, :institution_type, :title,
                                                  :description, :_destroy, :name, :percentage, :revenue_value,
                                                  :revenue_unit, :score, :rank_1, :rank_2],
								bubble_graph_attributes: [:x, :y, :size, :color],
								pl_graph_attributes: [:practice, :law, :gap],
								direction_graph_attributes: [:id, :_destroy, direction_scores_attributes: [:issue, :score, :direction, :id, :_destroy]]

  index do
    column :country
    column :sector
    column :score
    column :rank
    column :updated_at
    actions
  end

  filter :country
  filter :sector, as: :check_boxes
  filter :score
  filter :updated_at

  sidebar 'Components', only: :show do
    attributes_table_for resource do
      ul do
        resource.country_sector_categories.collect do |csc|
          li link_to(csc.category.name, country_sector_category_path(csc.id))
        end
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    tabs do
      tab 'Basic' do
        f.inputs 'Basic Information' do
          f.input :country, input_html: { disabled: true }
          f.input :sector, input_html: { disabled: true }
          f.input :description, as: :ckeditor, input_html: { ckeditor: { height: 400 } }
        end
      end

      tab 'Values' do
        f.inputs 'Values' do
          f.input :score
          f.input :rank
        end
      end

      tab 'Performance' do
        f.inputs 'Performance' do
          f.input :performance_title
          f.input :performance_highlights_top, as: :ckeditor, input_html: { ckeditor: { height: 120 } }
          f.input :performance_highlights_bottom, as: :ckeditor, input_html: { ckeditor: { height: 200 } }
        end
      end

      if f.object.country.sectors.count > 1
        tab 'Comparison' do
          f.inputs 'Comparison' do
            f.input :comparison_title
            f.input :comparison_description, as: :ckeditor, input_html: { ckeditor: { height: 300 } }
          end
        end
      end

      tab 'Graphs' do
        f.inputs 'Graphs' do
          f.input :graph_type, as: :select, collection: GraphType.list
          if f.object.graph_type.present?
            f.input :graph_text, as: :ckeditor, input_html: { ckeditor: { height: 200 } }
          end
        end

        f.inputs "#{GraphType::POPULATION} graph", for: [:bubble_graph, country_sector.bubble_graph || BubbleGraph.new] do |g|
        	g.input :x
        	g.input :y
        	g.input :size
        	g.input :color
        end

        f.inputs "#{GraphType::PERFORMANCE} graph", for: [:pl_graph, country_sector.pl_graph || PlGraph.new] do |g|
        	g.input :practice
        	g.input :law
        	g.input :gap
        end

        f.inputs "#{GraphType::DIRECTION} graph", for: [:direction_graph, country_sector.direction_graph || DirectionGraph.new] do |g|
        	g.has_many :direction_scores, allow_destroy: true, heading: 'Directions' do |a|
      			a.input :issue
      			a.input :score
      			a.input :direction
      		end
        end
      end

      tab 'Institutions' do
        f.inputs 'Institutions' do
          f.has_many :special_institutions, allow_destroy: true, new_record: 'Add Institution' do |a|
            a.input :institution_type, collection: SpecialInstitutionTitle.list
            a.input :title
            a.input :description, as: :ckeditor, input_html: { ckeditor: { height: 100 } }
            a.input :name
            a.input :percentage
            a.input :revenue_value
            a.input :revenue_unit
            a.input :score
            a.input :rank_1
            a.input :rank_2
          end
        end
      end

      tab 'Footnote' do
        f.inputs 'Footnote' do
          f.input :footnote, as: :ckeditor, input_html: { ckeditor: { height: 100 } }
        end
      end
    end
    f.actions
  end

  show do |f|
    attributes_table do
      row :country
      row :sector
      row :score
      row :rank
      row :description
      row :performance_title
      row :performance_highlights_top
      row :performance_highlights_bottom
      if f.country.sectors.count > 1
        row :comparison_title
        row :comparison_description
      end
      row :graph_type
      row :footnote
    end
  end
end
