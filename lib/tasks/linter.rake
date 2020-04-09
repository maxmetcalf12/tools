namespace :linter do
  task :lint do
    Rake::Task["linter:reek"].execute
    Rake::Task["linter:rubocop"].execute
  end

  task :rubocop do
    dirty_files = %x(git diff --name-only --diff-filter=d master...#{`git branch | grep  ^*|cut -d' ' -f2`.chomp}).split("\n")
    system("rubocop --config .rubocop.yml --parallel #{dirty_files.join(' ')}")
  end

  task :rubocop_local do
    dirty_files = %x(git diff --name-only --diff-filter=d master...#{`git branch | grep  ^*|cut -d' ' -f2`.chomp}).split("\n")
    system("rubocop --config .rubocop_strict.yml --parallel #{dirty_files.join(' ')}")
  end

  task :rubocop_correct do
    dirty_files = %x(git diff --name-only --diff-filter=d master...#{`git branch | grep  ^*|cut -d' ' -f2`.chomp}).split("\n")
    system("rubocop --config .rubocop.yml #{dirty_files.join(' ')} --auto-correct")
  end

  task :reek do
    dirty_files = %x(git diff --name-only --diff-filter=d master...#{`git branch | grep  ^*|cut -d' ' -f2`.chomp}).split("\n")
    system("reek #{dirty_files.join(' ')}")
  end
end
