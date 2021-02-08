namespace :framework do
  desc 'Fixes the questions data'
  task fix_questions: :environment do
    filename = File.expand_path(Rails.root.join('db', 'files', 'framework.csv'))
    puts '* Loading framework... *'

    answer_types = { 'A' => 'ZERO (A)', 'B' => 'ONE (B)', 'C' => 'TWO (C)',
                     'D' => 'THREE (D)', 'E' => 'FOUR (E)', 'F' => 'FIVE (F)', 'G' => 'SIX (G)' }

    CSV.foreach(filename, col_sep: ',', row_sep: :auto, headers: true, encoding: 'UTF-8') do |row|
      data_row = row.to_h

      next unless data_row['Type'] == 'QUESTION'

      question_number = data_row['Number']
      @question = Question.find_by(number: question_number)

      puts "Question: #{question_number}"

      answer_types.each do |answer_hash|
        answer_name = data_row[answer_hash[1]]
        if answer_name.present?
          answer_value = data_row["SCORE_PARAM_#{answer_hash[0]}"]
          answer = Answer.where(question_id: @question.id, value_string: answer_hash[0]).first_or_create!
          answer_value = nil if answer_value.eql?('.')
          answer.update_columns name: answer_name, value_number: answer_value
        end
      end
    end
  end
end
