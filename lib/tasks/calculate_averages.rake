namespace :calc do
  desc 'Makes the calculations for Categories'
  task cat: :environment do
    puts 'Going to Calculate the categories'
    Category.find_each do |category|
      category.average = category.country_sector_categories.average(:score)
      category.max = category.country_sector_categories.maximum(:score)
      category.min = category.country_sector_categories.minimum(:score)
      category.save!
      puts 'Finished category ' + category.name
    end
  end

  desc 'Makes calculations for subcategories'
  task subcat: :environment do
    puts 'Going to Calculate the subcategories'
    Subcategory.find_each do |subcategory|
      subcategory.average = subcategory.country_sector_subcategories.average(:score)
      subcategory.max = subcategory.country_sector_subcategories.maximum(:score)
      subcategory.min = subcategory.country_sector_subcategories.minimum(:score)
      subcategory.save!
      puts 'Finished subcategory ' + subcategory.name
    end
  end

  desc 'Makes calculations for composite'
  task composite: :environment do
    puts 'Going to Calculate the composite'
    composite = Composite.first_or_create
    composite.average = CountrySector.all.average(:score)
    composite.max = CountrySector.all.maximum(:score)
    composite.min = CountrySector.all.minimum(:score)
    composite.save!
  end

  desc 'Makes calculations for indicators'
  task indicator: :environment do
    puts 'Going to Calculate the indicators'
    Indicator.find_each do |indicator|
      indicator.average = indicator.country_sector_indicators.average(:score)
      indicator.max = indicator.country_sector_indicators.maximum(:score)
      indicator.min = indicator.country_sector_indicators.minimum(:score)
      indicator.save!
      puts 'Finished indicator ' + indicator.name
    end
  end

  desc 'Makes all the calculations'
  task all: :environment do
    Rake::Task['calc:cat'].execute
    Rake::Task['calc:subcat'].execute
    Rake::Task['calc:composite'].execute
    Rake::Task['calc:indicator'].execute
  end
end
